<?php
require_once ("../config.inc.php");
$function = $_POST['function'];

if ($function == 'save_with_files')
{

    if (isset($_POST) && $_SERVER['REQUEST_METHOD'] == "POST")
    {
        ## Dieses Script wird für jede Datei einzeln aufgerufen durch vpb_uploader.js. Bei 3 Dateien, 3x
        $db = dbconnect();
        $titel = $_POST['titel'];
        $liednr = $_POST['liednr'];
        $verlag = $_POST['verlag'];
        #csid gesetzt, wenn Member bearbeitet wird
        if(isset($_POST['jndid_edit'])){
          $jndid_edit = $_POST['jndid_edit'];
        }else{
          $jndid_edit = 0;
        }
        $anz_lizenzen = $_POST['anz_lizenzen'];
        $streamlizenz = $_POST['streamlizenz'];
        $pdfart = $_POST['pdfart'];
        $bemerkung   = $db->real_escape_string(stripslashes( $_POST['bemerkung'] ));

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
        $vpb_uploaded_files_location = '../media/file_upload/noten/'; //This is the directory where uploaded files are saved on your server
        $vpb_final_location = $vpb_uploaded_files_location . $vpb_file_name; //Directory to save file plus the file to be saved
        //Without Validation and does not save filenames in the database
        
        
        # Wenn Verlag nicht vorhanden, dann neu anlegen
            $result_vg = $db->query("SELECT vid 
                                        FROM jumi_noten_verlag
                                       WHERE bezeichnung = '$verlag'
                                       LIMIT 1
                                    ");
            $row_vg = $result_vg->fetch_array();
            if(isset($row_vg['vid']) AND $row_vg['vid'] != ''){
               $vid=$row_vg['vid'];
            }else{
                $sql1 = $db->query("INSERT INTO jumi_noten_verlag ( bezeichnung ) VALUES ( '$verlag' )");
                $vid = $db->insert_id;
            }
            
        if (move_uploaded_file(strip_tags($_FILES['upload_file']['tmp_name']) , $vpb_final_location))
        {
            $datum = date("Y-m-d H:i:s");

            $result = $db->query("SELECT jndid 
                                        FROM jumi_noten_daten
                                       WHERE titel = '$titel'
                                         AND liednr = '$liednr'
                                         AND vid = '$vid'
                                         AND anz_lizenzen = '$anz_lizenzen'
                                         AND streamlizenz = '$streamlizenz'
                                ");
            $row = $result->fetch_array();
            if(isset($row['jndid'])){
              $jndid = $row['jndid'];
            }else{
              $jndid = '';
            }
            if ($jndid == '' AND $jndid_edit == '-1')
            {
                $sql1 = $db->query("INSERT INTO jumi_noten_daten ( titel
                                                              , liednr
                                                              , vid
                                                              , anz_lizenzen
                                                              , streamlizenz
                                                              , pdfart
                                                              , bemerkung
                                                              , uid
                                                              , datum
                                                              )
                                            VALUES
                                                              ( '$titel'
                                                              , '$liednr'
                                                              , '$vid'
                                                              , '$anz_lizenzen'
                                                              , '$streamlizenz'
                                                              , '$pdfart'
                                                              , '$bemerkung'
                                                              , $uid
                                                              , '$datum'
                                                              )
                                          ");
                $jndid = $db->insert_id;
            }
            elseif($jndid_edit != '-1')
            {
               $sql1 = $db->query( "UPDATE jumi_noten_daten 
                                       SET titel = '$titel'
                                          ,liednr = '$liednr'
                                          ,vid = '$vid'
                                          ,anz_lizenzen = '$anz_lizenzen'
                                          ,streamlizenz = '$streamlizenz'
                                          ,pdfart = '$pdfart'
                                          ,bemerkung = '$bemerkung'
                                          ,uid = '$uid'
                                          ,datum = '$datum'
                                     WHERE jndid_ = $jndid_edit
                                  " );
               $jndid = $jndid_edit;
               
               # Nicht verwendeter Verlag löschen
               $query = "SELECT vid FROM jumi_noten_verlag a WHERE vid NOT IN (SELECT vid FROM jumi_noten_daten b WHERE a.vid=b.vid); ";
               $result = $db->query( $query)
                              or die ("Cannot execute query1");
               
               while ($row = $result->fetch_array()){
                 $de11 = $db->query( "DELETE FROM jumi_noten_verlag WHERE vid=$row[vid]" );
               }

               

            }
            else
            {
                $jndid = $row['jndid'];
            }

            $sql2 = $db->query("INSERT INTO jumi_noten_uploads ( jndid
                                                              , filename
                                                              , originalname
                                                              , uid
                                                              , datum
                                                              )
                                            VALUES
                                                              ( $jndid
                                                              , '$vpb_final_location'
                                                              , '$originalname'
                                                              , $uid
                                                              , '$datum'
                                                              )
                                          ");
            //Display the file id
            if ($sql2)
            {
                echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Noten wurden angelegt!</div>|***|success|***|' . $vpb_file_id;
                exit;
            }
            else
            {
                echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Noten wurden nicht angelegt: Insert Fehler Datenbank.</div>|***|error|***|' . $vpb_file_id;
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
        $db = dbconnect();
        $titel = $_POST['titel'];
        $liednr = $_POST['liednr'];
        $verlag = $_POST['verlag'];
        $jndid_edit = $_POST['jndid_edit'];
        $anz_lizenzen = $_POST['anz_lizenzen'];
        $streamlizenz = $_POST['streamlizenz'];
        $bemerkung   = $db->real_escape_string(stripslashes( $_POST['bemerkung'] ));

       
    
    
        # Wenn Verlag nicht vorhanden, dann neu anlegen
            $result_vg = $db->query("SELECT vid 
                                        FROM jumi_noten_verlag
                                       WHERE bezeichnung = '$verlag'
                                       LIMIT 1
                                    ");
            $row_vg = $result_vg->fetch_array();
            if($row_vg['vid'] == ''){
                $sql1 = $db->query("INSERT INTO jumi_noten_verlag ( bezeichnung ) VALUES ( '$verlag' )");
                $vid = $db->insert_id;
            }else{
                $vid=$row_vg['vid'];
            }
            
    
    $datum = date("Y-m-d H:i:s");
    if($jndid_edit == '-1'){
      $sql1 = $db->query("INSERT INTO jumi_noten_daten ( titel
                                                , liednr
                                                , vid
                                                , anz_lizenzen
                                                , streamlizenz
                                                , bemerkung
                                                , uid
                                                , datum
                                                )
                              VALUES
                                                ( '$titel'
                                                , '$liednr'
                                                , '$vid'
                                                , '$anz_lizenzen'
                                                , '$streamlizenz'
                                                , '$bemerkung'
                                                , $uid
                                                , '$datum'
                                                )
                            ");
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Noten wurden bearbeitet!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Noten wurden nicht bearbeitet: Insert Fehler Datenbank.</div>|***|error';
          exit;
      }
    }else{
      $sql1 = $db->query( "UPDATE jumi_noten_daten 
                              SET titel = '$titel'
                                 ,liednr = '$liednr'
                                 ,vid = '$vid'
                                 ,anz_lizenzen = '$anz_lizenzen'
                                 ,streamlizenz = '$streamlizenz'
                                 ,bemerkung = '$bemerkung'
                                 ,uid = '$uid'
                                 ,datum = '$datum'
                            WHERE jndid = $jndid_edit
                         " );

       # Nicht verwendeter Verlag löschen
       $query = "SELECT vid FROM jumi_noten_verlag a WHERE vid NOT IN (SELECT vid FROM jumi_noten_daten b WHERE a.vid=b.vid); ";
       $result = $db->query( $query)
                      or die ("Cannot execute query1");
       
       while ($row = $result->fetch_array()){
         $de11 = $db->query( "DELETE FROM jumi_noten_verlag WHERE vid=$row[vid]" );
       }

       
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Noten wurden bearbeitet!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Noten wurden nicht bearbeitet: Update Fehler Datenbank.</div>|***|error';
          exit;
      }
    }
}

if ($function == 'delNotenFile') {
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
  }
  
    $result0 = $db->query("SELECT filename, jndid
                             FROM jumi_noten_uploads
                            WHERE id = $id;");
    $row0    = $result0->fetch_array();
  
    $stmt1    = $db->query("DELETE FROM jumi_noten_uploads WHERE id= $id");
    $del      = unlink($row0['filename']);
    
    if ($stmt1 AND $del) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Datei wurde gelöscht!</div>|***|success|***|'.$row0['jndid'];
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Datei wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success|***|'.$row0['jndid'];
      exit;
    }
}

if ($function == 'alterArt') {
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
  }
  if (isset($_POST['art'])) {
    $art = $_POST['art'];
  }
  
    $result0 = $db->query("SELECT filename, jndid
                             FROM jumi_noten_uploads
                            WHERE id = $id;");
    $row0    = $result0->fetch_array();
  
    
    $stmt1    = $db->query("UPDATE jumi_noten_uploads SET pdfart='$art' WHERE id= $id");
    
    if ($stmt1) {
      echo "<div class='alert alert-success'><i class='fa fa-fw fa-thumbs-up'></i> Die Art wurde geändert!</div>|***|success|***|".$row0['jndid'];
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die ARt wurde nicht geändert!</div>|***|success|***|'.$row0['jndid'];
      exit;
    }
}


if ($function == 'delNoten') {
  if (isset($_POST['jndid'])) {
    $jndid = $_POST['jndid'];
  }
       
    $query = "SELECT id, filename, originalname FROM jumi_noten_uploads WHERE jndid='$jndid' ORDER BY datum DESC";
    $result = $db->query( $query)
              or die ("Cannot execute query1");

    while ($row = $result->fetch_array()){
     $del      = unlink($row['filename']);
    }
    
    
    $stmt1 = $db->query("DELETE FROM jumi_noten_uploads WHERE jndid = $jndid;");
    $stmt2 = $db->query("DELETE FROM jumi_noten_daten WHERE jndid = $jndid");
  
    # Nicht verwendeter Verlag löschen
    $query = "SELECT vid FROM jumi_noten_verlag a WHERE vid NOT IN (SELECT vid FROM jumi_noten_daten b WHERE a.vid=b.vid); ";
    $result = $db->query( $query)
                   or die ("Cannot execute query1");
    
    while ($row = $result->fetch_array()){
      $de11 = $db->query( "DELETE FROM jumi_noten_verlag WHERE vid=$row[vid]" );
    }

    
    if ($stmt1 AND $stmt2) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> S&auml;gerIn wurde gelöscht!</div>|***|success';
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> S&auml;gerIn wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success';
      exit;
    }
}
?>