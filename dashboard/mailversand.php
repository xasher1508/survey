<?php
if (!isset($_SESSION))
{
    session_start();
}
#$_SESSION['sessionid'] = session_id();
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once ("../config.inc.php");
$smarty = new SmartyAdmin();
if(!rechte(basename(__FILE__), $uid))
{
    echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
    exit;
}
$templatename = substr(basename($_SERVER['PHP_SELF']) , 0, -3) . "html";
require_once "../language/german.inc.php";


      # Gespeicherte Rollen
      $query = "SELECT rid, bezeichnung
                   FROM jumi_admin_rolle
                  ORDER BY bezeichnung ASC";
      
      $result = $db->query($query) or die("Cannot execute query");
      
      while ($row = $result->fetch_array()) {
        $table_data[]      = $row;
      }
      $smarty->assign('table_data', $table_data);
      
      # Gespeicherte Verteiler
      $query1 = "SELECT mvid, bezeichnung
                   FROM jumi_mailverteiler
                  ORDER BY mvid ASC";
      
      $result1 = $db->query($query1) or die("Cannot execute query");
      
      while ($row1 = $result1->fetch_array()) {
        $table_data1[]      = $row1;
      }
      $smarty->assign('table_data1', $table_data1);


$smarty->display("modern/dashboard/$templatename");
?>