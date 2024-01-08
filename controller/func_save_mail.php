<?php

function save_mail($mail)
{
    // Mails in IMAP Gesendete schieben
    #####################################################
    ## Wegen dieser Funktion, wurde PHP Version aktiviert. Siehe ../Hinweise_zu_php8.txt
    #####################################################
    

    // # Script um sich $path anzeigen zu lassen:
    // $mbox = imap_open("{imap.ionos.de:993/imap/ssl}", "$mailjumi", "$mailpwd", OP_HALFOPEN)
    // or die("can't connect: " . imap_last_error());
    // if($mbox){
    // echo "connect";
    // }else{
    // echo "fail";
    // }
    // $list = imap_getmailboxes($mbox, "{imap.ionos.de:993/imap/ssl}", "*");
    // if (is_array($list)) {
    // foreach ($list as $key => $val) {
    // echo "($key) ";
    // echo imap_utf7_decode($val->name) . ",";
    // echo "'" . $val->delimiter . "',";
    // echo $val->attributes . "<br />\n";
    // }
    // } else {
    // echo "imap_getmailboxes failed: " . imap_last_error() . "\n";
    // }
    // 
    // imap_close($mbox);
    
    $path       = "{imap.ionos.de:993/imap/ssl}Gesendete Objekte";
    $imapStream = imap_open($path, $mail->Username, $mail->Password);
    # Letzter Flag Seen, damit die Mail bereits als gelesen in gesendete Objekte eingestellt wird
    $result     = imap_append($imapStream, $path, $mail->getSentMIMEMessage(),"\Seen");
    imap_close($imapStream);
    return true;
}

?>