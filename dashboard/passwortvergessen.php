<?php
## INDEX gegen DB
if(!isset($_SESSION)) { session_start(); }

include_once '../classes/TestProjektSmarty.class_subdir.php';
#require_once("../config.inc.php");
require_once("../config/datenbankanbindung.php");
$smarty = new SmartyAdmin();
$templatename = substr(basename($_SERVER['PHP_SELF']),0,-3)."html";
require_once "../language/german.inc.php";
# https://www.php-einfach.de/experte/php-codebeispiele/loginscript/passwort-vergessen/

$action = $_GET['action'];
if($action == ''){

}


$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?>
