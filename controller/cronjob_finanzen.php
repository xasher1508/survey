<?php
error_reporting(E_ALL);
# https://console.cron-job.org/jobs

require_once("../config/datenbankanbindung.php");
require_once("../controller/func_get_parameter.php");
require_once("../controller/func_save_mail.php");
header('Content-Type: text/html; charset=utf-8');
$db = dbconnect();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer6/src/Exception.php';
require '../PHPMailer6/src/PHPMailer.php';
require '../PHPMailer6/src/SMTP.php';

$mailjumi = get_parameter(1);
$absender = get_parameter(2);
$mailpwd = get_parameter(3);
$fmt = new NumberFormatter( 'de_DE', NumberFormatter::CURRENCY );

# Kontostand
$result_sum = $db->query("SELECT sum(betrag) kontostand
                            FROM jumi_finanzen
                        ");
$row_sum = $result_sum->fetch_array();
$kontostand = $fmt->formatCurrency($row_sum['kontostand'], "EUR");

$query = "SELECT fid, uid, beschreibung, firma, art, betrag, bemerkung FROM jumi_finanzen where mailversand is NULL ORDER BY datum ASC";
$result = $db->query( $query)
              or die ("Cannot execute query");

while ($row = $result->fetch_array()){

$result_user = $db->query("SELECT vorname, nachname
                             FROM jumi_admin
                            WHERE uid = $row[uid]");
$row_user    = $result_user->fetch_array();
if($row['art'] == 'A'){
  $art = 'Ausgabe';
  $betrag = $row['betrag']*(-1);
}
if($row['art'] == 'E'){
  $art = 'Einnahme';
  $betrag =  $row['betrag'];
}

$betrag = $fmt->formatCurrency($betrag, "EUR");

$mail = new PHPMailer();
$attachment   = array();

try {
    //Server settings
    $mail->isSMTP(); //Send using SMTP
    $mail->CharSet    = 'UTF-8';
    $mail->Encoding   = 'base64';
    $mail->SMTPDebug  = 0;
    $mail->Host       = 'web311.dogado.net'; //Set the SMTP server to send through
    $mail->SMTPAuth   = true; //Enable SMTP authentication
    $mail->Username   = "$mailjumi"; //SMTP username
    $mail->Password   = "$mailpwd"; //SMTP password
    $mail->Port       = 465; //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
    # Priority: Options: null (default), 1 = High, 3 = Normal, 5 = low
#    $mail->Priority   = 1;
    
    //Recipients
    //$mail->SetFrom($_POST["userEmail"], $_POST["userName"]);
    //$mail->AddReplyTo($_POST["userEmail"], $_POST["userName"]);
    $mail->SetFrom("$mailjumi", "$absender");
    $mail->AddAddress("$mailjumi", "$absender");
    $mail->AddReplyTo("$mailjumi", "$absender");
    //$mail->addCC('cc@example.com');

    $query1  = "SELECT filename, originalname FROM jumi_finanzen_uploads WHERE fid=$row[fid]";
    $result1 = $db->query($query1)
              or die ("Cannot execute query1");

    while ($row1 = $result1->fetch_array()){
      $a = ['filename'=>"$row1[filename]"];
      $b = ['name'=>"$row1[originalname]"];
      $attachment[] = array_merge($a, $b);

    }
    
    //Attachments

  

    if (sizeof($attachment) > 0) {
        foreach($attachment as $files) {
            $mail->AddAttachment($files['filename'], $files['name']);
        }
    }
    
    //Content
    $mail->isHTML(true); //Set email format to HTML
    $mail->Subject = "Neue $art erfasst";
        $text  = "
               <html>
               <head>
               <title>Neue $art erfasst</title>
               </head>
               <body>
               <font face='Arial' size='2'>
               Hallo,<br><br>
               im Admintool wurde eine $art erfasst:
               <br>
               <br>
               <table>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Benutzer:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $row_user[vorname] $row_user[nachname]
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Art:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $art
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Beschreibung/Firma:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $row[beschreibung] / $row[firma]
                    </font>
                  </td>
               </tr>";
              if($row['bemerkung'] != ''){
               $text  .= "
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Bemerkung:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $row[bemerkung]
                    </font>
                  </td>
               </tr>";
               }
               $text  .= "
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Betrag:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $betrag
                    </font>
                  </td>
               </tr>
               <tr>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      <b>Kontostand:</b>
                    </font>
                  </td>
                  <td valign='top'>
                    <font face='Arial' size='2'>
                      $kontostand
                    </font>
                  </td>
               </tr>
               </table>
               <br>
               Diese Mail wurde automatisch erstellt!
               <p>
               Vielen Dank,<br>
               JU & MI
               </body>
               </html>";
               
    $mail->Body    = $text;
    //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
    
    $mail->send();
    if($mail){
    
    save_mail($mail);
    $datum = date("Y-m-d H:i:s");
    $sql1 = $db->query( "UPDATE jumi_finanzen 
                            SET mailversand = '$datum'
                          WHERE fid = $row[fid]
                       " );

    }
#    echo "<hr><pre>";
#    print_r($mail);
#    echo "</pre><hr>";
#    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Mail wurde versendet!</div><br>';
}
catch (Exception $e) {
#    echo "<div class='alert alert-danger'><i class='fa fa-fw fa-thumbs-down'></i> Es konnte <b>keine Mail</b> verschickt werden! Mailer Error: {$mail->ErrorInfo}</div><br>";
}


}

?>
