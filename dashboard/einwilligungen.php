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

        $query = "SELECT csid, vorname, nachname, einw_livestream, einw_homepage, einw_socialmedia
                    FROM jumi_chor_saenger ORDER BY nachname ASC, vorname ASC";
        $result = $db->query( $query)
                  or die ("Cannot execute query1");

        while ($row = $result->fetch_array()){
       
         if(($row['einw_livestream'] == '' AND $row['einw_homepage'] == '' AND $row['einw_socialmedia'] == '') OR ($row['einw_livestream'] == '0' AND $row['einw_homepage'] == '0' AND $row['einw_socialmedia'] == '0')){
           $bgcolor='red';
         }else{
           $bgcolor='';
         }

         $row['bgcolor'] = $bgcolor;
         $value[] = $row;
        }
       $smarty->assign('table_data', $value);

}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
