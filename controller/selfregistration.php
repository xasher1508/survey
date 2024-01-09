<?php
require_once("../config/datenbankanbindung.php");
require_once("../controller/func_get_parameter.php");
$db = dbconnect();
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer6/src/Exception.php';
require '../PHPMailer6/src/PHPMailer.php';
require '../PHPMailer6/src/SMTP.php';
$mailjumi = get_parameter(1);
$absender = get_parameter(2);
$mailpwd = get_parameter(3);

$function = $_POST['function'];

if ($function == 'membersave') {
    $vorname    = trim($_POST['vorname']);
    $nachname   = trim($_POST['nachname']);
    $mailan     = trim($_POST['mail']);
    $alter16    = trim($_POST['alter16']);
    $singstimme = $_POST['singstimme'];
    
    $result = $db->query("SELECT count(*) Anz FROM jumi_admin WHERE mail = '$mailan'");
    $row    = $result->fetch_array();
    
    #Fehlercheck
    $result = $db->query("SELECT count(*) Anz FROM jumi_chor_saenger WHERE mail = '$mailan'");
    $row    = $result->fetch_array();

    if ($row['Anz'] != "0") {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> User ist im System bereits vorhanden!</div>|***|error';
        exit;
    }
    if (!filter_var($mailan, FILTER_VALIDATE_EMAIL)) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
        exit;
    }
    
    $error        = 0;

    $datum = date("Y-m-d H:i:s");
    $sql1 = $db->query("INSERT INTO jumi_chor_saenger ( vorname
                                                , nachname
                                                , mail
                                                , singstimme
                                                , alter16
                                                , selfreg_date
                                                )
                              VALUES
                                                ( '$vorname'
                                                , '$nachname'
                                                , '$mailan'
                                                , '$singstimme'
                                                , '$alter16'
                                                , '$datum'
                                                )
                            ");
    if (!$sql1) {
        echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es gab ein Fehler in der Datenbank: Insert User</div>|***|error';
        $error++;
        exit;
    }

    if ($error == 0) {
#        $empfaenger      = "$mailan";
        $betreff         = "Hallo $vorname, willkommen bei JU & MI";
#        $mailjumi = get_parameter(1);
        if($alter16 == '1'){
          $text  = "
                 <html>
                 <head>
                 <title>Hallo $vorname, willkommen bei JU & MI</title>
                 </head>
                 <body>
                 <font face='Arial' size='2'>
                 Hallo $vorname!<br><br>
                 schön, dass du dich für JU & MI registriert hast!<br><br>
                 Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
                 dass wir den Jugendchor im Livestream zeigen dürfen.<br>
                 Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden..<br>
                 <br><br>
                 Bitte unterschreibe das Formular und schicke es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>
                 Falls du das Dokument nicht einscannen kannst, reicht uns ein gut lesbares Foto oder gib uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
                 <p>
                 Abonniere auch unsere sozialen Kanäle, um informiert zu bleiben:<br>
                 <table>
                 <tr>
                 <td>
                 <a href='https://www.instagram.com/jugendchor_miteinander/'><img alt='Instagram' src='cid:insta' height='20'></a>
                 </td>
                 <td>
                  <a href='https://www.instagram.com/jugendchor_miteinander/'>https://www.instagram.com/jugendchor_miteinander</a>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 <a href='https://www.tiktok.com/@jugendchor_miteinander'><img alt='Instagram' src='cid:tiktok' height='20'></a>
                 </td>
                 <td>
                 <a href='https://www.tiktok.com/@jugendchor_miteinander'>https://www.tiktok.com/@jugendchor_miteinander</a>
                 </td>
                 </tr>
                 </table>
                 <p>
                 Vielen Dank,<br>
                 euer JU & MI Team
                 </body>
                 </html>";
        }else{
          $text  = "
                 <html>
                 <head>
                 <title>Hallo $vorname, willkommen bei JU & MI</title>
                 </head>
                 <body>
                 <font face='Arial' size='2'>
                 Hallo $vorname!<br><br>
                 schön, dass du dich für JU & MI registriert hast!<br><br>
                 Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
                 dass wir den Jugendchor im Livestream zeigen dürfen.<br>
                 Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden.
                 <br><br>
                 Da du noch keine 16 Jahre alt bist, müssen deine Eltern/Sorgesberechtigte auf dem beigefügten Formular unterschreiben.<br>
                 Sobald ihr das Einverständnis habt, schickt es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>.<br>
                 Falls du das Dokument nicht einscannen kannst, reicht uns ein gut lesbares Foto oder gib uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
                 <p>
                 Abonniere auch unsere sozialen Kanäle, um informiert zu bleiben:<br>
                 <table>
                 <tr>
                 <td>
                 <a href='https://www.instagram.com/jugendchor_miteinander/'><img alt='Instagram' src='cid:insta' height='20'></a>
                 </td>
                 <td>
                  <a href='https://www.instagram.com/jugendchor_miteinander/'>https://www.instagram.com/jugendchor_miteinander</a>
                 </td>
                 </tr>
                 <tr>
                 <td>
                 <a href='https://www.tiktok.com/@jugendchor_miteinander'><img alt='Instagram' src='cid:tiktok' height='20'></a>
                 </td>
                 <td>
                 <a href='https://www.tiktok.com/@jugendchor_miteinander'>https://www.tiktok.com/@jugendchor_miteinander</a>
                 </td>
                 </tr>
                 </table>
                 <p>
                 Vielen Dank,<br>
                 euer JU & MI Team
                 </body>
                 </html>";

        }
        
    /*        
        $mailjumi = get_parameter(1);
        $absender = get_parameter(2);
        $datei = "../media/Einwilligungserklaerung_personenbezogene_Daten.pdf";
        $boundary      = "PHP-mixed-".md5(time());
        #$headers = "MIME-Version: 1.0\n";
        #$headers .= "Content-type: text/html; charset=utf-8\n";
        $headers .= "From: $absender <$mailjumi>\n";
        $headers .= "Reply-To: $absender <$mailjumi>\n";
        $headers .= "Content-Type: multipart/mixed; boundary=\"".$boundary."\"\n";
        #$headers .= " boundary=\"".$boundary."\"\r\n";
        
        $size = filesize($datei);
	$data = file_get_contents($datei);
	$type = mime_content_type($datei);
	$name = basename($datei);
        
        $data = chunk_split(base64_encode($data));
        $boundWithPre  = "\n--".$boundary;
       
        $message .= "--".$boundary."\r\n";
        $message .= "Content-Type: text/html; charset=\"UTF-8\"\r\n";
        $message .= "Content-Transfer-Encoding: 8bit\r\n\r\n";
        $message .= $text."\r\n";
        
        # Anhang ab hier
        $message .= $boundWithPre;
        $message .= "\nContent-Type: application/octet-stream; name=\"".$name."\"";
        $message .= "\nContent-Transfer-Encoding: base64\n";
        $message .= "\nContent-Disposition: attachment\n";
        $message .= $data;
        $message .= $boundWithPre."--";

        $return = @mail($empfaenger, $betreff, $message, $headers);
        
        if (!$return) { // Abfrage ob Mailversand funktioniert hat
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Vielen Dank für die Registrierung. Es konnte allerdings <b>keine Mail</b> verschickt werden!</div>|***|success';
            exit;
        } else {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Vielen Dank für die Registrierung. Eine Mail mit weiteren Hinweisen wurde an dich geschickt.</div>|***|success';
            exit;
        }
    */   
    
        $mail = new PHPMailer();
         
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
            $mail->AddAddress("$mailan", "$vorname $nachname");
            $mail->AddReplyTo("$mailjumi", "$absender");
            //$mail->addCC('cc@example.com');
#            foreach ($mail_bcc as $empfbcc) {
#                $mail->addBCC("$empfbcc");
#            }
            
            
            //Attachments
            $mail->AddEmbeddedImage('../media/insta.png', 'insta', 'insta.png');
            $mail->AddEmbeddedImage('../media/tiktok.png', 'tiktok', 'tiktok.png');
            $mail->AddAttachment("../media/Einwilligungserklaerung_personenbezogene_Daten.pdf", "Einwilligungserklaerung_personenbezogene_Daten.pdf");
            
            //Content
            $mail->isHTML(true); //Set email format to HTML
            $mail->Subject = $betreff;
            $mail->Body    = $text;
            //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
            
            $mail->send();
            require_once("../controller/func_save_mail.php");
            save_mail($mail);
            
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Vielen Dank für die Registrierung. Eine Mail mit weiteren Hinweisen wurde an dich geschickt.</div>|***|success';
        }
        catch (Exception $e) {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Vielen Dank für die Registrierung. Es konnte allerdings <b>keine Mail</b> verschickt werden!</div>|***|success';
        }
    
    
    }
}

?>