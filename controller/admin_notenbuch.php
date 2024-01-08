<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'notenbuchsave') {
    if (isset($_POST['notenbuch'])) {
        $notenbuch = $_POST['notenbuch'];
    }
    if (isset($_POST['var_checkliz'])) {
        $var_checkliz = $_POST['var_checkliz'];
    }
    if (isset($_POST['anz_lizenz'])) {
        $anz_lizenz = $_POST['anz_lizenz'];
    }
    
    if (isset($var_checkliz)) {
        if ($var_checkliz == '1') {
            $checkliz = '1';
        } else {
            $checkliz = '0';
        }
    } else {
        $checkliz = '0';
    }
    
    $db     = dbconnect();
    $result = $db->query("SELECT count(*) Anz FROM jumi_noten_zusammenstellung WHERE upper(bezeichnung)=upper('$notenbuch')");
    $row    = $result->fetch_array();
    
    if ($notenbuch == '') { //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Notenbuchname darf nicht leer sein.</div>|***|error';
        exit;
    } else if ($row['Anz'] > 0) { //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Notenbuchname ist bereits vorhanden.</div>|***|error';
        exit;
    } else {
        $sql1 = $db->query("INSERT INTO jumi_noten_zusammenstellung ( bezeichnung, lizenzpflicht, anzahl_lizenz) VALUES ( '$notenbuch', '$checkliz',  '$anz_lizenz')");
        if ($sql1) {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Das Notenbuch wurde angelegt!</div>|***|success';
            exit;
        } else {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das Notenbuch wurde nicht angelegt: Insert Fehler Datenbank.</div>|***|error';
            exit;
        }
    }
}

if ($function == 'notenbuchupdate') {
    if (isset($_POST['notenbuch'])) {
        $notenbuch = $_POST['notenbuch'];
    }
    if (isset($_POST['var_checkliz'])) {
        $var_checkliz = $_POST['var_checkliz'];
    }
    if (isset($_POST['anz_lizenz'])) {
        $anz_lizenz = $_POST['anz_lizenz'];
    }
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    
    if (isset($var_checkliz)) {
        if ($var_checkliz == '1') {
            $checkliz = '1';
        } else {
            $checkliz   = '0';
            $anz_lizenz = '0';
        }
    } else {
        $checkliz   = '0';
        $anz_lizenz = '0';
    }
    
    if ($notenbuch == '') { //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Notenbuchname darf nicht leer sein.</div>|***|error';
        exit;
    } else {
        $sql1 = $db->query("UPDATE jumi_noten_zusammenstellung
                                    SET bezeichnung ='$notenbuch'
                                       ,lizenzpflicht='$checkliz'
                                       ,anzahl_lizenz='$anz_lizenz'
                                  WHERE zsid = $zsid
                               ");
        
        if ($sql1) {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Das Notenbuch wurde geändert!</div>|***|success';
            exit;
        } else {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das Notenbuch wurde nicht geändert: Insert Fehler Datenbank.</div>|***|error';
            exit;
        }
    }
}

if ($function == 'editNotenbuch') {
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    $result = $db->query("SELECT bezeichnung, lizenzpflicht, anzahl_lizenz FROM jumi_noten_zusammenstellung WHERE zsid=$zsid");
    $row    = $result->fetch_array();
    echo json_encode($row);
    
}

if ($function == 'erfzuordnung') {
    if (isset($_POST['jndid'])) {
        $jndid = $_POST['jndid'];
    }
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    
    $db   = dbconnect();
    $sql1 = $db->query("INSERT INTO jumi_noten_zusammenstellung_zuord ( jndid, zsid) VALUES ( $jndid, $zsid )");
    if ($sql1) {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Noten wurden zugewiesen!</div>|***|success|***|' . $zsid;
        exit;
    } else {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Noten wurden nicht zugewiesen: Insert Fehler Datenbank.</div>|***|error';
        exit;
    }
}

if ($function == 'delzuordnung') {
    if (isset($_POST['jndid'])) {
        $jndid = $_POST['jndid'];
    }
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    
    $sql1 = $db->query("DELETE FROM jumi_noten_zusammenstellung_zuord WHERE jndid='$jndid' AND zsid='$zsid'");
    if ($sql1) {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Noten wurden entfernt!</div>|***|success|***|' . $zsid;
        exit;
    } else {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Noten wurdne nicht entfernt: DELETE Fehler Datenbank.</div>|***|error';
        exit;
    }
}

if ($function == 'erfNotenUser') {
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    if (isset($_POST['csid'])) {
        $csid = $_POST['csid'];
    }
    
    $db   = dbconnect();
    $sql1 = $db->query("INSERT INTO jumi_noten_zus_saenger_zuord ( zsid, csid) VALUES ( $zsid, $csid )");
    if ($sql1) {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde zugewiesen!</div>|***|success|***|' . $zsid;
        exit;
    } else {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht zugewiesen: Insert Fehler Datenbank.</div>|***|error';
        exit;
    }
}

if ($function == 'delNotenUser') {
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    if (isset($_POST['csid'])) {
        $csid = $_POST['csid'];
    }
    
    $sql1 = $db->query("DELETE FROM jumi_noten_zus_saenger_zuord WHERE zsid='$zsid' AND csid='$csid'");
    if ($sql1) {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde gelöscht!</div>|***|success|***|' . $zsid;
        exit;
    } else {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
        exit;
    }
}

if ($function == 'delZusammenstellung') {
    if (isset($_POST['zsid'])) {
        $zsid = $_POST['zsid'];
    }
    
    $stmt1 = $db->query("DELETE FROM jumi_noten_zusammenstellung_zuord WHERE zsid=$zsid");
    $stmt2 = $db->query("DELETE FROM jumi_noten_zus_saenger_zuord WHERE zsid= $zsid");
    $stmt3 = $db->query("DELETE FROM jumi_noten_zusammenstellung WHERE zsid= $zsid");
    if ($stmt1 and $stmt2 and $stmt3) {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Rolle wurde gelöscht!</div>|***|success';
        exit;
    } else {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Rolle wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
        exit;
    }
}

?>