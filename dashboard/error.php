<?php
## INDEX gegen DB
if (!isset($_SESSION)) {
    session_start();
}
#$_SESSION['sessionid'] = session_id();
include_once '../classes/TestProjektSmarty.class_subdir.php';
#require_once("../config.inc.php");
$smarty       = new SmartyAdmin();
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";

$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?> 
