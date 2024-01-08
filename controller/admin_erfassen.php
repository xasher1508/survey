<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'erfmultiple') {
  $multiple = $_POST['multiple'];
  $umid = $_SESSION["umfrageerf_umid"];
  $ufid = $_SESSION["umfrageerf_ufid"];
  if($ufid != ''){
    if (isset($multiple)) {
        if ($multiple == '1') {
            $multiple = '1';
        } else {
            $multiple = '0';
        }
    } else {
        $multiple = '0';
    }

        $update = $db->query("UPDATE jumi_umfragen_fragen
                                    SET multiple ='$multiple'
                                  WHERE ufid = $ufid
                               ");
        if($update){
          echo "success";
        }else{
          echo -1;
        }

  }else{
   echo -1;
  }
}

if ($function == 'save') {
    $frage    = $_POST['frage'];
    $antwort  = $_POST['antwort'];
    $multiple = $_POST['multiple'];
    
    
    $umid = $_SESSION["umfrageerf_umid"];
    
    if (isset($_POST['frage'])) {
        $frage = $_POST['frage'];
    }
    if (isset($_POST['antwort'])) {
        $antwort = $_POST['antwort'];
    }
    
    if (isset($multiple)) {
        if ($multiple == '1') {
            $multiple = '1';
        } else {
            $multiple = '0';
        }
    } else {
        $multiple = '0';
    }
    
    # Gibt es die Frage schon 
    $result = $db->query("SELECT count(*) Anz FROM jumi_umfragen_fragen WHERE umid='$umid' and frage='$frage'");
    $row    = $result->fetch_array();
    
    if ($row['Anz'] == '0' and $frage != '') {
        $sql1                        = $db->query("INSERT INTO jumi_umfragen_fragen ( umid
                                                   , frage
                                                   , multiple
                                                   )
                                   VALUES
                                                   ( '$umid'
                                                   , '$frage'
                                                   , '$multiple'
                                                   )
                                 ");
        $ufid                        = $db->insert_id;
        $_SESSION["umfrageerf_ufid"] = $ufid;
    } else {
        $ufid   = $_SESSION["umfrageerf_ufid"];
        $update = $db->query("UPDATE jumi_umfragen_fragen
                                    SET frage ='$frage'
                                       ,multiple ='$multiple'
                                  WHERE ufid = $ufid
                               ");
    }
    $ufid = $_SESSION["umfrageerf_ufid"];
    
    # Gibt es diese Antwort schon
    $result2 = $db->query("SELECT count(*) Anz FROM jumi_umfragen_antworten WHERE ufid='$ufid' and antwort='$antwort'");
    $row2    = $result2->fetch_array();
    if ($row2['Anz'] == '0' and $antwort != '') {
        $sql1                        = $db->query("INSERT INTO jumi_umfragen_antworten ( ufid
                                                   , antwort
                                                   )
                                   VALUES
                                                   ( '$ufid'
                                                   , '$antwort'
                                                   )
                                 ");
        $uaid                        = $db->insert_id;
        $_SESSION["umfrageerf_uaid"] = $uaid;
    }
    echo "success";
    #echo "<meta http-equiv=\"refresh\" content=\"0; URL=" . $_SERVER['PHP_SELF'] . "?action=fragen&erfassen=1\">";
    
}


if ($function == 'delete') {
    $tabelle = $_POST['tabelle'];
    $spalte  = $_POST['spalte'];
    $id      = $_POST['id'];
    $stmt    = $db->query("DELETE FROM $tabelle WHERE $spalte = $id");
    if ($stmt) {
        echo "success: DELETE FROM $tabelle WHERE $spalte = $id";
    } else {
        echo "error: DELETE FROM $tabelle WHERE $spalte = $id";
    }
}

if ($function == 'deleteQuestion') {
    
    $id2 = $_POST['id2'];
    
    $stmt1 = $db->query("DELETE FROM jumi_umfragen_antworten WHERE ufid = $id2");
    $stmt2 = $db->query("DELETE FROM jumi_umfragen_fragen WHERE ufid = $id2");
    # ggf. bereis Abstimmergebnisse löschen
    
    # Sonst werden keine neue Fragen erfasst
    #       unset($_SESSION["umfrageerf_ufid"]);
    
    
    if ($stmt1 and $stmt2) {
        echo "Success";
    } else {
        echo "Error";
    }
}


?>