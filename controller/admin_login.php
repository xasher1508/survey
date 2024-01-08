<?php
# https://www.php-einfach.de/experte/php-codebeispiele/loginscript/angemeldet-bleiben/
require_once("../config/datenbankanbindung.php");
require_once("func_get_parameter.php");
$db = dbconnect();

$function = $_POST['function'];
if(!isset($_SESSION)) { session_start(); }

if ($function == 'logout') {
  if($_SESSION['angemeldet_bleiben'] == 1){
    $identifier = $_COOKIE['identifier'];
    $securitytoken = $_COOKIE['securitytoken'];
    $token_neu = sha1($securitytoken);
    $sql1 = $db->query("DELETE FROM jumi_securitytokens
                         WHERE securitytoken ='$token_neu'
                           AND identifier = '$identifier'
                      ");
  }
  //Cookies entfernen
  session_destroy();
  setcookie("identifier","",time()-(3600*24*365)); 
  setcookie("securitytoken","",time()-(3600*24*365)); 
  header("location:../dashboard/login.php");
}



function random_string() {
   if(function_exists('random_bytes')) {
      $bytes = random_bytes(16);
      $str = bin2hex($bytes); 
   } else if(function_exists('openssl_random_pseudo_bytes')) {
      $bytes = openssl_random_pseudo_bytes(16);
      $str = bin2hex($bytes); 
   } else if(function_exists('mcrypt_create_iv')) {
      $bytes = mcrypt_create_iv(16, MCRYPT_DEV_URANDOM);
      $str = bin2hex($bytes); 
   } else {
      //Bitte euer_geheim_string durch einen zufälligen String mit >12 Zeichen austauschen
      $str = md5(uniqid('#!af445bsvjke34vas', true));
   }   
   return $str;
}

//Automatischer Login
#if ($function != 'login') {
if ($function == '') {
if(!isset($_SESSION['userid']) && isset($_COOKIE['identifier']) && isset($_COOKIE['securitytoken'])) {

   $identifier = $_COOKIE['identifier'];
   $securitytoken = $_COOKIE['securitytoken'];

   
   $result = $db->query("SELECT * FROM jumi_securitytokens WHERE identifier ='$identifier'");
   $securitytoken_row    = $result->fetch_array();

##   $statement = $pdo->prepare("SELECT * FROM jumi_securitytokens WHERE identifier = ?");
##   $result = $statement->execute(array($identifier));
##   $securitytoken_row = $statement->fetch();
   
   if(sha1($securitytoken) !== $securitytoken_row['securitytoken']) {
#      die('Ein vermutlich gestohlener Security Token wurde identifiziert');
      header("location:../dashboard/login.php");
   } else { //Token war korrekt         
      //Setze neuen Token
      $neuer_securitytoken = random_string();            
#      $insert = $pdo->prepare("UPDATE jumi_securitytokens SET securitytoken = :securitytoken WHERE identifier = :identifier");
#      $insert->execute(array('securitytoken' => sha1($neuer_securitytoken), 'identifier' => $identifier));
      $token_neu = sha1($neuer_securitytoken);
        $update = $db->query("UPDATE jumi_securitytokens
                                 SET securitytoken ='$token_neu'
                               WHERE identifier = '$identifier'
                            ");

      
      
      setcookie("identifier",$identifier,time()+(3600*24*365)); //1 Jahr Gültigkeit
      setcookie("securitytoken",$neuer_securitytoken,time()+(3600*24*365)); //1 Jahr Gültigkeit
      $_SESSION['angemeldet_bleiben'] = 1;
      
      //Logge den Benutzer ein
      $_SESSION['userid'] = $securitytoken_row['uid'];
      $redirect = $_SESSION['cur_page'];
      if($redirect != ''){
        header("location:$redirect");
      }else{
        header("location:../dashboard/index.php");
      }
   }
}else{
  if(!isset($_SESSION['userid'])){
    header("location:../dashboard/login.php");
  }
}

}

if ($function == 'login') {
  $mail=mb_strtoupper($_POST["mail"]); //remove case sensitivity on the mail
  $password=$_POST["password"];
  
  
  if($_POST["mail"] != ""){
    $_SESSION["global_mail"]=$mail;
  }
  
  if($mail == "" OR $password == ""){
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Bitte f&uuml;llen Sie alle Felder aus!</div>|***|error';
        exit;
  }else{
  
  
  $result = $db->query("SELECT uid, mail, passwort, aktiv FROM jumi_admin WHERE UPPER(mail)='$mail'");
  $row = $result->fetch_array();
  
  if ($row['aktiv']  == '0'){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Ihr Benutzeraccount ist inaktiv.</div>|***|error';
        exit;
  }else if (md5($password) != $row['passwort'] or $row['mail'] == ''){  //verschlüsseltes Passwort überprüfen
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Bitte pr&uuml;fen Sie Ihre Zugangsdaten</div>|***|error';
        exit;
  }else{
      $uid = $row['uid'];

      //Möchte der Nutzer angemeldet beleiben?
      if($_POST['angemeldet_bleiben'] == 1) {

           $identifier = random_string();
           $securitytoken = random_string();
           
#         $insert = $pdo->prepare("INSERT INTO jumi_securitytokens (user_id, identifier, securitytoken) VALUES (:user_id, :identifier, :securitytoken)");
#         $insert->execute(array('user_id' => $user['id'], 'identifier' => $identifier, 'securitytoken' => sha1($securitytoken)));
           $token_neu = sha1($securitytoken);
           $result_1 = $db->query("INSERT INTO jumi_securitytokens (uid, identifier, securitytoken) VALUES ('$uid', '$identifier', '$token_neu')");
           setcookie("identifier",$identifier,time()+(3600*24*365)); //1 Jahr Gültigkeit
           setcookie("securitytoken",$securitytoken,time()+(3600*24*365)); //1 Jahr Gültigkeit
           $_SESSION['angemeldet_bleiben'] = 1;
      }else{
        $_SESSION['angemeldet_bleiben'] = 0;
      }

    $datum=date("Y-m-d H:i:s");
    $ip=getenv("REMOTE_ADDR");
    $agent=getenv("HTTP_USER_AGENT");
    $_SESSION['userid'] = $uid;
    $_SESSION["global_mail"] = $row['mail'];
    $result_1 = $db->query("INSERT INTO jumi_adminlog (Datum, IP, user_agent, uid) VALUES ('$datum', '$ip', '$agent', '$uid')");
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Login wird durchgef&uuml;hrt</div>|***|success';
  }
  }    
}

if ($function == 'passwortvergessen') {

  $mail = $_POST['email'];
  
  $result_pw = $db->query("SELECT uid, aktiv, vorname, nachname, mail FROM jumi_admin WHERE UPPER(mail)=UPPER('$mail')");
  $row_pw = $result_pw->fetch_array();
  
 if(!isset($_POST['email']) || empty($_POST['email'])) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Bitte geben Sie eine E-Mail-Adresse ein.</div>|***|error';
        exit;
 } elseif($row_pw['aktiv'] == '0') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer ist inaktiv. Melden Sie sich beim Administrator.</div>|***|error';
        exit;
 }elseif ($row_pw['mail'] == ''){
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer wurde nicht im System gefunden.</div>|***|error';
        exit;
 }else{
    $passwortcode = random_string(); 
    $pwcode_sha1  = sha1($passwortcode);
    $uid = $row_pw['uid'];
    $vorname = $row_pw['vorname'];
    $nachname = $row_pw['nachname'];
    # Benutzer auf allen Geräten abmelden

    $sql1 = $db->query("DELETE FROM jumi_securitytokens
                        WHERE uid = '$uid'
                     ");
                     
    # 
    $sql1 = $db->query("UPDATE jumi_admin
                          SET passwortcode = '$pwcode_sha1'
                            , passwortcode_time = NOW()
                        WHERE uid = '$uid'
                     ");
                     
    $empfaenger       = "$mail";
    $betreff          = "Passwort vergessen - JU & MI Portal";
    $url_passwortcode = 'http://admin.ju-and-mi.de/passwortzuruecksetzen.php?uid='.$row_pw['uid'].'&code='.$passwortcode;
    $text             = "
           <html>
           <head>
           <title>Passwort vergessen - JU & MI Portal</title>
           </head>
           <body>
           <font face='Arial' size='2'>
           Guten Tag $vorname $nachname!<br><br>
           für den Account im JU & MI Portal wurde ein neues Passwort angefordert.<br>
           Um ein neues Passwort zu vergeben, rufen Sie innerhalb der nächsten 24 Stunden die folgende Website auf:
           <br>
           <br>
           $url_passwortcode<br>
           <br>
           Sollte Ihnen das Passwort wieder eingefallen sein oder Sie diese nicht angefordert haben, ignorieren Sie bitte diese E-Mail.
           </body>
           </html>";
    $mailjumi = get_parameter(1);
    $absender = get_parameter(2);
    $headers = "MIME-Version: 1.0\n";
    $headers .= "Content-type: text/html; charset=utf-8\n";
    $headers .= "From: $absender <$mailjumi>\n";
    
    $return = @mail($empfaenger, $betreff, $text, $headers);
    
    if (!$return) { // Abfrage ob Mailversand funktioniert hat
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es konnte <b>keine Mail</b> verschickt werden!<br>Wenden Sie sich an den Administrator.</div>|***|success';
        exit;
    } else {
        echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Eine Mail wurde Ihnen zugestellt.<br><b>Checken Sie auch den Spam Ordner!</b></div>|***|success';
        exit;
    }
 }
}



if ($function == 'resetpasswort') {
    
    $password_new1 = $_POST['password_new1'];
    $password_new2 = $_POST['password_new2'];
    $uid           = $_POST['uid'];
    $code          = $_POST['code'];

    $result = $db->query("SELECT uid, vorname, nachname, mail, aktiv, passwortcode, passwortcode_time FROM jumi_admin WHERE uid=$uid");
    $row    = $result->fetch_array();
    
    #Fehlercheck
    if(!isset($uid) || !isset($code)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Leider wurde beim Aufruf dieser Website kein Code zum Zur&uuml;cksetzen des Passworts &uuml;bermittelt!</div>|***|error';
        exit;
    }elseif ($row === null || $row['passwortcode'] === null ) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es wurde kein passender Benutzer gefunden!</div>|***|error';
        exit;
    }elseif($row['aktiv'] == '0') {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Benutzer ist inaktiv. Melden Sie sich beim Administrator.</div>|***|error';
        exit;
    }elseif($row['passwortcode_time'] === null || strtotime($row['passwortcode_time']) < (time()-24*3600) ) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der Code ist leider abgelaufen. Setzen Sie das Passwort erneut zur&uuml;ck!</div>|***|error';
        exit;
    }elseif(sha1($code) != $row['passwortcode']) {
         echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Der &uuml;bergebene Code war ung&uuml;ltig.<br>Stellen Sie sicher, dass Sie den genauen Link in der URL aufrufen.</div>|***|error';
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
                                    ,passwortcode = NULL
                                    ,passwortcode_time = NULL
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