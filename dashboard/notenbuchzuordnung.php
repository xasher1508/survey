<?php
if (!isset($_SESSION)) {
    session_start();
}
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once("../config.inc.php");
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
$smarty       = new SmartyAdmin();
if(!rechte('notenbuch.php', $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
require_once "../language/german.inc.php";



if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}


if ($action == '') {
  if (isset($_GET['edit'])) {
    $zsid = $_GET['edit'];
    $smarty->assign('rollen_edit', $zsid);
  }
    $result_head = $db->query("SELECT bezeichnung FROM jumi_noten_zusammenstellung WHERE zsid=$zsid");
    $row_head    = $result_head->fetch_array();
    $smarty->assign('notenbuchzuordnung_bezeichnung', $row_head['bezeichnung']);

      # Nicht zugewiesene Noten
      $query = "SELECT jndid, titel
                  FROM jumi_noten_daten
                 WHERE jndid NOT IN (SELECT jndid FROM jumi_noten_zusammenstellung_zuord WHERE zsid=$zsid)
                 ORDER BY jndid ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
        $table_data[]      = $row;
      }
      $smarty->assign('table_data', $table_data);
      
      # Zugewiesene Noten
      $query1 = "SELECT jndid, titel,anz_lizenzen
                  FROM jumi_noten_daten
                 WHERE jndid IN (SELECT jndid FROM jumi_noten_zusammenstellung_zuord WHERE zsid=$zsid)
                 ORDER BY jndid ASC";
      
      $result1 = $db->query($query1) or die("Cannot execute query2");
      
      while ($row1 = $result1->fetch_array()) {
          $result_rl = $db->query("SELECT $row1[anz_lizenzen]-count(*) Rest
                                     FROM jumi_noten_zus_saenger_zuord
                                    WHERE zsid IN( SELECT zsid FROM jumi_noten_zusammenstellung_zuord WHERE jndid=$row1[jndid])");
          $row_rl    = $result_rl->fetch_array();
        $row1['restlizenz'] = $row_rl['Rest'];
        $table_data1[]      = $row1;
      }
      $smarty->assign('table_data1', $table_data1);
    
}

$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
