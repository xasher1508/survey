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
#require_once("../config.inc.php");
require_once("../config/datenbankanbindung.php");
$smarty = new SmartyAdmin();
$templatename = substr(basename($_SERVER['PHP_SELF']),0,-3)."html";
require_once "../language/german.inc.php";


$action = $_GET['action'];
if($action == ''){
  $uid = $_GET['uid'];
  $code = $_GET['code'];
  $smarty->assign('uid', "$uid");
  $smarty->assign('code', "$code");
  if(!isset($_GET['uid']) || !isset($_GET['code'])) {
   $smarty->assign('error', 1);
   $smarty->assign('error_text', '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Leider wurde beim Aufruf dieser Website kein Code zum Zurücksetzen des Passworts &uuml;bermittelt!</b></div>');
}
#     Token: b9b48563d251d9e52bd1352545747e30
# SHA Token: 76eafa7873f2331794036360414bff2473b66fa6
# localhost/survey/dashboard/passwortzuruecksetzen.php?uid=1&code=b9b48563d251d9e52bd1352545747e30
}


$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");


?>
