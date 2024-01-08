<?php
require_once ("../config.inc.php");
$function = $_POST['function'];

if ($function == 'save_with_files')
{

    if (isset($_POST) && $_SERVER['REQUEST_METHOD'] == "POST")
    {
        ## Dieses Script wird für jede Datei einzeln aufgerufen durch vpb_uploader.js. Bei 3 Dateien, 3x
        $form_datum = $_POST['datum'];
        $datum_form = preg_replace('/^(\\d{2})\\.(\\d{2})\\.(\\d{4})$/', '$3-$2-$1', $form_datum);
        $beschreibung = $_POST['beschreibung'];
        $firma = $_POST['firma'];
        $art = $_POST['art'];
        $betrag = $_POST['betrag'];
        $bemerkung = $_POST['bemerkung'];

        #fid gesetzt, wenn Finanzen bearbeitet wird
        $fid_edit = $_POST['fid_edit'];


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
        $vpb_uploaded_files_location = '../media/file_upload/finanzen/'; //This is the directory where uploaded files are saved on your server
        $vpb_final_location = $vpb_uploaded_files_location . $vpb_file_name; //Directory to save file plus the file to be saved
        //Without Validation and does not save filenames in the database
        
        

            
        if (move_uploaded_file(strip_tags($_FILES['upload_file']['tmp_name']) , $vpb_final_location))
        {
            
            $result = $db->query("SELECT fid 
                                        FROM jumi_finanzen
                                       WHERE datum = '$datum_form'
                                         AND beschreibung = '$beschreibung'
                                         AND firma = '$firma'
                                         AND art = '$art'
                                         AND betrag = '$betrag'
                                         AND bemerkung = '$bemerkung'
                                ");
            $row = $result->fetch_array();
            if ($row['fid'] == '' AND $fid_edit == '-1')
            {
                $sql1 = $db->query("INSERT INTO jumi_finanzen ( uid
                                                              , datum
                                                              , beschreibung
                                                              , firma
                                                              , art
                                                              , betrag
                                                              , bemerkung
                                                              )
                                            VALUES
                                                              ( '$uid'
                                                              , '$datum_form'
                                                              , '$beschreibung'
                                                              , '$firma'
                                                              , '$art'
                                                              , '$betrag'
                                                              , '$bemerkung'
                                                              )
                                          ");
                $fid = $db->insert_id;
            }
            elseif($fid_edit != '-1')
            {
               $sql1 = $db->query( "UPDATE jumi_finanzen 
                                       SET datum = '$datum_form'
                                          ,beschreibung = '$beschreibung'
                                          ,firma = '$firma'
                                          ,art = '$art'
                                          ,betrag = '$betrag'
                                          ,bemerkung = '$bemerkung'
                                     WHERE fid = $fid_edit
                                  " );
               $fid = $fid_edit;
               
            }
            else
            {
                $fid = $row['fid'];
            }
            $datum = date("Y-m-d H:i:s");
            $sql2 = $db->query("INSERT INTO jumi_finanzen_uploads ( fid
                                                              , filename
                                                              , originalname
                                                              , uid
                                                              , datum
                                                              )
                                            VALUES
                                                              ( $fid
                                                              , '$vpb_final_location'
                                                              , '$originalname'
                                                              , $uid
                                                              , '$datum'
                                                              )
                                          ");
            //Display the file id
            if ($sql2)
            {
                echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Betrag wurde erfasst!</div>|***|success|***|' . $vpb_file_id;
                exit;
            }
            else
            {
                echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Betrag wurde nicht erfasst: Insert Fehler Datenbank.</div>|***|error|***|' . $vpb_file_id;
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
        $form_datum = $_POST['datum'];
        $datum_form = preg_replace('/^(\\d{2})\\.(\\d{2})\\.(\\d{4})$/', '$3-$2-$1', $form_datum);
        $beschreibung = $_POST['beschreibung'];
        $firma = $_POST['firma'];
        $art = $_POST['art'];
        $betrag = $_POST['betrag'];
        $bemerkung = $_POST['bemerkung'];
        #fid gesetzt, wenn Finanzen bearbeitet wird
        $fid_edit = $_POST['fid_edit'];

        
        $db = dbconnect();
    
        # Wenn Verlag nicht vorhanden, dann neu anlegen
            
    
    $datum = date("Y-m-d H:i:s");
    if($fid_edit == '-1'){
                $sql1 = $db->query("INSERT INTO jumi_finanzen ( uid
                                                              , datum
                                                              , beschreibung
                                                              , firma
                                                              , art
                                                              , betrag
                                                              , bemerkung
                                                              )
                                            VALUES
                                                              ( '$uid'
                                                              , '$datum_form'
                                                              , '$beschreibung'
                                                              , '$firma'
                                                              , '$art'
                                                              , '$betrag'
                                                              , '$bemerkung'
                                                              )
                                          ");
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Betrag wurde erfasst!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Betrag wurde nicht erfasst: Insert Fehler Datenbank.</div>|***|error';
          exit;
      }
    }else{
               $sql1 = $db->query( "UPDATE jumi_finanzen 
                                       SET datum = '$datum_form'
                                          ,beschreibung = '$beschreibung'
                                          ,firma = '$firma'
                                          ,art = '$art'
                                          ,betrag = '$betrag'
                                          ,bemerkung = '$bemerkung'
                                     WHERE fid = $fid_edit
                                  " );

       
      if ($sql1)
      {
          echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Betrag wurde bearbeitet!</div>|***|success|***|';
          exit;
      }
      else
      {
          echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Betrag wurde nicht bearbeitet: Update Fehler Datenbank.</div>|***|error';
          exit;
      }
    }
}


if ($function == 'delBelegFile') {
  if (isset($_POST['id'])) {
    $id = $_POST['id'];
  }
  
    $result0 = $db->query("SELECT filename, fid
                             FROM jumi_finanzen_uploads
                            WHERE id = $id;");
    $row0    = $result0->fetch_array();
  
    $stmt1    = $db->query("DELETE FROM jumi_finanzen_uploads WHERE id= $id");
    $del      = unlink($row0['filename']);
    
    if ($stmt1 AND $del) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Die Datei wurde gelöscht!</div>|***|success|***|'.$row0['fid'];
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Die Datei wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success|***|'.$row0['fid'];
      exit;
    }
}


if ($function == 'delBeleg') {
  if (isset($_POST['fid'])) {
    $fid = $_POST['fid'];
  }
       
    $query = "SELECT id, filename, originalname FROM jumi_finanzen_uploads WHERE fid='$fid' ORDER BY datum DESC";
    $result = $db->query( $query)
              or die ("Cannot execute query1");

    while ($row = $result->fetch_array()){
     $del      = unlink($row['filename']);
    }
    
    
    $stmt1 = $db->query("DELETE FROM jumi_finanzen_uploads WHERE fid = $fid;");
    $stmt2 = $db->query("DELETE FROM jumi_finanzen WHERE fid = $fid");
  
    
    if ($stmt1 AND $stmt2) {
      echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Beleg wurde gelöscht!</div>|***|success';
      exit;
    } else {
      echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Beleg wurde nicht gelöscht: DELETE Fehler Datenbank.</div>|***|success';
      exit;
    }
}

?>