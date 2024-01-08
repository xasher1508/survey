<?php
if(!isset($_SESSION)) { session_start(); }

include_once '../classes/TestProjektSmarty.class_subdir.php';
$_SESSION['cur_page'] = $_SERVER['PHP_SELF']; // Fals man Seite direkt aufruft und Autologin funktioniert
require_once("../config.inc.php");
$smarty       = new SmartyAdmin();
if(!rechte(basename(__FILE__), $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";


if (isset($_GET['action'])) {
  $action = $_GET['action'];
} else {
  $action = '';
}


if ($action == '') {

  $query1 = "SELECT pid, beschreibung, wert
               FROM jumi_parameter
              ORDER BY pid ASC";
  
  $result1 = $db->query($query1) or die("Cannot execute query1");
  
  
  while ($row1 = $result1->fetch_array()) {
      # Passwort für die Praxisstellen wird verschlüsselt gespeichert
      
      if(!isset($zaehler) or $zaehler == 1){
        $zaehler = 0;
      }else{
        $zaehler = 1;
      }
    $row1['zaehler']         = $zaehler;
    $table_data1[]           = $row1;
  }
  
  $smarty->assign('table_data1', $table_data1);
}

if($action == 'save'){


    $query2 = "SELECT pid
                 FROM jumi_parameter
                ORDER BY pid ASC";
    $result2 = $db->query( $query2)
              or die ("Cannot execute query2");

    while ($row2 = $result2->fetch_array()){
      $pid = $row2['pid'];
      $pid_value = $_POST[$pid];
      
      
      $sql1 = $db->query( "UPDATE jumi_parameter 
                              SET wert = '$pid_value'
                            WHERE pid = $pid
                         " );
                       
    }                       
      
      if(!$sql1){
        $error = TRUE;
        $error_reason .= "Fehler beim Update [jumi_parameter]<br>";
      }else{
        $error = FALSE;
        $smarty->assign('parameter_inserterr', "2");
        echo "<meta http-equiv=\"refresh\" content=\"2; URL=".$_SERVER['PHP_SELF'] ."?\">";
      }

      if($error){ 
        $smarty->assign('parameter_inserterr', "1");
        $smarty->assign('parameter_reason', "$error_reason");  // Kein Mailversand
      } // Ende IF : Insert hat geklappt
    
}

$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");

?>