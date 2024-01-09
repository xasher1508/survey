<?php
if (!isset($_SESSION)) {
    session_start();
}
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



      # Gespeicherte Werte
      $query = "SELECT zsid, bezeichnung, lizenzpflicht, anzahl_lizenz
                  FROM jumi_noten_zusammenstellung 
                 ORDER BY bezeichnung ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
      
        $result_rl = $db->query("SELECT $row[anzahl_lizenz]-count(*) Rest
                                   FROM jumi_noten_zus_saenger_zuord
                                  WHERE zsid = $row[zsid];");
        $row_rl    = $result_rl->fetch_array();
        
        $result_anzlied = $db->query("SELECT count(*) Anz_Lied
                                        FROM jumi_noten_zusammenstellung_zuord
                                       WHERE zsid = $row[zsid];");
        $row_anzlied    = $result_anzlied->fetch_array();
        
        $row['restlizenz'] = $row_rl['Rest'];
        $row['Anz_Lied'] = $row_anzlied['Anz_Lied'];
        $table_data[]      = $row;
      }
      $smarty->assign('table_data', $table_data);
      $smarty->assign('admin_rolle', rolle($uid));

$smarty->display("$template/dashboard/$templatename");
?>