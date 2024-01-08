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
/*
  # Daten aufbereiten für Zurückbutton
    if(isset($_SESSION["anlegen_vorname"])){
      $smarty->assign('user_anlegen_vorname', $_SESSION["anlegen_vorname"]);
    }

    if(isset($_SESSION["anlegen_nachname"])){
      $smarty->assign('user_anlegen_nachname', $_SESSION["anlegen_nachname"]);
    }

    if(isset($_SESSION["anlegen_mail"])){
      $smarty->assign('user_anlegen_mail', $_SESSION["anlegen_mail"]);
    }
  # Daten aufbereiten für Zurückbutton ENDE
*/
        $query = "SELECT uid, vorname, nachname, mail, aktiv FROM jumi_admin ORDER BY nachname ASC, vorname ASC";
        $result = $db->query( $query)
                  or die ("Cannot execute query1");

        while ($row = $result->fetch_array()){
        # 4 Neu
        # 3 Deaktiviert
        # 2 Inaktiv
        # 1 Aktiv
         $result1 = $db->query("SELECT Date_format(max(Datum), '%d.%m.%Y - %H:%i') last_login,
                                  CASE
                                      WHEN max(Datum) IS NULL THEN '4'
                                      WHEN (SELECT aktiv FROM jumi_admin WHERE uid='$row[uid]') = 0 THEN '3'
                                      WHEN max(Datum) < DATE_SUB(now(), INTERVAL 6 MONTH) THEN '2'
                                      WHEN max(Datum) > DATE_SUB(now(), INTERVAL 6 MONTH) THEN '1'
                                      ELSE '5'
                                  END status
                                      ,Date_format(last_activity, '%d.%m.%Y - %H:%i') last_activity
                                 FROM jumi_adminlog a, jumi_admin b
                                WHERE a.uid =b.uid
                                  AND a.uid='$row[uid]'");
         $row1 = $result1->fetch_array();

         $row['status'] = $row1['status'];
         $row['last_activity'] = $row1['last_activity'];
         $value[] = $row;
        }
       $smarty->assign('table_data', $value);

}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");
?>
