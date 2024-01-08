<?php
error_reporting(E_ALL);

$mbox = imap_open("{imap.ionos.de:993/imap/ssl}", "info@ju-and-mi.de", "!S3ge1gP", OP_HALFOPEN)
      or die("can't connect: " . imap_last_error());
if($mbox){
echo "connect";
}else{
echo "fail";
}
$list = imap_getmailboxes($mbox, "{imap.ionos.de:993/imap/ssl}", "*");
if (is_array($list)) {
    foreach ($list as $key => $val) {
        echo "($key) ";
        echo imap_utf7_decode($val->name) . ",";
        echo "'" . $val->delimiter . "',";
        echo $val->attributes . "<br />\n";
    }
} else {
    echo "imap_getmailboxes failed: " . imap_last_error() . "\n";
}

imap_close($mbox);

?>