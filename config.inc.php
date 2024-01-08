<?php
if(!isset($_SESSION)) { session_start(); }  
require_once("config/datenbankanbindung.php");
header('Content-Type: text/html; charset=utf-8');
$db = dbconnect();
require_once("controller/func_get_parameter.php");

$uid = $_SESSION["userid"];
#$login_dateiname = basename($_SERVER['PHP_SELF']);



if(!isset($_SESSION['userid'])) {
    header("location:../controller/admin_login.php");
}


$sql_activity = $db->query("UPDATE jumi_admin
                               SET last_activity = NOW()
                             WHERE uid = '$uid'
                          ");
                          
$template = "modern";

function rechte($curpage, $uid){
  if($curpage == '__noright__'){
    return true;
    exit;
  }
  $db = dbconnect();
  $result_rechte = $db->query("SELECT count(*) Anz
                                 FROM jumi_menu_entries 
                                WHERE lower(link) like lower('$curpage%')
                                  AND meid IN (SELECT DISTINCT meid
                                                 FROM jumi_admin_rollen_rechte_zuord a, jumi_admin_rollen_user_zuord b
                                                WHERE a.rid = b.rid
                                                  AND b.uid = $uid)");
  $row_rechte = $result_rechte->fetch_array();
  if($row_rechte['Anz'] > 0){
    return true;
    exit;
  }else{
    return false;
    exit;
  }
  
}
function rolle($uid){
  $db = dbconnect();
  $result_rolle = $db->query("SELECT rid
                                FROM jumi_admin_rollen_user_zuord
                               WHERE uid = $uid");
  $row_rolle = $result_rolle->fetch_array();
  return $row_rolle['rid'];
}
#---------------------------------------------------------------------------------------------------------------------------------------
?>