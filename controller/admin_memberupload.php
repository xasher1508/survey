<?php
require_once ("../config.inc.php");
$function = $_POST['function'];

if ($function == 'checkuser') {
    $mail = $_POST['mail'];
    
    if (filter_var($mail, FILTER_VALIDATE_EMAIL)) {
        $mail   = $_POST['mail'];
        $result = $db->query("SELECT count(*) Anz FROM jumi_chor_saenger WHERE mail = '$mail'");
        $row    = $result->fetch_array();
        
        if ($row['Anz'] == "0") {
            echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> SängerIn ist im System nicht vorhanden!</div>';
        } else {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> SängerIn ist im System bereits vorhanden!</div>';
        }
        #}else{
        # echo ""
    }
}

if ($function == 'save_with_files')
{

    if (isset($_POST) && $_SERVER['REQUEST_METHOD'] == "POST")
    {
        ## Dieses Script wird für jede Datei einzeln aufgerufen durch vpb_uploader.js. Bei 3 Dateien, 3x
        $vorname = $_POST['vorname'];
        $nachname = $_POST['nachname'];
        $mail = $_POST['mail'];
        #csid gesetzt, wenn Member bearbeitet wird
        if(isset($_POST['csid_edit'])){
          $csid_edit = $_POST['csid_edit'];
        }else{
          $csid_edit = 0;
        }
        $einw_livestream = $_POST['einw_livestream'];
        $einw_homepage = $_POST['einw_homepage'];
        $einw_socialmedia = $_POST['einw_socialmedia'];
        $alter16 = $_POST['alter16'];
        $singstimme = $_POST['singstimme'];
        $bemerkung   = $db->real_escape_string(stripslashes( $_POST['bemerkung'] ));

// Fehlercheck funktioniert hier nicht. Das Script wird so oft aufgerufen wie Dateien angehängt werden. Bei mehreren Dateien ist spätestens nach dem zweiten Aufruf der Sänger vorhanden
//        $result = $db->query("SELECT count(*) Anz FROM jumi_chor_saenger WHERE mail = '$mail'");
//        $row    = $result->fetch_array();
//        
//        #Fehlercheck
//        if ($row['Anz'] != "0") {
//            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> User ist im System bereits vorhanden!</div>|***|error';
//        }
        if ($singstimme == '' or $vorname == '' or $nachname == '' or $mail == ''or $alter16 == '') {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Es müssen die Felder<br>
            <ul>
              <li>Vorname</li>
              <li>Nachname</li>
              <li>Mailadresse</li>
              <li>Singstimme</li>
              <li>Alter</li>
            </ul>
            ausgefüllt werden!</div>|***|error';
            exit;
        }
        if (!filter_var($mail, FILTER_VALIDATE_EMAIL)) {
            echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Geben Sie eine gültige Mailadresse ein!</div>|***|error';
            exit;
        }
    
        $datum_file = date("Ymd_His_");
        #$vpb_file_name = strip_tags($_FILES['upload_file']['name']); //File Name
        $vpb_file_name = str_replace(array(
            "ä",
            "ö",
            "ü",
            "ß",
            "Ä",
            "Ö",
            "Ü",
            " "
        ) , array(
            "ae",
            "oe",
            "ue",
            "ss",
            "Ae",
            "Oe",
            "Ue",
            "_"
        ) , $_FILES['upload_file']['name']);
        $originalname = $_FILES['upload_file']['name'];
        $vpb_file_name = $datum_file . $vpb_file_name;
        $vpb_file_id = strip_tags($_POST['upload_file_ids']); // File id is gotten from the file name
        $vpb_file_size = $_FILES['upload_file']['size']; // File Size
        $vpb_uploaded_files_location = '../media/file_upload/member/'; //This is the directory where uploaded files are saved on your server
        $vpb_final_location = $vpb_uploaded_files_location . $vpb_file_name; //Directory to save file plus the file to be saved
        //Without Validation and does not save filenames in the database
        

        if (move_uploaded_file(strip_tags($_FILES['upload_file']['tmp_name']) , $vpb_final_location))
        {
            $datum = date("Y-m-d H:i:s");
            $result = $db->query("SELECT csid 
                                        FROM jumi_chor_saenger
                                       WHERE vorname = '$vorname'
                                         AND nachname = '$nachname'
                                         AND singstimme = '$singstimme'
                                         AND mail = '$mail'
                                    ");
            $row = $result->fetch_array();
            if(isset($row['csid'])){
              $csid_vorh = $row['csid'];
            }else{
              $csid_vorh =  '';
            }
            if ($csid_vorh == '' AND $csid_edit == '-1')
            {
            
               $sql1 = $db->query("INSERT INTO jumi_chor_saenger ( vorname
                                                           , nachname
                                                           , mail
                                                           , singstimme
                                                           , bemerkung
                                                           , einw_livestream
                                                           , einw_homepage
                                                           , einw_socialmedia
                                                           , alter16
                                                           , selfreg_date
                                                           )
                                         VALUES
                                                           ( '$vorname'
                                                           , '$nachname'
                                                           , '$mail'
                                                           , '$singstimme'
                                                           , '$bemerkung'
                                                           , '$einw_livestream'
                                                           , '$einw_homepage'
                                                           , '$einw_socialmedia'
                                                           , '$alter16'
                                                           , '$datum'
                                                           )
                                       ");
               $csid  = $db->insert_id;
               
               # Da diese Funktion mehrfach durchläuft, wird gleich beim Insert die Mail an den Sänger geschickt, damit die Zustellung nur einmal erfolgt
               $empfaenger      = "$mail";
               $betreff         = "Anmeldung JU & MI";
               $mailjumi = get_parameter(1);
               if($alter16 == '1'){
                 $text  = "
                        <html>
                        <head>
                        <title>Registrierung JU & MI</title>
                        </head>
                        <body>
                        <font face='Arial' size='2'>
                        Hallo $vorname!<br><br>
                        schön, dass du dich für den Jugendchor registriert hast!<br><br>
                        Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
                        dass wir den Jugendchor im Livestream zeigen dürfen.<br>
                        Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden..<br>
                        <br><br>
                        Bitte unterschreibt das Formular und schickt es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>
                        Falls ihr das Dokument nicht einscannen könnt, reicht ein gut lesbares Foto oder gebt uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
                        <p>
                        Vielen Dank,<br>
                        euer JU & MI Team
                        </body>
                        </html>";
               }else{
                 $text  = "
                        <html>
                        <head>
                        <title>Registrierung JU & MI</title>
                        </head>
                        <body>
                        <font face='Arial' size='2'>
                        Hallo $vorname!<br><br>
                        schön, dass du dich für den Jugendchor registriert hast!<br><br>
                        Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
                        dass wir den Jugendchor im Livestream zeigen dürfen.<br>
                        Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden.
                        <br><br>
                        Da du noch keine 16 Jahre alt bist, müssen deine Eltern/Sorgesberechtigte auf dem beigefügten Formular unterschreiben.<br>
                        Sobald ihr das Einverständnis habt, schickt es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>.<br>
                        Falls ihr das Dokument nicht einscannen könnt, reicht ein gut lesbares Foto oder gebt uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
                        <p>
                        Vielen Dank,<br>
                        euer JU & MI Team
                        </body>
                        </html>";

               }
               
               
               $mailjumi = get_parameter(1);
               $absender = get_parameter(2);
               $datei = "../media/Einwilligungserklaerung_personenbezogene_Daten.pdf";
               $boundary      = "PHP-mixed-".md5(time());
               #$headers = "MIME-Version: 1.0\n";
               #$headers .= "Content-type: text/html; charset=utf-8\n";
               $headers = "From: $mailjumi <$mailjumi>\n";
               $headers .= "Reply-To: $mailjumi <$mailjumi>\n";
               $headers .= "Content-Type: multipart/mixed; boundary=\"".$boundary."\"\n";
               #$headers .= " boundary=\"".$boundary."\"\r\n";
               
               $size = filesize($datei);
	       $data = file_get_contents($datei);
	       $type = mime_content_type($datei);
	       $name = basename($datei);
               
               $data = chunk_split(base64_encode($data));
               $boundWithPre  = "\n--".$boundary;
       
               $message = "--".$boundary."\r\n";
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
               
            }
            elseif($csid_edit != '-1')
            {
               $sql1 = $db->query( "UPDATE jumi_chor_saenger 
                                       SET vorname = '$vorname'
                                          ,nachname = '$nachname'
                                          ,mail = '$mail'
                                          ,singstimme = '$singstimme'
                                          ,bemerkung = '$bemerkung'
                                          ,einw_livestream = '$einw_livestream'
                                          ,einw_homepage = '$einw_homepage'
                                          ,einw_socialmedia = '$einw_socialmedia'
                                          ,alter16 = '$alter16'
                                     WHERE csid = $csid_edit
                                  " );
               $csid = $csid_edit;
            }
            else
            {
                $csid = $row['csid'];
            }

            $sql2 = $db->query("INSERT INTO jumi_chor_saenger_uploads ( csid
                                                              , filename
                                                              , originalname
                                                              , uid
                                                              , datum
                                                              )
                                            VALUES
                                                              ( $csid
                                                              , '$vpb_final_location'
                                                              , '$originalname'
                                                              , $uid
                                                              , '$datum'
                                                              )
                                          ");
            //Display the file id
            if ($sql2)
            {
                echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> SängerIn wurde angelegt!</div>|***|success|***|' . $vpb_file_id;
                exit;
            }
            else
            {
                echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> SängerIn wurde nicht angelegt: Insert Fehler Datenbank.</div>|***|error|***|' . $vpb_file_id;
                exit;
            }

        }
        else
        {
            //Display general system error
            echo 'general_system_error';
        }

    }
}

if ($function == 'save_without_files')
{
    $vorname = $_POST['vorname'];
    $nachname = $_POST['nachname'];
    $mail = $_POST['mail'];
    $singstimme = $_POST['singstimme'];
    #csid gesetzt, wenn Member bearbeitet wird
    $csid_edit =$_POST['csid_edit'];
    $einw_livestream = $_POST['einw_livestream'];
    $einw_homepage = $_POST['einw_homepage'];
    $einw_socialmedia = $_POST['einw_socialmedia'];
    $alter16 = $_POST['alter16'];
    $bemerkung   = $db->real_escape_string(stripslashes( $_POST['bemerkung'] ));
    $db = dbconnect();
    $datum = date("Y-m-d H:i:s");
    
    if($csid_edit == '-1'){
      $sql1 = $db->query("INSERT INTO jumi_chor_saenger ( vorname
                                                  , nachname
                                                  , mail
                                                  , singstimme
                                                  , bemerkung
                                                  , einw_livestream
                                                  , einw_homepage
                                                  , einw_socialmedia
                                                  , alter16
                                                  , selfreg_date
                                                  )
                                VALUES
                                                  ( '$vorname'
                                                  , '$nachname'
                                                  , '$mail'
                                                  , '$singstimme'
                                                  , '$bemerkung'
                                                  , '$einw_livestream'
                                                  , '$einw_homepage'
                                                  , '$einw_socialmedia'
                                                  , '$alter16'
                                                  , '$datum'
                                                  )
                              ");
                              
      $empfaenger      = "$mail";
      $betreff         = "Anmeldung JU & MI";
      $mailjumi = get_parameter(1);
      if($alter16 == '1'){
        $text  = "
               <html>
               <head>
               <title>Registrierung JU & MI</title>
               </head>
               <body>
               <font face='Arial' size='2'>
               Hallo $vorname!<br><br>
               schön, dass du dich für den Jugendchor registriert hast!<br><br>
               Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
               dass wir den Jugendchor im Livestream zeigen dürfen.<br>
               Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden..<br>
               <br><br>
               Bitte unterschreibt das Formular und schickt es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>
               Falls ihr das Dokument nicht einscannen könnt, reicht ein gut lesbares Foto oder gebt uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
               <p>
               Vielen Dank,<br>
               euer JU & MI Team
               </body>
               </html>";
      }else{
        $text  = "
               <html>
               <head>
               <title>Registrierung JU & MI</title>
               </head>
               <body>
               <font face='Arial' size='2'>
               Hallo $vorname!<br><br>
               schön, dass du dich für den Jugendchor registriert hast!<br><br>
               Im Anhang befindet sich eine Einverständniserklärung. Diese benötigen wir unter anderem,
               dass wir den Jugendchor im Livestream zeigen dürfen.<br>
               Wir würden uns ebenso freuen, wenn wir eure Zusage für unsere Kanäle in den sozialen Medien bekommen würden.
               <br><br>
               Da du noch keine 16 Jahre alt bist, müssen deine Eltern/Sorgesberechtigte auf dem beigefügten Formular unterschreiben.<br>
               Sobald ihr das Einverständnis habt, schickt es an uns zurück. Die Mailadresse lautet: <a mailto='$mailjumi'>$mailjumi</a>.<br>
               Falls ihr das Dokument nicht einscannen könnt, reicht ein gut lesbares Foto oder gebt uns das Formular <b>vor</b> einem Jugendgottesdienst zurück.
               <p>
               Vielen Dank,<br>
               euer JU & MI Team
               </body>
               </html>";

      }
      
      
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
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> S&auml;gerIn wurde angelegt!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> S&auml;gerIn wurde nicht angelegt: Insert Fehler Datenbank.</div>|***|error';
          exit;
      }
    }else{
      $sql1 = $db->query( "UPDATE jumi_chor_saenger 
                              SET vorname = '$vorname'
                                 ,nachname = '$nachname'
                                 ,mail = '$mail'
                                 ,singstimme = '$singstimme'
                                 ,bemerkung = '$bemerkung'
                                 ,einw_livestream = '$einw_livestream'
                                 ,einw_homepage = '$einw_homepage'
                                 ,einw_socialmedia = '$einw_socialmedia'
                                 ,alter16 = '$alter16'
                            WHERE csid = $csid_edit
                         " );
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> S&auml;gerIn wurde bearbeitet!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> S&auml;gerIn nicht bearbeitet: Update Fehler Datenbank.</div>|***|error';
          exit;
      }

    }

}

if ($function == 'delMemberFile') {
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
  }
  
    $result0 = $db->query("SELECT filename, csid
                             FROM jumi_chor_saenger_uploads
                            WHERE id = $id;");
    $row0    = $result0->fetch_array();
  
    $stmt1    = $db->query("DELETE FROM jumi_chor_saenger_uploads WHERE id= $id");
    $del      = unlink($row0['filename']);
    
    if ($stmt1 AND $del) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Datei wurde gelöscht!</div>|***|success|***|'.$row0['csid'];
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Datei wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success|***|'.$row0['csid'];
      exit;
    }
}

if ($function == 'delMember') {
  if (isset($_POST['csid'])) {
    $csid = $_POST['csid'];
  }
       
         $query = "SELECT id, filename, originalname FROM jumi_chor_saenger_uploads WHERE csid='$csid' ORDER BY datum DESC";
         $result = $db->query( $query)
                   or die ("Cannot execute query1");

         while ($row = $result->fetch_array()){
          $del      = unlink($row['filename']);
         }
     
         
    $stmt1 = $db->query("DELETE FROM jumi_chor_saenger_uploads WHERE csid = $csid;");
    $stmt2 = $db->query("DELETE FROM jumi_chor_saenger WHERE csid = $csid");

    
    if ($stmt1 AND $stmt2) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> S&auml;gerIn wurde gelöscht!</div>|***|success|***|'.$row0['csid'];
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> S&auml;gerIn wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success|***|'.$row0['csid'];
      exit;
    }
}


if ($function == 'erfeinw') {
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
  }
  
  if (isset($_POST['var_check'])) {
    $var_check = $_POST['var_check'];
  }
  
  if (isset($_POST['user'])) {
    $csid_edit = $_POST['user'];
  }
       
  $sql1 = $db->query( "UPDATE jumi_chor_saenger 
                          SET $id = '$var_check'
                        WHERE csid = $csid_edit
                     " );

}

if ($function == 'erf_alter') {
  if (isset($_POST['alter16'])) {
    $alter16 = $_POST['alter16'];
  }

  if (isset($_POST['user'])) {
    $csid_edit = $_POST['user'];
  }
       
  $sql1 = $db->query( "UPDATE jumi_chor_saenger 
                          SET alter16 = '$alter16'
                        WHERE csid = $csid_edit
                     " );

}
?>