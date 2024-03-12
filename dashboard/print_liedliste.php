<?php
error_reporting(E_ALL);
require_once ("../config/datenbankanbindung.php");
header('Content-Type: text/html; charset=utf-8');
$db = dbconnect();
require ('../fpdf186/fpdf.php');
require_once ('../fpdf186/FPDI-master/src/autoload.php');
use setasign\Fpdi\Fpdi;

// https://www.vonderborn.com/erweiterte-tabellen-mit-fpdf.php
/*
Dokumentation
Der Quellcode ist eigentlich selbst erklärend. Mehreren Zellen werdern in einem Array zu einer Zeile zusammengefasst, welche dann das Array für die Visualisierung darstellt und an die Funktion WriteTable übergeben wird.
Das Array muss für jede Celle jeweils komplett gefüllt werden. Farben werden als RGB im CSV übergegeben. 
Linearea gibt an, ob linke, rechte, obere oder untere Rahmen angezeigt werden sollen. Alles andere sollte logisch sein. Ansonsten in den Beispielen etwas rumprobieren. 
*/
class MYPDF extends FPDI
{
    // Margins
    var $left = 15;
    var $right = 15;
    var $top = 10;
    var $bottom = 10;

    // Create Table
    function WriteTable($tcolums)
    {
        // go through all colums
        for ($i = 0;$i < sizeof($tcolums);$i++)
        {
            $current_col = $tcolums[$i];
            $height = 0;

            // get max height of current col
            $nb = 0;
            for ($b = 0;$b < sizeof($current_col);$b++)
            {
                // set style
                $this->SetFont($current_col[$b]['font_name'], $current_col[$b]['font_style'], $current_col[$b]['font_size']);
                $color = explode(",", $current_col[$b]['fillcolor']);
                $this->SetFillColor($color[0], $color[1], $color[2]);
                $color = explode(",", $current_col[$b]['textcolor']);
                $this->SetTextColor($color[0], $color[1], $color[2]);
                $color = explode(",", $current_col[$b]['drawcolor']);
                $this->SetDrawColor($color[0], $color[1], $color[2]);
                $this->SetLineWidth($current_col[$b]['linewidth']);

                $nb = max($nb, $this->NbLines($current_col[$b]['width'], $current_col[$b]['text']));
                $height = $current_col[$b]['height'];
            }
            $h = $height * $nb;

            // Issue a page break first if needed
            $this->CheckPageBreak($h);

            // Draw the cells of the row
            for ($b = 0;$b < sizeof($current_col);$b++)
            {
                $w = $current_col[$b]['width'];
                $a = $current_col[$b]['align'];

                // Save the current position
                $x = $this->GetX();
                $y = $this->GetY();

                // set style
                $this->SetFont($current_col[$b]['font_name'], $current_col[$b]['font_style'], $current_col[$b]['font_size']);
                $color = explode(",", $current_col[$b]['fillcolor']);
                $this->SetFillColor($color[0], $color[1], $color[2]);
                $color = explode(",", $current_col[$b]['textcolor']);
                $this->SetTextColor($color[0], $color[1], $color[2]);
                $color = explode(",", $current_col[$b]['drawcolor']);
                $this->SetDrawColor($color[0], $color[1], $color[2]);
                $this->SetLineWidth($current_col[$b]['linewidth']);

                $color = explode(",", $current_col[$b]['fillcolor']);
                $this->SetDrawColor($color[0], $color[1], $color[2]);

                // Draw Cell Background
                $this->Rect($x, $y, $w, $h, 'FD');

                $color = explode(",", $current_col[$b]['drawcolor']);
                $this->SetDrawColor($color[0], $color[1], $color[2]);

                // Draw Cell Border
                if (substr_count($current_col[$b]['linearea'], "T") > 0)
                {
                    $this->Line($x, $y, $x + $w, $y);
                }

                if (substr_count($current_col[$b]['linearea'], "B") > 0)
                {
                    $this->Line($x, $y + $h, $x + $w, $y + $h);
                }

                if (substr_count($current_col[$b]['linearea'], "L") > 0)
                {
                    $this->Line($x, $y, $x, $y + $h);
                }

                if (substr_count($current_col[$b]['linearea'], "R") > 0)
                {
                    $this->Line($x + $w, $y, $x + $w, $y + $h);
                }

                // Print the text
                $this->MultiCell($w, $current_col[$b]['height'], $current_col[$b]['text'], 0, $a, 0);

                // Put the position to the right of the cell
                $this->SetXY($x + $w, $y);
            }

            // Go to the next line
            $this->Ln($h);
        }
    }

    // If the height h would cause an overflow, add a new page immediately
    function CheckPageBreak($h)
    {
        if ($this->GetY() + $h > $this->PageBreakTrigger) $this->AddPage($this->CurOrientation);
    }

    // Computes the number of lines a MultiCell of width w will take
    function NbLines($w, $txt)
    {
        $cw = & $this->CurrentFont['cw'];
        if ($w == 0) $w = $this->w - $this->rMargin - $this->x;
        $wmax = ($w - 2 * $this->cMargin) * 1000 / $this->FontSize;
        $s = str_replace("\r", '', $txt);
        $nb = strlen($s);
        if ($nb > 0 and $s[$nb - 1] == "\n") $nb--;
        $sep = - 1;
        $i = 0;
        $j = 0;
        $l = 0;
        $nl = 1;
        while ($i < $nb)
        {
            $c = $s[$i];
            if ($c == "\n")
            {
                $i++;
                $sep = - 1;
                $j = $i;
                $l = 0;
                $nl++;
                continue;
            }
            if ($c == ' ') $sep = $i;
            $l += $cw[$c];
            if ($l > $wmax)
            {
                if ($sep == - 1)
                {
                    if ($i == $j) $i++;
                }
                else $i = $sep + 1;
                $sep = - 1;
                $j = $i;
                $l = 0;
                $nl++;
            }
            else $i++;
        }
        return $nl;
    }

}


$pdf = new MYPDF('P', 'mm', 'A4');
$pdf->SetAutoPageBreak(false);
$pdf->AliasNbPages();
$pdf->SetMargins($pdf->left, $pdf->top, $pdf->right);
$pdf->AddPage();

// create table
$columns = array();

$query = "SELECT a.jndid, titel, liednr, anz_lizenzen, streamlizenz, bemerkung, c.bezeichnung verlag
                    FROM jumi_noten_daten a, jumi_noten_verlag c
                   WHERE a.vid=c.vid
                   ORDER BY titel ASC";
#ORDER BY CAST(liednr AS UNSIGNED), liednr
$result = $db->query($query) or die("Cannot execute query");

$pdf->SetFont('Arial', 'B', 20);
$pdf->SetTextColor(13, 115, 119);
$pdf->Cell(0, 3, "Liederverzeichnis", 0, 0, 'C');
$pdf->SetFont('Arial', '', 10);
$pos = $pdf->GetY() + 15;
$pdf->SetY($pos);

$fil = array();
$fil[] = array(
    'text' => "Titel",
    'width' => '80',
    'height' => '7',
    'align' => 'L',
    'font_name' => 'Arial',
    'font_size' => '10',
    'font_style' => '',
    'fillcolor' => '255,255,255',
    'textcolor' => '0,0,0',
    'drawcolor' => '0,0,0',
    'linewidth' => '0.2',
    'linearea' => 'LTBR'
);
$fil[] = array(
    'text' => "LiedNr",
    'width' => '20',
    'height' => '7',
    'align' => 'L',
    'font_name' => 'Arial',
    'font_size' => '10',
    'font_style' => '',
    'fillcolor' => '255,255,255',
    'textcolor' => '0,0,0',
    'drawcolor' => '0,0,0',
    'linewidth' => '0.2',
    'linearea' => 'LTBR'
);
$fil[] = array(
    'text' => "Restlizenz",
    'width' => '30',
    'height' => '7',
    'align' => 'L',
    'font_name' => 'Arial',
    'font_size' => '10',
    'font_style' => '',
    'fillcolor' => '255,255,255',
    'textcolor' => '0,0,0',
    'drawcolor' => '0,0,0',
    'linewidth' => '0.2',
    'linearea' => 'LTBR'
);
$fil[] = array(
    'text' => "Verlag",
    'width' => '50',
    'height' => '7',
    'align' => 'L',
    'font_name' => 'Arial',
    'font_size' => '10',
    'font_style' => '',
    'fillcolor' => '255,255,255',
    'textcolor' => '0,0,0',
    'drawcolor' => '0,0,0',
    'linewidth' => '0.2',
    'linearea' => 'LTBR'
);
$filler[] = $fil;

$pdf->WriteTable($filler);

while ($row = $result->fetch_array())
{
    $col = array();
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

    $result_rl = $db->query("SELECT $row[anz_lizenzen]-count(*) Rest
                                     FROM jumi_noten_zus_saenger_zuord
                                    WHERE zsid IN( SELECT zsid FROM jumi_noten_zusammenstellung_zuord WHERE jndid=$row[jndid])");
    $row_rl = $result_rl->fetch_array();

    $col[] = array(
        'text' => iconv("UTF-8", "ISO-8859-1", $row['titel']) ,
        'width' => '80',
        'height' => '7',
        'align' => 'L',
        'font_name' => 'Arial',
        'font_size' => '10',
        'font_style' => '',
        'fillcolor' => '255,255,255',
        'textcolor' => '0,0,0',
        'drawcolor' => '0,0,0',
        'linewidth' => '0.2',
        'linearea' => 'LTBR'
    );
    $col[] = array(
        'text' => iconv("UTF-8", "ISO-8859-1", "$liednr") ,
        'width' => '20',
        'height' => '7',
        'align' => 'R',
        'font_name' => 'Arial',
        'font_size' => '10',
        'font_style' => '',
        'fillcolor' => '255,255,255',
        'textcolor' => '0,0,0',
        'drawcolor' => '0,0,0',
        'linewidth' => '0.2',
        'linearea' => 'LTBR'
    );
    $col[] = array(
        'text' => "$row_rl[Rest]/$row[anz_lizenzen]",
        'width' => '30',
        'height' => '7',
        'align' => 'L',
        'font_name' => 'Arial',
        'font_size' => '10',
        'font_style' => '',
        'fillcolor' => '255,255,255',
        'textcolor' => '0,0,0',
        'drawcolor' => '0,0,0',
        'linewidth' => '0.2',
        'linearea' => 'LTBR'
    );
    $col[] = array(
        'text' => iconv("UTF-8", "ISO-8859-1", $row['verlag']) ,
        'width' => '50',
        'height' => '7',
        'align' => 'L',
        'font_name' => 'Arial',
        'font_size' => '10',
        'font_style' => '',
        'fillcolor' => '255,255,255',
        'textcolor' => '0,0,0',
        'drawcolor' => '0,0,0',
        'linewidth' => '0.2',
        'linearea' => 'LTBR'
    );
    $columns[] = $col;

}

// Draw Table
$pdf->WriteTable($columns);

// Show PDF
#$pdf->Output();
$pdf->Output('I', iconv("UTF-8", "ISO-8859-1", 'Liedliste_toc'));

?>