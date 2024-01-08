<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'changepwd') {
    $password = md5($_POST['password']);
    $password_new1 = $_POST['password_new1'];
    $password_new2 = $_POST['password_new2'];

    $result = $db->query("SELECT count(*) Anz FROM jumi_admin WHERE uid=$uid AND passwort = '$password'");
    $row    = $result->fetch_array();
    
    #Fehlercheck
    if ($row['Anz'] == "0") {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das alte Passwort ist nicht korrekt!</div>|***|error';
        exit;
    }elseif ($password_new1 != $password_new2) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das neue Passwort stimmt nicht mit der Wiederholung &uuml;berein!</div>|***|error';
        exit;
    }elseif (strlen($password_new1) < 8) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Das neue Passwort muss mindestens 8 Zeichen haben!</div>|***|error';
        exit;
    }else{
        $password_md5 = md5($password_new1);
        $update = $db->query("UPDATE jumi_admin
                                 SET passwort ='$password_md5'
                               WHERE uid=$uid
                            ");
        if (!$update) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es liegt ein Fehler in der Datenbank vor!</div>|***|error';
          exit;
        }else{
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Das Passwort wurde geändert!</div>|***|success';
          exit;
        }

    }
}

?>