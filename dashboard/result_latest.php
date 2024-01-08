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


$action = $_GET['action'];

if ($action == '') {
  $db = dbconnect();
  

  if(isset($_GET['editumid']) and $_GET['editumid'] != ''){
    # Aus externer Seite - survey_edit
    $umid = $_GET['editumid'];
  }else{
    # Sonst Wert einer zuletzt angefangener Umfrage
    $query_umid = $db->query("SELECT max(umid) umid
                                FROM jumi_umfragen
                               WHERE datum_von < now()
                            ");
    $row_umid = $query_umid->fetch_array();
    $umid = $row_umid['umid'];
  }

  $query_umid_detail = $db->query("SELECT headline, date_format(datum_von, '%d.%m.%Y - %H:%i') datum_von, date_format(datum_bis, '%d.%m.%Y - %H:%i') datum_bis, freitext
                                     FROM jumi_umfragen
                                    WHERE umid=$umid
                                 ");
  $row_umid_detail = $query_umid_detail->fetch_array();
  $smarty->assign('result_headline', "$row_umid_detail[headline]");
  $smarty->assign('result_datum_von', "$row_umid_detail[datum_von]");
  $smarty->assign('result_datum_bis', "$row_umid_detail[datum_bis]");

#  # Anzahl abgeschlossene Umfragen
#  $query_fertige = $db->query("SELECT count(*) Anz_abgeschlossen
#                                 FROM jumi_umfragen_ende
#                                WHERE umid =$umid
#                             ");
#  $row_fertige = $query_fertige->fetch_array();
#  $smarty->assign('result_anz_fertige', "$row_fertige[Anz_abgeschlossen]");
#  
#  # Anzahl angefangener Teilnehmer
#  $query_angefangen = $db->query("SELECT count(distinct concat(ip,session))-$row_fertige[Anz_abgeschlossen] Anz_angefangen
#                                    FROM jumi_umfragen_ergebnisse
#                                   WHERE ufid in (select ufid from jumi_umfragen_fragen where umid =$umid)
#                                 ");
#  $row_angefangen = $query_angefangen->fetch_array();
# $smarty->assign('result_anz_angefangen', "$row_angefangen[Anz_angefangen]");
  $query_angefangen = $db->query("SELECT count(distinct concat(ip,session)) Anz_teilnehmer
                                    FROM jumi_umfragen_ergebnisse
                                   WHERE ufid in (select ufid from jumi_umfragen_fragen where umid =$umid)
                                 ");
  $row_angefangen = $query_angefangen->fetch_array();
  $smarty->assign('result_anz_teilnehmer', "$row_angefangen[Anz_teilnehmer]");
    




    $query  = "SELECT ufid, frage, multiple
                 FROM jumi_umfragen_fragen
                WHERE umid = $umid";
    $result = $db->query($query);

    
    // Ergebnisse lesen und an den Client ausgeben
    while ($row = $result->fetch_array()) {
        $value2 = '';
        unset($inner1);

        # Wie viele User haben Frage 1 beantwortet
        $result_anz_userfrage = $db->query("SELECT count(distinct concat(ip,session)) Anz
                                              FROM jumi_umfragen_ergebnisse
                                             WHERE ufid = $row[ufid]
                                              and uaid != 0
                                          ");
        $row_anz_userfrage = $result_anz_userfrage->fetch_array();
        
        # Wie viele Antworten gibt es zur Frage: Das sind 100%
        $result_anz_antworten = $db->query("SELECT count(ufid) Anz
                                              FROM jumi_umfragen_ergebnisse
                                             WHERE ufid = $row[ufid]
                                               AND uaid != 0
                                          ");
        $row_anz_antworten = $result_anz_antworten->fetch_array();
  
        
        $query2 = "SELECT uaid, antwort
                     FROM jumi_umfragen_antworten
                    WHERE ufid=$row[ufid]
                    ORDER BY userorder ASC, uaid ASC
                   ";


        $result2 = $db->query($query2) or die("Cannot execute query2");
        $ln2 = 0;
        
        while ($row2 = $result2->fetch_array()) {

            # Wie viele haben Antwort auf aktuelle Frage gegeben
            $result_cur_antw = $db->query("SELECT count(*) Anz
                                             FROM jumi_umfragen_ergebnisse
                                            WHERE uaid = $row2[uaid]");
            $row_cur_antw    = $result_cur_antw->fetch_array();

            if($row_anz_antworten['Anz'] != '0'){
            $prozent = round(100/$row_anz_antworten['Anz']*$row_cur_antw['Anz'],2);
            }else{
            $prozent = 0;
            }
            $prozent2 = number_format($prozent, 2, ',', '.');
            
            $inner1[$ln2]['prozent']  = $prozent;
            $inner1[$ln2]['prozent2']  = $prozent2;
            $inner1[$ln2]['uaid']     = $row2['uaid'];
            $inner1[$ln2]['antwort']  = $row2['antwort'];
            $value2                   = $inner1;
            $ln2++;
        }
        if($row_anz_userfrage['Anz'] != 0){
         $anz_userfrage = $row_anz_userfrage['Anz'];
        }else{
         $anz_userfrage = 0;
        }
        $row['inner']               = $value2;
        $row['anz_userfrage']       = $anz_userfrage;
        $row['anz_antworten_frage'] = $row_anz_antworten['Anz'];
        $table_data[] = $row;
    }
    $smarty->assign('table_data', $table_data);
    
#    echo"<pre>";
#    print_r($table_data);
#    echo"</pre>";

    $result_head = $db->query("SELECT freitext_headline
                                     FROM jumi_umfragen
                                    WHERE umid = $umid");
    $row_head    = $result_head->fetch_array();
    
        if($row_head['freitext_headline'] != ''){
          $smarty->assign('umfrage_value_freitext_headline', "$row_head[freitext_headline]");
        }else{
          $smarty->assign('umfrage_value_freitext_headline', "Bemerkungen");
        }
        
    $query3  = "SELECT freitext
                 FROM jumi_umfragen_erg_freitext
                WHERE umid = $umid
                ORDER BY uefid desc";
    $result3 = $db->query($query3);

    
    // Ergebnisse lesen und an den Client ausgeben
    while ($row3 = $result3->fetch_array()) {
        $table_data3[] = $row3;
    }
    $smarty->assign('table_data3', $table_data3);


}


$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?> 
