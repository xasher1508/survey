<?php
## INDEX gegen DB
if (!isset($_SESSION)) {
    session_start();
}
#$_SESSION['sessionid'] = session_id();
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once("../config.inc.php");
$smarty       = new SmartyAdmin();
if(!rechte('__noright__', $uid)){
 echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
 exit;
}
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";



$result_name = $db->query("SELECT vorname, nachname, mail FROM jumi_admin WHERE uid='$uid'");
$row_name    = $result_name->fetch_array();
$smarty->assign('startseite_name', "$row_name[vorname] $row_name[nachname]");


$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?> 
