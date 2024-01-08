<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'checkuser') {
    $mail = $_POST['mail'];
    
    if (filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        $mail   = $_POST['mail'];
        $result = $db->query("SELECT count(*) Anz FROM jumi_admin WHERE mail = '$mail'");
        $row    = $result->fetch_array();
        
        if ($row['Anz'] == "0") {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> User ist im System nicht vorhanden!</div>';
        } else {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> User ist im System bereits vorhanden!</div>';
        }
        #}else{
        # echo ""
    }
}

#echo "Funktion: $function";
if ($function == 'usersave') {
    require_once("func_genPwd.php");
    $vorname  = trim($_POST['vorname']);
    $nachname = trim($_POST['nachname']);
    $mail     = trim($_POST['mail']);
    $rollen   = $_POST['rollen'];
    
    $result = $db->query("SELECT count(*) Anz FROM jumi_admin WHERE mail = '$mail'");
    $row    = $result->fetch_array();
    
    #Fehlercheck
    if ($row['Anz'] != "0") {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> User ist im System bereits vorhanden!</div>|***|error';
    }
    if ($rollen == '' or $vorname == '' or $nachname == '' or $mail == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es müssen alle Felder ausgefüllt werden!</div>|***|error';
        exit;
    }
    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
        exit;
    }
    
    $error        = 0;
    $password     = generateStrongPassword();
    $password_md5 = md5($password);
    
    $sql1 = $db->query("INSERT INTO jumi_admin ( vorname
                                                , nachname
                                                , mail
                                                , passwort
                                                )
                              VALUES
                                                ( '$vorname'
                                                , '$nachname'
                                                , '$mail'
                                                , '$password_md5'
                                                )
                            ");
    $uid  = $db->insert_id;
    if (!$sql1) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert User</div>|***|error';
        $error++;
        exit;
    }
    for ($i = 0; $i < sizeof($rollen); $i++) {
        $sql2 = $db->query("INSERT INTO jumi_admin_rollen_user_zuord ( rid
                                                                 , uid
                                                                 )
                                VALUES
                                                                 ( '$rollen[$i]'
                                                                 , '$uid'
                                                                 )
                              ");
    }
    if (!$sql2) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert Rollenzuordnung</div>|***|error';
        exit;
        $error++;
    }
    
    if ($error == 0) {
        $empfaenger      = "$mail";
        $betreff         = "Anmeldung JU & MI Portal";
        $text            = "
               <html>
               <head>
               <title>Anmeldung JU & MI Portal</title>
               </head>
               <body>
               <font face='Arial' size='2'>
               Guten Tag $vorname $nachname!<br><br>
               Sie wurden im JU & MI Portal registriert!<br>
               Nachfolgend finden Sie Ihre Zugangsdaten:
               <br>
               <br>
               <table>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Benutzerkennung:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $mail
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Passwort:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $password
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Login:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <a href='http://admin.ju-and-mi.de'>http://admin.ju-and-mi.de</a>
                    </font>
                  </td>
               </tr>
               </table>
               <br>
               Bitte beachten Sie, dass das Passwort zwischen Gro&szlig;- und<br>
               Kleinschreibung unterscheidet.
               <p>
               &Auml;ndern Sie bitte zu Ihrer eigenen Sicherheit das<br>
               Passwort nach dem ersten Login unter dem Benutzericon in der Kopfleiste.
               <p>
               Vielen Dank
               </body>
               </html>";
        $mailjumi = get_parameter(1);
        $absender = get_parameter(2);
        $headers = "MIME-Version: 1.0\n";
        $headers .= "Content-type: text/html; charset=utf-8\n";
        $headers .= "From: $absender <$mailjumi>\n";
        
        $return = @mail($empfaenger, $betreff, $text, $headers);
        
        if (!$return) { // Abfrage ob Mailversand funktioniert hat
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> BenutzerIn wurde angelegt. Es konnte allerdings <b>keine Mail</b> verschickt werden!</div>|***|success';
            exit;
        } else {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> BenutzerIn wurde angelegt. Eine Mail mit den Zugangsdaten wurde zugestellt.</div>|***|success';
            exit;
        }
        
    }
}

if ($function == 'userupdate') {
    
    $vorname  = trim($_POST['vorname']);
    $nachname = trim($_POST['nachname']);
    $mail     = trim($_POST['mail']);
    $rollen   = $_POST['rollen'];
    $pwdback  = $_POST['pwdback'];
    $uid      = $_POST['uid'];
    
    
    if (isset($pwdback)) {
        if ($pwdback == '1') {
            $pwdback = '1';
        } else {
            $pwdback = '0';
        }
    } else {
        $pwdback = '0';
    }
    
    
    
    
    if ($uid == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die BenutzerID wurde nicht übertragen</div>|***|error';
        exit;
    }
    if ($rollen == '' or $vorname == '' or $nachname == '' or $mail == '') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es müssen alle Felder ausgefüllt werden!</div>|***|error';
        exit;
    }
    if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
        exit;
    }
    
    $error        = 0;
    
    if($pwdback == 1){
      require_once("func_genPwd.php");
      $password     = generateStrongPassword();
      $password_md5 = md5($password);
    }else{
        $result_pwd = $db->query("SELECT passwort FROM jumi_admin WHERE uid = $uid");
        $row_pwd    = $result_pwd->fetch_array();
        $password_md5 = $row_pwd['passwort'];
    }
    $sql1 = $db->query("UPDATE jumi_admin 
                           SET vorname = '$vorname'
                              ,nachname = '$nachname'
                              ,mail =  '$mail'
                              ,passwort = '$password_md5'
                          WHERE uid = $uid");
        if (!$sql1) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Update User</div>|***|error';
          exit;
          $error++;
        }
    
    $sql2 = $db->query("DELETE FROM jumi_admin_rollen_user_zuord WHERE uid = $uid");
    for ($i = 0; $i < sizeof($rollen); $i++) {
        $sql2 = $db->query("INSERT INTO jumi_admin_rollen_user_zuord ( rid
                                                                 , uid
                                                                 )
                                VALUES
                                                                 ( '$rollen[$i]'
                                                                 , '$uid'
                                                                 )
                              ");
    }
    if (!$sql2) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert Rollenzuordnung</div>|***|error';
        exit;
        $error++;
    }
    
    
    if($pwdback == 1){
        $empfaenger      = "$mail";
        $betreff         = "Update JU & MI Portal";
        $text            = "
               <html>
               <head>
               <title>Update JU & MI Portal</title>
               </head>
               <body>
               <font face='Arial' size='2'>
               Guten Tag $vorname $nachname!<br><br>
               Sie wurden im JU & MI Portal geändert!<br>
               Nachfolgend finden Sie Ihre Zugangsdaten:
               <br>
               <br>
               <table>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Benutzerkennung:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $mail
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Passwort:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $password
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Login:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <a href='http://admin.ju-and-mi.de'>http://admin.ju-and-mi.de</a>
                    </font>
                  </td>
               </tr>
               </table>
               <br>
               Bitte beachten Sie, dass das Passwort zwischen Gro&szlig;- und<br>
               Kleinschreibung unterscheidet.
               <p>
               &Auml;ndern Sie bitte zu Ihrer eigenen Sicherheit das<br>
               Passwort nach dem ersten Login unter dem Benutzericon in der Kopfleiste.
               <p>
               Vielen Dank
               </body>
               </html>";
        $mailjumi = get_parameter(1);
        $absender = get_parameter(2);
        
        $headers = "MIME-Version: 1.0\n";
        $headers .= "Content-type: text/html; charset=utf-8\n";
        $headers .= "From: $absender <$mailjumi>\n";
        
        $return = @mail($empfaenger, $betreff, $text, $headers);
        
        if (!$return) { // Abfrage ob Mailversand funktioniert hat
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> BenutzerIn wurde aktualisiert. Es konnte allerdings <b>keine Mail</b> verschickt werden!</div>|***|success';
            exit;
        } else {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> BenutzerIn wurde aktualisiert. Eine Mail mit den Zugangsdaten wurde zugestellt.</div>|***|success';
            exit;
        }
    }else{
      if ($error == 0) {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> BenutzerIn wurde aktualisiert.</div>|***|success';
            exit;
      }else{
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> BenutzerIn wurde  nicht aktualisiert.</div>|***|success';
            exit;
      }
    }
}


if ($function == 'disableuser') {
    $uid      = $_POST['uid'];
    
    $sql1 = $db->query("UPDATE jumi_admin 
                           SET aktiv = '0'
                         WHERE uid = $uid");
    if (!$sql1) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Disable User</div>|***|error';
          exit;
    }else{
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> BenutzerIn wurde gesperrt.</div>|***|success';
          exit;
    }
}

if ($function == 'enableuser') {
    $uid      = $_POST['uid'];
    
    $sql1 = $db->query("UPDATE jumi_admin 
                           SET aktiv = '1'
                         WHERE uid = $uid");
    if (!$sql1) {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Enable User</div>|***|error';
          exit;
    }else{
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> BenutzerIn wurde aktiviert.</div>|***|success';
          exit;
    }
}

?>