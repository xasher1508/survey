<?php
if (!isset($_SESSION))
{
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
require_once ("../config.inc.php");
$templatename = substr(basename($_SERVER['PHP_SELF']) , 0, -3) . "html";
$smarty = new SmartyAdmin();
if (!rechte(basename(__FILE__) , $uid))
{
    echo "<meta http-equiv=\"refresh\" content=\"0; URL=error.php\">";
    exit;
}
require_once "../language/german.inc.php";

// Rechteüberprüfung
#$db = dbconnect();
#if ($user_admin == ""){ require("index.php"); exit;} //Wenn man nicht angemeldet ist, darf man nicht auf die Seite
#if(!rore($user_admin,'a_admanleg','RE')){require("lib/rechte.php");exit;}
#// Rechteüberprüfung ende


$query = "SELECT a.jndid, titel, liednr, anz_lizenzen, streamlizenz, bemerkung, c.bezeichnung verlag
                    FROM jumi_noten_daten a, jumi_noten_verlag c
                   WHERE a.vid=c.vid
                   ORDER BY titel ASC;";
$result = $db->query($query) or die("Cannot execute query1");

while ($row = $result->fetch_array())
{
    if ($row['streamlizenz'] == '1')
    {
        $streamlizenz_vorh = "Ja";
    }
    elseif ($row['streamlizenz'] == '2')
    {
        $streamlizenz_vorh = "ungeklärt";
    }
    elseif ($row['streamlizenz'] == '0')
    {
        $streamlizenz_vorh = "nein";
    }

    if ($row['liednr'] == '')
    {
        $liednr = "";
    }
    elseif ($row['liednr'] == '0')
    {
        $liednr = "";
    }
    else
    {
        $liednr = $row['liednr'];
    }

    $result_link = $db->query("SELECT filename
                                     FROM jumi_noten_uploads
                                    WHERE jndid=$row[jndid]
                                      AND pdfart='N'");
    $row_link = $result_link->fetch_array();
    if (isset($row_link['filename']))
    {
        $filename = $row_link['filename'];
    }
    else
    {
        $filename = '';
    }
    if (file_exists($filename))
    {
        $fileexists = 1;
    }
    else
    {
        $fileexists = 0;
    }

    $result_rl = $db->query("SELECT $row[anz_lizenzen]-count(*) Rest
                                     FROM jumi_noten_zus_saenger_zuord
                                    WHERE zsid IN( SELECT zsid FROM jumi_noten_zusammenstellung_zuord WHERE jndid=$row[jndid])");
    $row_rl = $result_rl->fetch_array();

    $query1 = "SELECT bezeichnung
                      FROM jumi_noten_zusammenstellung a, jumi_noten_zusammenstellung_zuord b
                     WHERE a.zsid=b.zsid
                       AND b.jndid=$row[jndid]
                     ORDER BY bezeichnung ASC;";
    $result1 = $db->query($query1) or die("Cannot execute query1");
    $songbook = "";
    while ($row1 = $result1->fetch_array())
    {
        $songbook .= "$row1[bezeichnung], ";
    }
    $songbook = substr($songbook, 0, -2);

    $query2 = "SELECT filename, originalname, pdfart
                 FROM jumi_noten_uploads
                WHERE jndid=$row[jndid]
                  AND pdfart!='N'";
    $result2 = $db->query($query2) or die("Cannot execute query2");
    $files = "";
    while ($row2 = $result2->fetch_array())
    {
        if ($row2['pdfart'] == 'R')
        {
            $files .= "<a href='" . $row2['filename'] . "' target='_new'>Rechnung: <img src='../templates/modern/images/ico_pdf.gif' alt='Rechnung: " . $row2['originalname'] . "'></a><br>";
        }
        else if ($row2['pdfart'] == 'S')
        {
            $files .= "<a href='" . $row2['filename'] . "' target='_new'>Sonstige: <img src='../templates/modern/images/ico_pdf.gif' alt='Sonstige: " . $row2['originalname'] . "'></a><br>";
        }
    }
    #    echo "<pre>";
    #    echo $files;
    #    echo "</pre>";
    $row['restlizenz'] = $row_rl['Rest'];
    $row['liednr'] = $liednr;
    $row['link'] = $filename;
    $row['fileexists'] = $fileexists;
    $row['songbook'] = $songbook;
    $row['songbook'] = $songbook;
    $row['files'] = $files;
    $row['streamlizenz_vorh'] = $streamlizenz_vorh;
    $value[] = $row;
}
$smarty->assign('table_data', $value);
$smarty->assign('admin_rolle', rolle($uid));

$smarty->display("$template/dashboard/$templatename");
?>