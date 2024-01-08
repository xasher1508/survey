<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'checkuser') {
    $mail = $_POST['mail'];
    
    if (filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        $mail   = $_POST['mail'];
        $result = $db->query("SELECT count(*) Anz FROM jumi_mailverteiler_entries WHERE mail = '$mail'");
        $row    = $result->fetch_array();
        
        if ($row['Anz'] == "0") {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Kontakt ist im System nicht vorhanden!</div>';
        } else {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Kontakt ist im System bereits vorhanden!</div>';
        }
        #}else{
        # echo ""
    }
}


if ($function == 'contactsave') {
    $vorname   = trim($_POST['vorname']);
    $nachname  = trim($_POST['nachname']);
    $mail      = trim($_POST['mail']);
    $verteiler = $_POST['verteiler'];
    
    $result = $db->query("SELECT count(*) Anz FROM jumi_mailverteiler_entries WHERE mail = '$mail'");
    $row    = $result->fetch_array();
    
    #Fehlercheck
    if ($row['Anz'] != "0") {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Kontakt ist im System bereits vorhanden!</div>|***|error';
    }
    if ($vorname == '' or $nachname == '' or $mail == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es müssen alle Felder ausgefüllt werden!</div>|***|error';
        exit;
    }
    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
        exit;
    }
    
    $sql1  = $db->query("INSERT INTO jumi_mailverteiler_entries ( vorname
                                                , nachname
                                                , mail
                                                )
                              VALUES
                                                ( '$vorname'
                                                , '$nachname'
                                                , '$mail'
                                                )
                            ");
    $mveid = $db->insert_id;
    if(sizeof($verteiler) > 0){
     for ($i = 0; $i < sizeof($verteiler); $i++) {
        $sql2 = $db->query("INSERT INTO jumi_mailverteiler_user_zuord ( mvid
                                                                 , mveid
                                                                 )
                                VALUES
                                                                 ( '$verteiler[$i]'
                                                                 , '$mveid'
                                                                 )
                              ");
      }
      if (!$sql2) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert Kontaktzuordnung</div>|***|error';
          exit;
      }
    } 
    if (!$sql1) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert Kontakt</div>|***|error';
        exit;
    } else {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Kontakt wurde angelegt!</div>|***|success';
        exit;
    }
    
}

if ($function == 'contactupdate') {
    
    $vorname  = trim($_POST['vorname']);
    $nachname = trim($_POST['nachname']);
    $mail     = trim($_POST['mail']);
    $verteiler   = $_POST['verteiler'];
    $pwdback  = $_POST['pwdback'];
    $mveid      = $_POST['mveid'];
    
    
    if (isset($pwdback)) {
        if ($pwdback == '1') {
            $pwdback = '1';
        } else {
            $pwdback = '0';
        }
    } else {
        $pwdback = '0';
    }
    
    
    
    
    if ($mveid == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die KontaktID wurde nicht übertragen</div>|***|error';
        exit;
    }
    if ($vorname == '' or $nachname == '' or $mail == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es müssen alle Felder ausgefüllt werden!</div>|***|error';
        exit;
    }
    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
        exit;
    }
    
    $sql1 = $db->query("UPDATE jumi_mailverteiler_entries 
                           SET vorname = '$vorname'
                              ,nachname = '$nachname'
                              ,mail =  '$mail'
                          WHERE mveid = $mveid");
    if(sizeof($verteiler) > 0){
    $sql2 = $db->query("DELETE FROM jumi_mailverteiler_user_zuord WHERE mveid = $mveid");
     for ($i = 0; $i < sizeof($verteiler); $i++) {
        $sql2 = $db->query("INSERT INTO jumi_mailverteiler_user_zuord ( mvid
                                                                 , mveid
                                                                 )
                                VALUES
                                                                 ( '$verteiler[$i]'
                                                                 , '$mveid'
                                                                 )
                              ");
      }
      if (!$sql2) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert Kontaktzuordnung</div>|***|error';
          exit;
      }
    }
    if (!$sql1) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Update Kontakt</div>|***|error';
        exit;
    } else {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Kontakt wurde aktualisiert!</div>|***|success';
        exit;
    }
}


if ($function == 'deleteContact') {
    $mveid = $_POST['mveid'];
    
    $sql1 = $db->query("DELETE FROM jumi_mailverteiler_user_zuord WHERE mveid = $mveid");
    $sql2 = $db->query("DELETE FROM jumi_mailverteiler_entries WHERE mveid = $mveid");
    if (!$sql1 or !$sql2) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: deleteContact</div>|***|error';
        exit;
    } else {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Kontakt wurde entfernt.</div>|***|success';
        exit;
    }
}


?>
