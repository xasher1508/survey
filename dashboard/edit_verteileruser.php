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




#require_once "func_genUser.php";

# Wenn Seite neu aufgerufen wird, dann alle Sessions, die mit "bearbeiten_" beginnen löschen
if(isset($_GET['new']) AND $_GET['new'] == 1){;
  $search_prefix = 'anlegen_';
  $search_len = strlen($search_prefix);
  foreach( $_SESSION as $key => $value){
    if ( substr( $key, 0, $search_len) == $search_prefix) {
      unset( $_SESSION[$key]);
    }
  }
}


// Rechteüberprüfung
#$db = dbconnect();
#if ($user_admin == ""){ require("index.php"); exit;} //Wenn man nicht angemeldet ist, darf man nicht auf die Seite
#if(!rore($user_admin,'a_admanleg','RE')){require("lib/rechte.php");exit;}
#// Rechteüberprüfung ende

if(isset($_GET['action'])){
  $action = $_GET['action'];
}else{
  $action = '';
}

if($action == ''){

        $query = "SELECT mveid, vorname, nachname, mail FROM jumi_mailverteiler_entries ORDER BY nachname ASC, vorname ASC";
        $result = $db->query( $query)
                  or die ("Cannot execute query1");

        while ($row = $result->fetch_array()){
         $value[] = $row;
        }
       $smarty->assign('table_data', $value);

}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>

