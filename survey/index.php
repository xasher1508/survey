<?php
## INDEX gegen DB
if (!isset($_SESSION)) {
    session_start();
}
#$_SESSION['sessionid'] = session_id();


include_once '../classes/TestProjektSmarty.class_subdir.php';
#require_once("../config.inc.php");
require_once("../config/datenbankanbindung.php");
$smarty       = new SmartyAdmin();
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";

$db = dbconnect();
$session = session_id();
$ip      = $_SERVER["REMOTE_ADDR"];

if (isset($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = '';
}

if ($action == '') {
  $db = dbconnect();
  $datum=date("Y-m-d H:i:s");
  
  $query_umid = $db->query("SELECT max(umid) umid
                             FROM jumi_umfragen
                            WHERE datum_von < '$datum'
                             AND datum_bis > '$datum'
                          ");
  $row_umid = $query_umid->fetch_array();


    


  if($row_umid['umid'] == NULL ){
    $smarty->assign('umfrage_anzeigen', "0");
  }else{
    $smarty->assign('umfrage_anzeigen', "1");
    $smarty->assign('umfrage_umid', "$row_umid[umid]");
    $result_ende = $db->query("SELECT count(*) Anz
                                 FROM jumi_umfragen_ende
                                WHERE umid = $row_umid[umid]
                                  AND ip = '$ip'
                                  AND session = '$session'");
    $result_ende    = $result_ende->fetch_array();
    if((isset($_GET['error']) AND $_GET['error'] == 1) OR $result_ende['Anz'] > 0){
      $smarty->assign('umfrage_ende', "1");
    }else{
      $smarty->assign('umfrage_ende', "0");
    }
  }
}

if ($action == 'umfrage') {

    
    // Datendefinition
    
    $limit = 1; // Fragen pro Seite
    
    #############################################################################
    if (isset($_POST['umid'])) {
      $umid = $_POST['umid'];
      $_SESSION['umid'] = $umid;
    }else{
      $umid = $_SESSION['umid'];
    }
    ####################### Abfrage, ob Umfrage schon teilgenommen ##############
        $result_ende = $db->query("SELECT count(*) Anz
                                   FROM jumi_umfragen_ende
                                  WHERE umid = $umid
                                    AND ip = '$ip'
                                    AND session = '$session'");
        $result_ende    = $result_ende->fetch_array();
        if($result_ende['Anz'] > 0){
          echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?error=1\">";
          exit;
          }
    
    ####################### Speichern der Antworten #############################
    if (isset($_POST['but_next'])) {
        $frage   = $_POST['save'];

        
        if (!isset($_POST['freitext'])) {
            $result_multiple = $db->query("SELECT multiple
                                         FROM jumi_umfragen_fragen
                                        WHERE ufid = $frage");
            $row_multiple    = $result_multiple->fetch_array();
            
            $del1 = $db->query("DELETE FROM jumi_umfragen_ergebnisse WHERE ufid = $frage AND ip='$ip' AND session='$session'");
            
            if ($row_multiple['multiple'] == '0') {
                #                echo "Antwort: $_POST[antwort]<br>";
                $antwort = $_POST['antwort'];
                $sql1    = $db->query("INSERT INTO jumi_umfragen_ergebnisse (ip, session, ufid, uaid)
                                VALUES ('$ip', '$session', '$frage', '$antwort')
                              ");
                
            }
            if ($row_multiple['multiple'] == '1') {
                $query  = "SELECT uaid
                         FROM jumi_umfragen_antworten
                        WHERE ufid = $frage
                        ORDER BY ufid ASC";
                $result = $db->query($query);
                while ($row = $result->fetch_array()) {
                    $antwort = $_POST['antwort_' . $row['uaid']];
                    if ($antwort != '') {
                        #                            echo "Antwort: $antwort<br>";
                        $sql1 = $db->query("INSERT INTO jumi_umfragen_ergebnisse (ip, session, ufid, uaid)
                                        VALUES ('$ip', '$session', '$frage', '$antwort')
                                      ");
                    }
                }
            }
        }
        if (isset($_POST['freitext']) AND $_POST['freitext'] != '') {
            $freitext = $_POST['freitext'];
            $del1     = $db->query("DELETE FROM jumi_umfragen_erg_freitext WHERE ip='$ip' AND session='$session'");
            $sql1     = $db->query("INSERT INTO jumi_umfragen_erg_freitext (umid, ip, session, freitext)
                                VALUES ('$umid', '$ip', '$session', '$freitext')
                              ");
        }
        if(isset($_POST['exit'])){
          $exitsurvey = $_POST['exit'];
        }else{
          $exitsurvey =0;
        }
        if ($exitsurvey == '1') {
            $smarty->assign('umfrage_showende', "1");
            $sql1     = $db->query("INSERT INTO jumi_umfragen_ende (umid, ip, session, ende)
                                VALUES ('$umid', '$ip', '$session', '1')
                              ");
        }else{
        $smarty->assign('umfrage_showende', "0");
        }
    }else{
    $smarty->assign('umfrage_showende', "0");
    }
    
    $rowperpage = 1;
    $row_page   = 0;
    
    // Previous Button
    if (isset($_POST['but_prev'])) {
        
        $row_page = $_POST['row'];
        $row_page -= $rowperpage;
        if ($row_page < 0) {
            $row_page = 0;
            $smarty->assign('umfrage_start0', "2");
            
        } else {
            $smarty->assign('umfrage_start0', "1");
            
        }
    }
    
    // Next Button
    if (isset($_POST['but_next'])) {
        $row_page = $_POST['row'];
        $allcount = $_POST['allcount'];
        
        $val = $row_page + $rowperpage;
        if ($val < $allcount) {
            $row_page = $val;
        }
    }
    $smarty->assign('pagination_row', $row_page);
    
    ####################### Ausgabe der Fragen #####################################
    
    #  $last = floor($total/$limit)*$limit;   //Sprungziel zur letzten Seite BSP abrunden(1954/13)*13 ==> 150*13=1950 Sprungmarke auf Zeile 1950, 4 DS werden angezeigt
    $akt = round((($row_page - $limit) / $limit + 2), 0);
    
    $result0 = $db->query("SELECT headline, freitext
                          FROM jumi_umfragen
                         WHERE umid = $umid;");
    $row0    = $result0->fetch_array();
    if ($row0['freitext'] == '0') {
        $freitext = 0;
    } else {
        $freitext = 1;
    }
    $smarty->assign('umfrage_headline', $row0['headline']);
    
    $result = $db->query("SELECT count(*)-1 Anz_limit, round(100/(count(*)+$freitext)*$akt,1) progress, count(*) total
                          FROM jumi_umfragen_fragen
                         WHERE umid = $umid;");
    $row    = $result->fetch_array();
    $smarty->assign('umfrage_progress', $row['progress']);
    
    if ($row0['freitext'] == '0') {
        $allcount = $row['total'];
    } else {
        $allcount = $row['total'] + $freitext;
    }
    
    
    $smarty->assign('pagination_allcount', $allcount);
    
    // Zurück- und Vorblättern Buttons
    if ($row_page > 0) {
        $smarty->assign('umfrage_start0', "1");
    } else {
        $smarty->assign('umfrage_start0', "2");
    }
    
    if ($row_page + $limit < $allcount) {
        $smarty->assign('umfrage_end0', "1");
    } else {
        $smarty->assign('umfrage_end0', "2");
    }
    
    #echo "$row[Anz_limit]<br>";
    
    // Datenbankabfrage ausführen.
    $query  = "SELECT ufid, frage, multiple
               FROM jumi_umfragen_fragen
              WHERE umid = $umid
              ORDER BY ufid ASC
              LIMIT " . $row_page . ",1";
    $result = $db->query($query);
    
    # Letzte Frage ggf. Freitext, wenn Ergebnis der Abfrage 0 ist und Freitext=1
    if (mysqli_num_rows($result) == '0' AND $row0['freitext'] == '1') {
        # Jetzt Freitext einblenden, auf letzter Seite
        $smarty->assign('umfrage_showfreitext', "1");
        $result_antw = $db->query("SELECT freitext
                                   FROM jumi_umfragen_erg_freitext
                                  WHERE umid = $umid
                                    AND ip = '$ip'
                                    AND session = '$session'");
        $row_antw    = $result_antw->fetch_array();
        if(isset($row_antw['freitext'])){
        $smarty->assign('umfrage_value_freitext', "$row_antw[freitext]");
        }else{
        $smarty->assign('umfrage_value_freitext', '');
        }

        $result_head = $db->query("SELECT freitext_headline
                                   FROM jumi_umfragen
                                  WHERE umid = $umid");
        $row_head    = $result_head->fetch_array();
        
        if($row_head['freitext_headline'] != ''){
          $smarty->assign('umfrage_value_freitext_headline', "$row_head[freitext_headline]");
        }else{
          $smarty->assign('umfrage_value_freitext_headline', "Raum für Hinweise/Bemerkungen");
        }
        
    } else {
        $smarty->assign('umfrage_showfreitext', "0");
    }
    
    // Ergebnisse lesen und an den Client ausgeben
    while ($row = $result->fetch_array()) {
        $value2 = '';
        
        $query2 = "SELECT uaid, antwort
                 FROM jumi_umfragen_antworten
                WHERE ufid = $row[ufid]
                ORDER BY userorder ASC
              ";
        
        $result2 = $db->query($query2) or die("Cannot execute query2");
        $ln2 = 0;
        while ($row2 = $result2->fetch_array()) {
            
            $result_antw = $db->query("SELECT count(*) Anz
                                        FROM jumi_umfragen_ergebnisse
                                       WHERE ufid = $row[ufid]
                                         AND uaid = $row2[uaid]
                                         AND ip = '$ip'
                                         AND session = '$session'");
            $row_antw    = $result_antw->fetch_array();
            if ($row_antw['Anz'] == '0') {
                $selected = 0;
            } else {
                $selected = 1;
            }
            
            $inner1[$ln2]['selected'] = $selected;
            $inner1[$ln2]['uaid']     = $row2['uaid'];
            $inner1[$ln2]['antwort']  = $row2['antwort'];
            $value2                   = $inner1;
            $ln2++;
        }
        $row['inner'] = $value2;
        
        
        $table_data[] = $row;
    }
    if(isset($table_data)){
      $smarty->assign('table_data', $table_data);
    }
    
    #echo"<pre>";
    #print_r($table_data);
    #echo"</pre>";
    
}

$smarty->assign('action', "$action");
$smarty->display("modern/survey/$templatename");
?> 
