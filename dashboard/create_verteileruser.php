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

/*
  # Daten aufbereiten für Zurückbutton
    if(isset($_SESSION["anlegen_vorname"])){
      $smarty->assign('contact_anlegen_vorname', $_SESSION["anlegen_vorname"]);
    }

    if(isset($_SESSION["anlegen_nachname"])){
      $smarty->assign('contact_anlegen_nachname', $_SESSION["anlegen_nachname"]);
    }

    if(isset($_SESSION["anlegen_mail"])){
      $smarty->assign('contact_anlegen_mail', $_SESSION["anlegen_mail"]);
    }
  # Daten aufbereiten für Zurückbutton ENDE
*/
       if(isset($_GET['editmveid']) and $_GET['editmveid'] != ''){
         # Aus externer Seite edit_user.php
         #echo "<br><br><br><br><br><br><br><br>-----------------------------------------------hier";
         $mveid = $_GET['editmveid'];
         $smarty->assign('create_edit', $mveid);
         
         $result0 = $db->query("SELECT vorname, nachname, mail
                                  FROM jumi_mailverteiler_entries
                                 WHERE mveid = $mveid;");
         $row0    = $result0->fetch_array();
         $smarty->assign('contact_anlegen_vorname', $row0['vorname']);
         $smarty->assign('contact_anlegen_nachname', $row0['nachname']);
         $smarty->assign('contact_anlegen_mail', $row0['mail']);
       }else{
         $smarty->assign('create_edit', '');
         $smarty->assign('contact_anlegen_vorname', '');
         $smarty->assign('contact_anlegen_nachname', '');
         $smarty->assign('contact_anlegen_mail', '');
       }
       
        $query = "SELECT mvid, bezeichnung FROM jumi_mailverteiler ORDER BY mvid ASC";
        $result = $db->query( $query)
                  or die ("Cannot execute query1");

        while ($row = $result->fetch_array()){
         if(isset($_GET['editmveid']) and $_GET['editmveid'] != ''){
           # Aus externer Seite edit_user.php
           $mveid = $_GET['editmveid'];
           $result1 = $db->query("SELECT count(*) Anz
                                    FROM jumi_mailverteiler_user_zuord
                                   WHERE mveid = $mveid
                                     AND mvid = $row[mvid]");
           $row1    = $result1->fetch_array();
           if($row1['Anz'] > 0){
             $selected = 1;
           }else{
             $selected = 0;
           }
         }else{
           $selected = 0;
         }
         
         $row['selected'] = $selected;
         $value[] = $row;
        }
       if(isset($value)){
         $smarty->assign('table_data', $value);
       }

$smarty->display("$template/dashboard/$templatename");
?>