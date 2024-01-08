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



if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}


if ($action == '') {

      # Gespeicherte Werte
      $query = "SELECT mvid, bezeichnung
                   FROM jumi_mailverteiler
                  ORDER BY mvid ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
        $table_data[]      = $row;
      }
      $smarty->assign('table_data', $table_data);
    
}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");

?>

