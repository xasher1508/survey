 <?php

include_once ('Directory_Backup_Service.php'); 

$fileBackup = new Directory_Backup_Service( );

// Backup erstellen
$fileBackup->startBackup( '../../survey/', 'survey' ); 

// FTP-Upload starten
$infoF = $fileBackup->curlUpload( ); 
$files = glob('./*.zip'); // get all zip file names
foreach($files as $file){ // iterate files
  if(is_file($file)) {
    unlink($file); // delete file
  }
}

echo 'Dateigröße: ' . $infoF['size_upload'] . '<br>';
echo 'Geschwindigkeit: ' . $infoF['speed_upload'] . '<br>';
echo 'Gesamtzeit: ' . $infoF['total_time'] . '<br><br>';

//print_r($infoF);

?>  
