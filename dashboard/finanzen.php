<?php
## INDEX gegen DB
if (!isset($_SESSION))
{
    session_start();
}
#$_SESSION['sessionid'] = session_id();
include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once ("../config.inc.php");
$smarty = new SmartyAdmin();
if (!rechte('__noright__', $uid))
{
    echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
    exit;
}
$templatename = substr(basename($_SERVER['PHP_SELF']) , 0, -3) . "html";
require_once "../language/german.inc.php";

# Gespeicherte Werte
    $result_sum = $db->query("SELECT sum(betrag) kontostand
                                  FROM jumi_finanzen
                         ");
    $row_sum = $result_sum->fetch_array();
    
    $fmt = new NumberFormatter( 'de_DE', NumberFormatter::CURRENCY );
    $kontostand = $fmt->formatCurrency($row_sum['kontostand'], "EUR");
    $smarty->assign('kontostand', $kontostand);

$query = "SELECT fid, datum, date_format(datum, '%d.%m.%Y') datum_form, beschreibung, firma, art, betrag, bemerkung
                   FROM jumi_finanzen
                  ORDER BY datum DESC";

$result = $db->query($query) or die("Cannot execute query");

while ($row = $result->fetch_array())
{
    $value2 = '';
    unset($inner1);

    $query2 = "SELECT id, filename, originalname
                 FROM jumi_finanzen_uploads
                WHERE fid=$row[fid]
                ORDER BY id ASC
               ";

    $result2 = $db->query($query2) or die("Cannot execute query2");
    $ln2 = 0;

    while ($row2 = $result2->fetch_array())
    {

        $inner1[$ln2]['id'] = $row2['id'];
        $inner1[$ln2]['filename'] = $row2['filename'];
        if (file_exists($row2['filename'])) {
          $inner1[$ln2]['file_exists'] = '1';
        } else {
          $inner1[$ln2]['file_exists'] = '0';
        }
        $inner1[$ln2]['originalname'] = $row2['originalname'];
        
        $dateiarray = explode(".",$row2['originalname']);
        $endung = ".".$dateiarray[count($dateiarray)-1];
        $datei_short = substr($row2['originalname'],0,8)."[...]".$endung;
        $inner1[$ln2]['originalname_short'] = $datei_short;

        $value2 = $inner1;
        $ln2++;
    }

    #$fmt = new NumberFormatter( 'de_DE', NumberFormatter::CURRENCY );
    $betrag = $fmt->formatCurrency($row['betrag'], "EUR");
    
    $row['betrag_form'] = $betrag;
    $row['inner'] = $value2;
    $table_data[] = $row;
}
$smarty->assign('table_data', $table_data);

#echo "<pre>";
#print_r($table_data);
#echo "</pre>";


if (isset($_GET['editfid']) and $_GET['editfid'] != '')
{
    # Aus externer Seite edit_user.php
    #echo "<br><br><br><br><br><br><br><br>-----------------------------------------------hier";
    $fid = $_GET['editfid'];
    $smarty->assign('create_edit', $fid);

    $result0 = $db->query("SELECT fid, date_format(datum, '%d.%m.%Y') datum, beschreibung, firma, art, betrag, bemerkung
                                  FROM jumi_finanzen
                                 WHERE fid = $fid
                         ");
    $row0 = $result0->fetch_array();
    $smarty->assign('finanzen_datum', $row0['datum']);
    $smarty->assign('finanzen_beschreibung', $row0['beschreibung']);
    $smarty->assign('finanzen_firma', $row0['firma']);
    $smarty->assign('finanzen_art', $row0['art']);
    if($row0['art'] == 'A'){
      $betrag =  $row0['betrag'] * (-1);
    }else{
      $betrag = $row0['betrag'];
    }
    $smarty->assign('finanzen_betrag', $betrag);
    $smarty->assign('finanzen_bemerkung', $row0['bemerkung']);

    $query = "SELECT id, filename, originalname, date_format(datum, '%d.%m.%y - %H:%i') uploaddatum FROM jumi_finanzen_uploads WHERE fid='$fid' ORDER BY datum DESC";
    $result = $db->query($query) or die("Cannot execute query1");

    while ($row10 = $result->fetch_array())
    {
    
        $row10['orginalname_short'] = $datei_short;
        $value[] = $row10;
    }
    $smarty->assign('table_data2', $value);
}

$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?>
