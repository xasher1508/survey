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
# echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
# exit;
}
require_once "../language/german.inc.php";



if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}


if ($action == '') {
        $query1 = "SELECT umid, date_format(datum_von, '%d.%m.%Y (%H:%i)') datum_von, date_format(datum_bis, '%d.%m.%Y (%H:%i)') datum_bis, headline
                 FROM jumi_umfragen
                ORDER BY umid DESC";
        
        $result1 = $db->query($query1) or die("Cannot execute query1a");
        
        while ($row1 = $result1->fetch_array()) {
            $table_data1[] = $row1;
        }
        $smarty->assign('table_data1', $table_data1);
        $smarty->assign('admin_rolle', rolle($uid));
    
}


if ($action == 'fragen') {

    $umid = $_SESSION["umfrageerf_umid"];
    
    # Focus/Session setzen
    $result = $db->query("SELECT count(*) Anz FROM jumi_umfragen_fragen WHERE umid='$umid'");
    $row    = $result->fetch_array();
    # Wenn man bei mehreren Fragen eine Frage löscht ist Anz nicht 0 und der Focus sitzt bei Antwort
    if ($umid == '' or $_GET['tabufid'] == "neuefrage" or $row['Anz'] == '0') {
        $smarty->assign('umfrageerf_focus', "frage");
        unset($_SESSION["umfrageerf_ufid"]);
        unset($_SESSION["umfrageerf_uaid"]);
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
                                                  )
                                  VALUES
                                                  ( '$datum_von'
                                                  , '$datum_bis'
                                                  , '$headline'
                                                  , '$uid'
                                                  , '$datum'
                                                  , '$freitext'
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
    $ufid = $_SESSION["umfrageerf_ufid"];
    if ($ufid != '') {
        $result_frage = $db->query("SELECT frage, multiple
                                 FROM jumi_umfragen_fragen
                                WHERE ufid = $ufid");
        $row_frage    = $result_frage->fetch_array();
        $smarty->assign('umfrageerf_value_frage', htmlspecialchars($row_frage['frage']));
        $smarty->assign('umfrageerf_value_multiple', $row_frage['multiple']);
        $smarty->assign('umfrageerf_value_ufid', $ufid);
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
    
    $smarty->assign('table_data1', $table_data1);
    if ($ufid != '') {
        $smarty->assign('umfrageerf_gesp_werte_value_ufid2', "$ufid");
        $query2 = "SELECT uaid, antwort
                 FROM jumi_umfragen_antworten
                WHERE ufid=$ufid
                ORDER BY userorder ASC, uaid ASC";
        
        $result2 = $db->query($query2) or die("Cannot execute query2");
        $anzahl = $result2->num_rows;
        $smarty->assign('table_data2_anz', $anzahl);
        while ($row2 = $result2->fetch_array()) {
            $table_data2[] = $row2;
        }
        $smarty->assign('table_data2', $table_data2);
    }
}



$smarty->assign('action', "$action");
$smarty->display("$template/dashboard/$templatename");

?>
