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

        $query = "SELECT csid, vorname, nachname, mail, 
                  CASE 
                  WHEN singstimme = 1 THEN 'Sopran'
                  WHEN singstimme = 2 THEN 'Alt'
                  WHEN singstimme = 3 THEN 'Tenor'
                  WHEN singstimme = 4 THEN 'Bass'
                  END singstimme
        FROM jumi_chor_saenger ORDER BY nachname ASC, vorname ASC;";
        $result = $db->query( $query)
                  or die ("Cannot execute query1");

        while ($row = $result->fetch_array()){
         $value[] = $row;
        }
       $smarty->assign('table_data', $value);
       $smarty->assign('admin_rolle', rolle($uid));

}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
