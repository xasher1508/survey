<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'verteilersave') {
  if (isset($_POST['verteilername'])) {
    $verteilername = $_POST['verteilername'];
  }
    
  $db = dbconnect();
  $result = $db->query("SELECT count(*) Anz FROM jumi_mailverteiler WHERE upper(bezeichnung)=upper('$verteilername')");
  $row = $result->fetch_array();
  
  if ($verteilername  == ''){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Verteiler darf nicht leer sein.</div>|***|error';
        exit;
  }else if ($row['Anz'] > 0){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Verteiler ist bereits vorhanden.</div>|***|error';
        exit;
  }else{
    
        $sql1 = $db->query("INSERT INTO jumi_mailverteiler ( bezeichnung ) VALUES ( '$verteilername' )");
        if($sql1){
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Verteiler wurde gespeichert!</div>|***|success';
          exit;
        }else{
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Verteiler wurde nicht gespeichert: Insert Fehler Datenbank.</div>|***|error';
          exit;
        }
  }
}



if ($function == 'erfuser') {
  if (isset($_POST['mvid'])) {
    $mvid = $_POST['mvid'];
  }
  if (isset($_POST['mveid'])) {
    $mveid = $_POST['mveid'];
  }
    
  $db = dbconnect();
  $sql1 = $db->query("INSERT INTO jumi_mailverteiler_user_zuord ( mvid, mveid ) VALUES ( $mvid, $mveid )");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde zugewiesen!</div>|***|success|***|'.$mvid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht zugewiesen: Insert Fehler Datenbank.</div>|***|error';
    exit;
  }
}

if ($function == 'deluser') {
  if (isset($_POST['mvid'])) {
    $mvid = $_POST['mvid'];
  }
  if (isset($_POST['mveid'])) {
    $mveid = $_POST['mveid'];
  }
    
  $sql1 = $db->query("DELETE FROM jumi_mailverteiler_user_zuord WHERE mvid='$mvid' AND mveid='$mveid'");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde gelöscht!</div>|***|success|***|'.$mvid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
    exit;
  }
}


if ($function == 'delVerteiler') {
  if (isset($_POST['mvid'])) {
    $mvid = $_POST['mvid'];
  }
  
    $stmt1    = $db->query("DELETE FROM jumi_mailverteiler_user_zuord WHERE mvid= $mvid");
    $stmt2    = $db->query("DELETE FROM jumi_mailverteiler WHERE mvid= $mvid");
    if ($stmt1 AND $stmt2) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Verteiler wurde gelöscht!</div>|***|success';
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Verteiler wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
      exit;
    }
}

/*

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

*/
?>
