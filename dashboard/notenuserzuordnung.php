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
    $smarty->assign('zusammenstellung_edit', $zsid);
  }
  
    $result_head = $db->query("SELECT bezeichnung FROM jumi_noten_zusammenstellung WHERE zsid=$zsid");
    $row_head    = $result_head->fetch_array();
    $smarty->assign('notenzuordnung_bezeichnung', $row_head['bezeichnung']);

      # Nicht zugewiesene User
      $query = "SELECT csid, vorname, nachname
                   FROM jumi_chor_saenger
                  WHERE csid NOT IN (SELECT csid FROM jumi_noten_zus_saenger_zuord WHERE zsid=$zsid)
                  ORDER BY nachname ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
        $table_data[]      = $row;
      }
      if(isset($table_data)){
       $smarty->assign('table_data', $table_data);
      }
      
      # Zugewiesene Rechte
      $query1 = "SELECT csid, vorname, nachname
                   FROM jumi_chor_saenger
                  WHERE csid IN (SELECT csid FROM jumi_noten_zus_saenger_zuord WHERE zsid=$zsid)
                  ORDER BY nachname ASC";
      
      $result1 = $db->query($query1) or die("Cannot execute query1");
      
      while ($row1 = $result1->fetch_array()) {
        $table_data1[]      = $row1;
      }
      if(isset($table_data1)){
       $smarty->assign('table_data1', $table_data1);
      }
    
}

$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
