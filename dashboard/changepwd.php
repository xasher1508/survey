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
require_once("../config.inc.php");
$_SESSION['cur_page'] = $_SERVER['PHP_SELF']; // Fals man Seite direkt aufruft und Autologin funktioniert
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
$smarty       = new SmartyAdmin();
if(!rechte('__noright__', $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
require_once "../language/german.inc.php";


#require_once "func_genUser.php";

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

}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
