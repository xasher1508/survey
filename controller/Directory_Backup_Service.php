<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
#echo __LINE__."<br>";
/**
 * Directory_Backup_Service
 * 
 * PHP5 Class Directory Backup
 * Required: PHP 5 >= 5.1.2
 *
 * @package Directory_Backup_Service
 * @author Damir Enseleit
 * @copyright 2013, SELFPHP OHG
 * @license BSD License
 * @version 1.0.0
 * @link http://www.selfphp.de
 * 
 */

class Directory_Backup_Service { 

    /**
     * @var string ZIP-Format ('zip' , 'bzip2' , 'targz')
     */
    private $zipFormat = "zip";
    
    /**
     * @var string Zeitstempel
     */
    private $timeBackup = "";
    
    /**
     * @var string Upload Filename
     */
    private $uploadFile = "";
    
    /**
     * FTP-Daten
     */
     private $ftpUser = 'backup'; // FTP Username
     private $ftpPasswd = '7655843'; // FTP Passwort
     private $ftpHost = 'www.ja-schwarz.de'; // FTP Host
     private $ftpPfad = '/backup/survey/'; // Pfad auf dem Backupserver mit führendem und endendem Slash!
    
    /**
     * Constructor 
     */
    function __construct( ) {
        
        $this->timeBackup = date("Y-m-d_H-i-s");
    
    } 
    
   
    
    /**
     * Backup komprimieren
     */ 
    public function startBackup( $dateiName, $backupName ) { 

        $tarName = $backupName . '_' . $this->timeBackup;
        
        
        if ( $this->zipFormat == 'zip' )
        {
            $tarName .= '.zip';            
            $shellBefehl = "zip -r $tarName $dateiName";
            exec($shellBefehl, $output, $retval);
#echo "<pre>";
#echo "Rückgabe mit Status $retval und Ausgabe:\n";
#print_r($output);
#echo "</pre>";
        }
        else if($self_config['zipformat'] == "bzip2")
        {
            $tarName .= '.tar.bz2';
            $shellBefehl = "tar -jcf $tarName $dateiName && bzip2 $tarName";
        }
        else
        {
            $tarName .= '.tar.gz';
            $shellBefehl = "tar -zcf $tarName $dateiName && gzip $tarName";
        }    
        
        $this->uploadFile = $tarName;
        
        exec($shellBefehl);
        
    }
    
        
    /**
     * FTP-Upload starten
     */
    public function curlUpload() {
        
        $fp = fopen($this->uploadFile, "r");
        $url = "ftp://".$this->ftpUser.":".$this->ftpPasswd."@". 
          $this->ftpHost.":21" .$this->ftpPfad.$this->uploadFile;
        
        $handle = curl_init();
        
        curl_setopt($handle, CURLOPT_URL, $url);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, 1); 
        curl_setopt($handle, CURLOPT_UPLOAD, 1);  
        curl_setopt($handle, CURLOPT_INFILE, $fp);  
        curl_setopt($handle, CURLOPT_INFILESIZE, filesize($this->uploadFile)); 

        $result = curl_exec($handle);  
        
        $info = curl_getinfo ($handle);
        
        curl_close($handle); 
        
        return $info; 

    } 
}

?> 