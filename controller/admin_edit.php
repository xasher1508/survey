<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'deleteSurvey') {
    
    $umid = $_POST['id'];
    
    
    $stmt1 = $db->query("DELETE FROM jumi_umfragen_erg_freitext WHERE umid = $umid");
    $stmt2 = $db->query("DELETE FROM jumi_umfragen_ende WHERE umid = $umid");
    $stmt4 = $db->query("DELETE FROM jumi_umfragen_ergebnisse WHERE ufid IN (SELECT ufid FROM jumi_umfragen_fragen WHERE umid = $umid)");
    $stmt4 = $db->query("DELETE FROM jumi_umfragen_antworten WHERE ufid IN (SELECT ufid FROM jumi_umfragen_fragen WHERE umid = $umid)");
    $stmt5 = $db->query("DELETE FROM jumi_umfragen_fragen WHERE umid = $umid");
    $stmt6 = $db->query("DELETE FROM jumi_umfragen WHERE umid = $umid");
    
    
    if ($stmt1 and $stmt2 and $stmt3 and $stmt4 and $stmt5 and $stmt6) {
        echo "Success";
    } else {
        echo "Nicht geklappt";
    }
}


?>