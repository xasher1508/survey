<?php
error_reporting(E_ALL);
require_once("../config.inc.php");
require('../fpdf186/fpdf.php');
require_once('../fpdf186/FPDI-master/src/autoload.php');
use setasign\Fpdi\Fpdi;
$pdf = new FPDI('P','mm','A4');
$pdf->SetAutoPageBreak(false);
$art = $_GET['art'];

# Notenbuch =B
# Einzelnoten = E
if($art == 'B'){
  $zsid = $_GET['zsid'];
  $query = "SELECT liednr, filename, titel
              FROM jumi_noten_daten a, jumi_noten_uploads b, jumi_noten_zusammenstellung_zuord c
             WHERE b.jndid=c.jndid
               AND a.jndid=b.jndid
               AND c.zsid=$zsid
               AND lower(filename) LIKE '%.pdf'
             ORDER BY CAST(liednr AS UNSIGNED), liednr";
  $result = $db->query ($query)
   or die ("Cannot execute query");
  $query_titel = $db->query ("SELECT bezeichnung
                                FROM jumi_noten_zusammenstellung
                               WHERE zsid =$zsid");
  $row_titel = $query_titel->fetch_array();
}
if($art == 'E'){
  $jndid = $_GET['jndid'];
  $query = "SELECT liednr, filename, titel
              FROM jumi_noten_daten a, jumi_noten_uploads b
             WHERE a.jndid=b.jndid
               AND a.jndid=$jndid
               AND lower(filename) LIKE '%.pdf'
             ORDER BY CAST(liednr AS UNSIGNED), liednr
             LIMIT 1";
  $result = $db->query ($query)
   or die ("Cannot execute query");
  $query_titel = $db->query ("SELECT titel bezeichnung
                                FROM jumi_noten_daten
                               WHERE jndid =$jndid");
  $row_titel = $query_titel->fetch_array();
}

while ($row = $result->fetch_array()){

  $pages_count = $pdf->setSourceFile("$row[filename]"); 

  for($i = 1; $i <= $pages_count; $i++)
  {
      $pdf->AddPage(); 
 
      $tplIdx = $pdf->importPage($i);
  
      $pdf->useTemplate($tplIdx, 0, 0); 
  
    if($i == 1){
      $pdf->SetFont('Arial','B',26);
      $pdf->SetY(3); 
      $pdf->Cell( 0, 10, "$row[liednr]", 0, 0, 'R' ); 
    }
      $pdf->SetFont('Arial','B',10);
      $pdf->SetY(-7); 
      $pdf->Cell( 0, 0, "- ".iconv("UTF-8", "ISO-8859-1", $row['titel'])." ($i/$pages_count) -", 0, 0, 'C' ); 
      #$pdf->Write(0, "$i"); 
  }
}

$pdf->Output('I',iconv("UTF-8", "ISO-8859-1", $row_titel['bezeichnung']));
?>