<?php
## INDEX gegen DB
if (!isset($_SESSION)) {
    session_start();
}
#$_SESSION['sessionid'] = session_id();
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once("../config.inc.php");
$smarty       = new SmartyAdmin();
if(!rechte('__noright__', $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";
       $smarty->assign('admin_rolle', rolle($uid));
       if(isset($_GET['editjndid']) and $_GET['editjndid'] != ''){
         # Aus externer Seite edit_user.php
         #echo "<br><br><br><br><br><br><br><br>-----------------------------------------------hier";
         $jndid = $_GET['editjndid'];
         $smarty->assign('create_edit', $jndid);
         
         $result0 = $db->query("SELECT a. jndid, titel, liednr, anz_lizenzen, streamlizenz, c.bezeichnung verlag, bemerkung
                                  FROM jumi_noten_daten a, jumi_noten_verlag c
                                 WHERE a.vid=c.vid
                                   AND a.jndid = $jndid
                                 ORDER BY titel ASC;");
         $row0    = $result0->fetch_array();
         $smarty->assign('notenupload_titel', $row0['titel']);
         $smarty->assign('notenupload_liednr', $row0['liednr']);
         $smarty->assign('notenupload_anz_lizenzen', $row0['anz_lizenzen']);
         $smarty->assign('notenupload_streamlizenz', $row0['streamlizenz']);
         $smarty->assign('notenupload_bemerkung', $row0['bemerkung']);
         $smarty->assign('notenupload_verlag', $row0['verlag']);
         
         $query = "SELECT id, filename, originalname, date_format(datum, '%d.%m.%y - %H:%i') uploaddatum FROM jumi_noten_uploads WHERE jndid='$jndid' ORDER BY datum DESC";
         $result = $db->query( $query)
                   or die ("Cannot execute query1");

         while ($row = $result->fetch_array()){
          if (file_exists($row['filename'])) {
            $row['file_exists'] = '1';
          } else {
            $row['file_exists'] = '0';
          }
          $value[] = $row;
         }
         if(isset($value)){
         $smarty->assign('table_data', $value);
         }
       }else{
       $smarty->assign('create_edit', '');
       $smarty->assign('notenupload_titel', '');
       $smarty->assign('notenupload_liednr', '');
       $smarty->assign('notenupload_anz_lizenzen', '');
       $smarty->assign('notenupload_streamlizenz', '');
       $smarty->assign('notenupload_bemerkung', '');
       $smarty->assign('notenupload_verlag', '');
       }


$smarty->display("modern/dashboard/$templatename");
?>