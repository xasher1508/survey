<?php
if (!isset($_SESSION)) {
    session_start();
}
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



if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}


if ($action == '') {
    #  if (isset($_GET['edit'])) {
    #    $_SESSION["umfrageerf_status"] = 'edit';
    #    $yid                        = $_GET['edit'];
    #    $_SESSION["umfrageerf_yid"]    = $yid;
    #  } else {
    #    $_SESSION["umfrageerf_status"] = 'neu';
    #  }
    #  
    #  # -- Fehlermeldungen -- #

    if(isset($_GET['new']) AND $_GET['new'] == 1){
echo "hier0<br>";
        unset($_SESSION["umfrageerf_value_datumvon"]);
        unset($_SESSION["umfrageerf_value_zeitvon"]);
        unset($_SESSION["umfrageerf_value_datumbis"]);
        unset($_SESSION["umfrageerf_value_zeitbis"]);
        unset($_SESSION["umfrageerf_value_headline"]);
        unset($_SESSION["umfrageerf_value_freitext"]);
        unset($_SESSION["umfrageerf_value_freitext_headline"]);
        $smarty->assign('umfrageerf_value_freitext', 0);
        unset($_SESSION["umfrageerf_umid"]);
        unset($_SESSION["umfrageerf_ufid"]);
        unset($_SESSION["umfrageerf_uaid"]);
#        $_SESSION["umfrageerf_new"] = 1;
        
    }else{
echo "hier1<br>";
        if(isset($_GET['edit']) AND $_GET['edit'] == 1){
echo "hier2<br>";
          $umid = $_GET['umid'];
          
          $_SESSION["umfrageerf_umid"] = $umid;
          $result_edit = $db->query("SELECT date_format(datum_von, '%d.%m.%Y') datum_von
                                          , date_format(datum_von, '%H:%i') zeit_von
                                          , date_format(datum_bis, '%d.%m.%Y') datum_bis
                                          , date_format(datum_bis, '%H:%i') zeit_bis
                                          , headline
                                          , freitext
                                          , freitext_headline
                                       FROM jumi_umfragen
                                      WHERE umid = $umid");
          $row_edit    = $result_edit->fetch_array();
          if(isset($row_edit["datum_von"])){
          $_SESSION["umfrageerf_value_datumvon"] = $row_edit['datum_von'];
          }
          
          if(isset($row_edit["zeit_von"])){
          $_SESSION["umfrageerf_value_zeitvon"] = $row_edit['zeit_von'];
          }
          if(isset($row_edit["datum_bis"])){
          $_SESSION["umfrageerf_value_datumbis"] = $row_edit['datum_bis'];
          }
          
          if(isset($row_edit["zeit_bis"])){
          $_SESSION["umfrageerf_value_zeitbis"] = $row_edit['zeit_bis'];
          }
                    
          if(isset($row_edit["headline"])){
          $_SESSION["umfrageerf_value_headline"] = $row_edit['headline'];
          }
          
          if(isset($row_edit["freitext"])){
          $_SESSION["umfrageerf_value_freitext"] = $row_edit['freitext'];
          }
          
          if(isset($row_edit["freitext_headline"])){
          $_SESSION["umfrageerf_value_freitext_headline"] = $row_edit['freitext_headline'];
          }
          
          # Erste Frage selektieren, damit der Reiter für die Frage gleich aktiv ist
          $result_q1 = $db->query("SELECT min(ufid) ufid
                                       FROM jumi_umfragen_fragen
                                      WHERE umid = $umid");
          $row_q1    = $result_q1->fetch_array();
          $row_edit["umfrageerf_ufid"] = $row_q1['ufid'];
        }
        
        if(isset($_SESSION["umfrageerf_value_datumvon"])){
        $smarty->assign('umfrageerf_value_datumvon', $_SESSION["umfrageerf_value_datumvon"]);
        }else{
        $smarty->assign('umfrageerf_value_datumvon', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_datumvon"])){
        $smarty->assign('umfrageerf_value_zeitvon', $_SESSION["umfrageerf_value_zeitvon"]);
        }else{
        $smarty->assign('umfrageerf_value_zeitvon', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_datumbis"])){
        $smarty->assign('umfrageerf_value_datumbis', $_SESSION["umfrageerf_value_datumbis"]);
        }else{
        $smarty->assign('umfrageerf_value_datumbis', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_zeitbis"])){
        $smarty->assign('umfrageerf_value_zeitbis', $_SESSION["umfrageerf_value_zeitbis"]);
        }else{
        $smarty->assign('umfrageerf_value_zeitbis', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_headline"])){
        $smarty->assign('umfrageerf_value_headline', $_SESSION["umfrageerf_value_headline"]);
        }else{
        $smarty->assign('umfrageerf_value_headline', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_freitext"])){
        $smarty->assign('umfrageerf_value_freitext', $_SESSION["umfrageerf_value_freitext"]);
        }else{
        $smarty->assign('umfrageerf_value_freitext', '');
        }
        
        if(isset($_SESSION["umfrageerf_value_freitext_headline"])){
        $smarty->assign('umfrageerf_value_freitext_headline', $_SESSION["umfrageerf_value_freitext_headline"]);
        }else{
        $smarty->assign('umfrageerf_value_freitext_headline', '');
        }
        
#        $smarty->assign('umfrageerf_value_new', "0");
#        $_SESSION["umfrageerf_new"] = 0;
      }        
    
    $smarty->assign('umfrageerf_error', 0);
    if (isset($_GET['error'])) {
        
        $errorno = $_GET['error'];
        
        $smarty->assign('umfrageerf_error', 1);
        
        if ($errorno == 1) {
            # Pflichtfelder
            $smarty->assign('umfrageerf_error_text', "Bitte füllen Sie alle Felder aus");
        }
        if ($errorno == 2) {
            # Datumsformat
            $smarty->assign('umfrageerf_error_text', "Ein Datumsformat ist falsch");
        }
    } 

    #  
    #  # --- Wenn Werte editiert werden ------------
    #  if ($_SESSION["umfrageerf_status"] == 'edit') {
    #    $result_edit = $db->query("SELECT yid, date_format(datum, '%d.%m.%Y') datum, date_format(datum, '%H:%i') zeit, url
    #                                 FROM jumi_youtube_termine
    #                                WHERE yid = $yid");
    #    $row_edit    = $result_edit->fetch_array();
    #    $smarty->assign('umfrageerf_value_datum', "$row_edit[datum]");
    #    $smarty->assign('umfrageerf_value_zeit', "$row_edit[zeit]");
    #    $smarty->assign('umfrageerf_value_url', "$row_edit[url]");
    #    
    #  }
    #  # --- Wenn Werte editiert werden Ende -------
    #  
    #  if ($_GET['editende'] == 1) {
    #    # Editieren ist beendet, als ein update auf einen Datensatz. Dann ist der status wieder Neu, damit wird wieder ein Insert durchgefÃ¼hrt
    #    $_SESSION["umfrageerf_status"] = 'neu';
    #  }
    #  
    #  
    #  # Gespeicherte Werte
    #  $query1 = "SELECT yid, date_format(datum, '%d.%m.%Y') datum_form, date_format(datum, '%H:%i') zeit, url
    #               FROM jumi_youtube_termine
    #              WHERE datum > DATE_SUB( NOW() , INTERVAL 14 DAY )
    #              ORDER BY datum desc, zeit ASC";
    #  
    #  $result1 = $db->query($query1) or die("Cannot execute query1a");
    #  
    #  while ($row1 = $result1->fetch_array()) {
    #    $table_data1[]      = $row1;
    #  }
    #  $smarty->assign('table_data1', $table_data1);
    
}


if ($action == 'fragen') {

    $umid = $_SESSION["umfrageerf_umid"];

    # Focus/Session setzen
    $result = $db->query("SELECT count(*) Anz FROM jumi_umfragen_fragen WHERE umid='$umid'");
    $row    = $result->fetch_array();
    # Wenn man bei mehreren Fragen eine Frage löscht ist Anz nicht 0 und der Focus sitzt bei Antwort
    if ((isset($umid) AND $umid == '') or (isset($_GET['tabufid']) AND $_GET['tabufid'] == "neuefrage") or (isset($row['Anz']) AND $row['Anz'] == '0')) {
        $smarty->assign('umfrageerf_focus', "frage");
#        unset($_SESSION["umfrageerf_ufid"]);
#        unset($_SESSION["umfrageerf_uaid"]);
    } else {
        $smarty->assign('umfrageerf_focus', "antwort");
    }
    
    
    if (isset($_POST['datumvon']) and $_POST['datumvon'] != '') {
        $datumvon                              = $_POST['datumvon'];
        $_SESSION["umfrageerf_value_datumvon"] = $datumvon;
    } else {
        if ($_SESSION["umfrageerf_value_datumvon"] == '') {
            echo "<meta http-equiv=\"refresh\" content=\"3; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
        }
        $datumvon = $_SESSION["umfrageerf_value_datumvon"];
    }
    
    if (isset($_POST['zeitvon']) and $_POST['zeitvon'] != '') {
        $zeitvon                              = $_POST['zeitvon'];
        $_SESSION["umfrageerf_value_zeitvon"] = $zeitvon;
    } else {
        if ($_SESSION["umfrageerf_value_zeitvon"] == '') {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
        }
        $zeitvon = $_SESSION["umfrageerf_value_zeitvon"];
    }
    
    if (isset($_POST['datumbis']) and $_POST['datumbis'] != '') {
        $datumbis                              = $_POST['datumbis'];
        $_SESSION["umfrageerf_value_datumbis"] = $datumbis;
    } else {
        if ($_SESSION["umfrageerf_value_datumbis"] == '') {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
        }
        $datumbis = $_SESSION["umfrageerf_value_datumbis"];
    }
    
    if (isset($_POST['zeitbis']) and $_POST['zeitbis'] != '') {
        $zeitbis                              = $_POST['zeitbis'];
        $_SESSION["umfrageerf_value_zeitbis"] = $zeitbis;
    } else {
        if ($_SESSION["umfrageerf_value_zeitbis"] == '') {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
        }
        $zeitbis = $_SESSION["umfrageerf_value_zeitbis"];
    }
    
    if (isset($_POST['headline']) and trim($_POST['headline']) != '') {
        $headline                              = trim($_POST['headline']);
        $_SESSION["umfrageerf_value_headline"] = $headline;
    } else {
        if ($_SESSION["umfrageerf_value_headline"] == '') {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
        }
        $headline = $_SESSION["umfrageerf_value_headline"];
    }
    
    if(!isset($_GET['erfassen'])){
      if (isset($_POST['freitext']) and trim($_POST['freitext']) != '') {
          $freitext                              = '1';
          $_SESSION["umfrageerf_value_freitext"] = $freitext;
      }else{
          $freitext                              = '0';
          $_SESSION["umfrageerf_value_freitext"] = $freitext;
      }
    }else{
        $freitext = $_SESSION["umfrageerf_value_freitext"];
    }
    
    if($freitext == '1'){
      if (isset($_POST['freitext_headline']) and trim($_POST['freitext_headline']) != '') {
          $freitext_headline = $_POST['freitext_headline'];
          $_SESSION["umfrageerf_value_freitext_headline"] = $freitext_headline;
      }else{
          $_SESSION["umfrageerf_value_freitext_headline"] = "";
      }
    }else{
        $freitext_headline = "";
    }
    
    
        $datumvon_form = preg_replace('/^(\\d{2})\\.(\\d{2})\\.(\\d{4})$/', '$3-$2-$1', $datumvon);
        $datumbis_form = preg_replace('/^(\\d{2})\\.(\\d{2})\\.(\\d{4})$/', '$3-$2-$1', $datumbis);
        $datum_von     = $datumvon_form . " " . $zeitvon . ":00";
        $datum_bis     = $datumbis_form . " " . $zeitbis . ":00";     
        
        function validateDate($date, $format = 'Y-m-d')
        {
            $d = DateTime::createFromFormat($format, $date);
            return $d && $d->format($format) == $date;
        }
        
        if (!validateDate($datumvon_form)) {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=2\">";
            exit;
        }
        
        if (!validateDate($datumbis_form)) {
            echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=2\">";
            exit;
        }
    
    
    if(!isset($_GET['erfassen'])){
    if ($umid == '') {
        $datum                       = date("Y-m-d H:i:s");

          $sql1                        = $db->query("INSERT INTO jumi_umfragen ( datum_von
                                                  , datum_bis
                                                  , headline
                                                  , uid
                                                  , datum_erfasst
                                                  , freitext
                                                  , freitext_headline
                                                  )
                                  VALUES
                                                  ( '$datum_von'
                                                  , '$datum_bis'
                                                  , '$headline'
                                                  , '$uid'
                                                  , '$datum'
                                                  , '$freitext'
                                                  , '$freitext_headline'
                                                  )
                                ");
          $umid                        = $db->insert_id;
          $_SESSION["umfrageerf_umid"] = $umid;
    }else{
        $update = $db->query("UPDATE jumi_umfragen
                                 SET datum_von ='$datum_von'
                                    ,datum_bis ='$datum_bis'
                                    ,headline = '$headline'
                                    ,freitext = '$freitext'
                                    ,freitext_headline = '$freitext_headline'
                               WHERE umid = $umid
                            ");

    }
    }
    

    if (isset($_GET['tabufid']) and $_GET['tabufid'] != '') {

        if ($_GET['tabufid'] == "neuefrage") {
            $_SESSION["umfrageerf_ufid"] = "";
        } else {
            $_SESSION["umfrageerf_ufid"] = $_GET['tabufid'];

        }
    }
    if(isset($_SESSION["umfrageerf_ufid"])){
    $ufid = $_SESSION["umfrageerf_ufid"];
    }

    if (isset($ufid) AND $ufid != '') {
        $result_frage = $db->query("SELECT frage, multiple
                                 FROM jumi_umfragen_fragen
                                WHERE ufid = $ufid");
        $row_frage    = $result_frage->fetch_array();
        $smarty->assign('umfrageerf_value_frage', htmlspecialchars($row_frage['frage']));
        $smarty->assign('umfrageerf_value_multiple', $row_frage['multiple']);
        $smarty->assign('umfrageerf_value_ufid', $ufid);
    }else{
        $smarty->assign('umfrageerf_value_frage', '');
        $smarty->assign('umfrageerf_value_multiple', '');
        $smarty->assign('umfrageerf_value_ufid', '');
    }
    
    # Gespeicherte Werte
    if ($umid != '') {
    
        $query1 = "SELECT ufid, frage
                 FROM jumi_umfragen_fragen
                WHERE umid=$umid
                ORDER BY ufid ASC";

        $result1 = $db->query($query1) or die("Cannot execute query1a");
        
        while ($row1 = $result1->fetch_array()) {
            $table_data1[] = $row1;
        }
    }
    if(isset($table_data1)){
    $smarty->assign('table_data1', $table_data1);
    }
    
    
    if (isset($ufid) AND $ufid != '') {
        $smarty->assign('umfrageerf_gesp_werte_value_ufid2', "$ufid");
        $query2 = "SELECT uaid, antwort
                     FROM jumi_umfragen_antworten
                    WHERE ufid=$ufid
                    ORDER BY userorder ASC, uaid ASC";
        $result2 = $db->query($query2) or die("Cannot execute query2");
        $anzahl = $result2->num_rows;
        if(isset($anzahl) AND $anzahl > 0){
          $smarty->assign('table_data2_anz', $anzahl);
        }else{
          $smarty->assign('table_data2_anz', '0');
        }
        while ($row2 = $result2->fetch_array()) {
            $table_data2[] = $row2;
        }
        if(isset($table_data2)){
        $smarty->assign('table_data2', $table_data2);
        }
    }else{
      $smarty->assign('umfrageerf_gesp_werte_value_ufid2', '');
      $smarty->assign('table_data2', '');
      $smarty->assign('table_data2_anz', '0');
    }
}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");

?>