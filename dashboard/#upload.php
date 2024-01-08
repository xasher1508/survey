<?php
require_once("../config.inc.php");
//check if form is submitted
if (isset($_POST['submit']))
{
    $filename = $_FILES['file1']['name'];

    //upload file
    if($filename != '')
    {
    echo $filename;
    exit;
    
        $ext = pathinfo($filename, PATHINFO_EXTENSION);
        $allowed = ['pdf', 'txt', 'doc', 'docx', 'png', 'jpg', 'jpeg',  'gif',  'xlsx'];
    
        //check if file type is valid
        if (in_array($ext, $allowed))
        {
            // get last record id
            $result_name = $db->query("select max(id) as id from jumi_uploads");


            if (count($result) > 0)
            {
                $row    = $result->fetch_array()
                $filename = ($row['id']+1) . '-' . $filename;
            }
            else
                $filename = '1' . '-' . $filename;

            //set target directory
            $path = 'uploads/';
                
            $created = @date('Y-m-d H:i:s');
            move_uploaded_file($_FILES['file1']['tmp_name'],($path . $filename));
            
            // insert file details into database
            $sql = "INSERT INTO jumi_uploads (filename, created) VALUES('$filename', '$created')";
            mysqli_query($con, $sql);
            header("Location: test2.php?st=success");
        }
        else
        {
            header("Location: test2.php?st=error");
        }
    }
    else
        header("Location: test2.php");
}
?>
