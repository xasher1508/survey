<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'rollesave') {
  if (isset($_POST['rollenname'])) {
    $rollenname = $_POST['rollenname'];
  }
    
  $db = dbconnect();
  $result = $db->query("SELECT count(*) Anz FROM jumi_admin_rolle WHERE upper(bezeichnung)=upper('$rollenname')");
  $row = $result->fetch_array();
  
  if ($rollenname  == ''){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Rollenname darf nicht leer sein.</div>|***|error';
        exit;
  }else if ($row['Anz'] > 0){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Rollenname ist bereits vorhanden.</div>|***|error';
        exit;
  }else{
    
        $sql1 = $db->query("INSERT INTO jumi_admin_rolle ( bezeichnung ) VALUES ( '$rollenname' )");
        if($sql1){
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Rollenname wurde gespeichert!</div>|***|success';
          exit;
        }else{
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Rollenname wurde nicht gespeichert: Insert Fehler Datenbank.</div>|***|error';
          exit;
        }
  }
}


if ($function == 'erfzuordnung') {
  if (isset($_POST['rid'])) {
    $rid = $_POST['rid'];
  }
  if (isset($_POST['meid'])) {
    $meid = $_POST['meid'];
  }
    
  $db = dbconnect();
  $sql1 = $db->query("INSERT INTO jumi_admin_rollen_rechte_zuord ( rid, meid) VALUES ( $rid, $meid )");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Das Recht wurde zugewiesen!</div>|***|success|***|'.$rid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das Recht wurde nicht zugewiesen: Insert Fehler Datenbank.</div>|***|error';
    exit;
  }
}

if ($function == 'delzuordnung') {
  if (isset($_POST['rid'])) {
    $rid = $_POST['rid'];
  }
  if (isset($_POST['meid'])) {
    $meid = $_POST['meid'];
  }
    
  $sql1 = $db->query("DELETE FROM jumi_admin_rollen_rechte_zuord WHERE rid='$rid' AND meid='$meid'");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Das Recht wurde gelöscht!</div>|***|success|***|'.$rid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das Recht wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
    exit;
  }
}


if ($function == 'erfuser') {
  if (isset($_POST['rid'])) {
    $rid = $_POST['rid'];
  }
  if (isset($_POST['uid'])) {
    $uid = $_POST['uid'];
  }
    
  $db = dbconnect();
  $sql1 = $db->query("INSERT INTO jumi_admin_rollen_user_zuord ( rid, uid) VALUES ( $rid, $uid )");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde zugewiesen!</div>|***|success|***|'.$rid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht zugewiesen: Insert Fehler Datenbank.</div>|***|error';
    exit;
  }
}

if ($function == 'deluser') {
  if (isset($_POST['rid'])) {
    $rid = $_POST['rid'];
  }
  if (isset($_POST['uid'])) {
    $uid = $_POST['uid'];
  }
    
  $sql1 = $db->query("DELETE FROM jumi_admin_rollen_user_zuord WHERE rid='$rid' AND uid='$uid'");
  if($sql1){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Der Benutzer wurde gelöscht!</div>|***|success|***|'.$rid;
    exit;
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
    exit;
  }
}


if ($function == 'delRole') {
  if (isset($_POST['rid'])) {
    $rid = $_POST['rid'];
  }
  
    $stmt1    = $db->query("DELETE FROM jumi_admin_rollen_rechte_zuord WHERE rid= $rid");
    $stmt2    = $db->query("DELETE FROM jumi_admin_rollen_user_zuord WHERE rid= $rid");
    $stmt3    = $db->query("DELETE FROM jumi_admin_rolle WHERE rid= $rid");
    if ($stmt1 AND $stmt2 AND $stmt3) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Rolle wurde gelöscht!</div>|***|success';
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Rolle wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|error';
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