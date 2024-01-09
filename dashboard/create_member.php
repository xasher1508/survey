<?php
if (!isset($_SESSION)) {
    session_start();
}
/*
# Fuer debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);
#echo __LINE__."<br>";
*/


include_once '../classes/TestProjektSmarty.class_subdir.php';
$_SESSION['cur_page'] = $_SERVER['PHP_SELF']; // Fals man Seite direkt aufruft und Autologin funktioniert
require_once("../config.inc.php");
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
$smarty       = new SmartyAdmin();
if(!rechte(basename(__FILE__), $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
require_once "../language/german.inc.php";

       if(isset($_GET['editcsid']) and $_GET['editcsid'] != ''){
         # Aus externer Seite edit_user.php
         #echo "<br><br><br><br><br><br><br><br>-----------------------------------------------hier";
         $csid = $_GET['editcsid'];
         $smarty->assign('create_edit', $csid);
         
         $result0 = $db->query("SELECT vorname, nachname, mail, singstimme, bemerkung, einw_livestream, einw_homepage, einw_socialmedia, alter16, date_format(selfreg_date, '%d.%m.%y - %H:%i') selfreg_date_form
                                  FROM jumi_chor_saenger
                                 WHERE csid = $csid;");
         $row0    = $result0->fetch_array();
         $smarty->assign('member_anlegen_vorname', $row0['vorname']);
         $smarty->assign('member_anlegen_nachname', $row0['nachname']);
         $smarty->assign('member_anlegen_mail', $row0['mail']);
         $smarty->assign('member_anlegen_singstimme', $row0['singstimme']);
         $smarty->assign('member_anlegen_bemerkung', $row0['bemerkung']);
         $smarty->assign('member_anlegen_einw_livestream', $row0['einw_livestream']);
         $smarty->assign('member_anlegen_einw_homepage', $row0['einw_homepage']);
         $smarty->assign('member_anlegen_einw_socialmedia', $row0['einw_socialmedia']);
         $smarty->assign('member_anlegen_alter16', $row0['alter16']);
         $smarty->assign('member_anlegen_selfreg_date_form', $row0['selfreg_date_form']);
         $smarty->assign('admin_rolle', rolle($uid));
         
         $query = "SELECT id, filename, originalname, date_format(datum, '%d.%m.%y - %H:%i') uploaddatum FROM jumi_chor_saenger_uploads WHERE csid='$csid' ORDER BY datum DESC";
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
         $smarty->assign('member_anlegen_vorname', '');
         $smarty->assign('member_anlegen_nachname', '');
         $smarty->assign('member_anlegen_mail', '');
         $smarty->assign('member_anlegen_singstimme', '');
         $smarty->assign('member_anlegen_bemerkung', '');
         $smarty->assign('member_anlegen_einw_livestream', '');
         $smarty->assign('member_anlegen_einw_homepage', '');
         $smarty->assign('member_anlegen_einw_socialmedia', '');
         $smarty->assign('member_anlegen_alter16', '');
         $smarty->assign('member_anlegen_selfreg_date_form', '');
         $smarty->assign('admin_rolle', '');
       }

$smarty->display("$template/dashboard/$templatename");
?>