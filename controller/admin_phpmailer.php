<?php
require_once("../config.inc.php");
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer6/src/Exception.php';
require '../PHPMailer6/src/PHPMailer.php';
require '../PHPMailer6/src/SMTP.php';

$function = $_POST['function'];

if ($function == 'sendmail') {
$mailjumi = get_parameter(1);
$absender = get_parameter(2);
$mailpwd = get_parameter(3);



$empfaenger = $_POST['mailhidden'];
$mail_bcc   = array();
$mail_bccplain = explode("|", $empfaenger);
foreach($mail_bccplain as $mail_empfaenger) {
    $mail_empfaenger = trim($mail_empfaenger);
    array_push($mail_bcc, "$mail_empfaenger");
}
# doppelte und leere Arrays löschen
$mail_bcc = array_filter(array_unique($mail_bcc));

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
#    $mail->AddAddress("$mailjumi", "$absender");
    $mail->AddReplyTo("$mailjumi", "$absender");
    //$mail->addCC('cc@example.com');
    foreach ($mail_bcc as $empfbcc) {
        $mail->addBCC("$empfbcc");
    }
    
    
    //Attachments
    if (sizeof($_FILES["attachment"]["name"]) > 0) {
        foreach ($_FILES["attachment"]["name"] as $k => $v) {
            $mail->AddAttachment($_FILES["attachment"]["tmp_name"][$k], $_FILES["attachment"]["name"][$k]);
        }
    }
    
    //Content
    $mail->isHTML(true); //Set email format to HTML
    $mail->Subject = $_POST["subject"];
    $mail->Body    = $_POST["content"];
    //$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
    
    $mail->send();
    require_once("../controller/func_save_mail.php");
    save_mail($mail);
    
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Mail wurde versendet!</div>|***|success';
    exit;
}
catch (Exception $e) {
    echo "<div class='alert alert-danger'><i class='fa fa-fw fa-thumbs-down'></i> Es konnte <b>keine Mail</b> verschickt werden! Mailer Error: {$mail->ErrorInfo}</div>|***|error";
    exit;
}


}

if ($function == 'showmail') {
$empfaenger = $_POST['empfaenger'];
#    $empfaenger   = "S-1";
$mail_bcc   = array();

for ($i = 0; $i < sizeof($empfaenger); $i++) {
    $trenner = explode("-", $empfaenger[$i]);
    
    
    if ($trenner[0] == 'S') {
        $query = "select mail, vorname, nachname
                    from jumi_admin a, jumi_admin_rollen_user_zuord b
                   where a.uid=b.uid
                   and b.rid=$trenner[1]";
        
        $result = $db->query($query) or die("Cannot execute query");
        
        while ($row = $result->fetch_array()) {
            array_push($mail_bcc, "$row[vorname] $row[nachname]|$row[mail]");
        }
    }
    
    if ($trenner[0] == 'C') {
        $query1 = "select mail, vorname, nachname
                    from jumi_chor_saenger";
        
        $result1 = $db->query($query1) or die("Cannot execute query1");
        
        while ($row1 = $result1->fetch_array()) {
            array_push($mail_bcc, "$row1[vorname] $row1[nachname]|$row1[mail]");
        }
    }
    
    if ($trenner[0] == 'V') {
        $query2 = "select mail, vorname, nachname
                     from jumi_mailverteiler a, jumi_mailverteiler_entries b, jumi_mailverteiler_user_zuord c
                    where a.mvid=c.mvid
                      and b.mveid=c.mveid
                      and c.mvid=$trenner[1]";
        
        $result2 = $db->query($query2) or die("Cannot execute query2");
        
        while ($row2 = $result2->fetch_array()) {
            array_push($mail_bcc, "$row2[vorname] $row2[nachname]|$row2[mail]");
        }
    }
}



# Doppelte Mailadressen entfernen. Fall jemand in mehreren Gruppen aktiv ist.
$mail_bcc = array_unique($mail_bcc);


    $out = array_reduce($mail_bcc, function($left, $right) {
        // array_reduce startet "vor" dem ersten Wert, mit $left=null und $right="a".
        // Ohne diesen bedingten Ausdruck wuerde man entsprechend in der Rueckgabe ein Komma vor dem "a" erhalten.
        return ($left===null ? $right : "$left,$right");
    });
    
echo $out;
#echo "Mailadressen";
}


?>