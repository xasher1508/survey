<?php
if (!isset($_SESSION)) {
    session_start();
}
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once("../config.inc.php");
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
$smarty       = new SmartyAdmin();
if(!rechte('verteilerlisten.php', $uid)){
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
    $mvid = $_GET['edit'];
    $smarty->assign('verteiler_edit', $mvid);
  }
  
    $result_head = $db->query("SELECT bezeichnung FROM jumi_mailverteiler WHERE mvid=$mvid");
    $row_head    = $result_head->fetch_array();
    $smarty->assign('verteiler_bezeichnung', $row_head['bezeichnung']);

      # Nicht zugewiesene User
      $query = "SELECT mveid, vorname, nachname
                   FROM jumi_mailverteiler_entries
                  WHERE mveid NOT IN (SELECT mveid FROM jumi_mailverteiler_user_zuord WHERE mvid=$mvid)
                  ORDER BY nachname ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
        $table_data[]      = $row;
      }
      $smarty->assign('table_data', $table_data);
      
      # Zugewiesene Rechte
      $query1 = "SELECT mveid, vorname, nachname
                   FROM jumi_mailverteiler_entries
                  WHERE mveid IN (SELECT mveid FROM jumi_mailverteiler_user_zuord WHERE mvid=$mvid)
                  ORDER BY nachname ASC";
      
      $result1 = $db->query($query1) or die("Cannot execute query1");
      
      while ($row1 = $result1->fetch_array()) {
        $table_data1[]      = $row1;
      }
      $smarty->assign('table_data1', $table_data1);
    
}

$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>

