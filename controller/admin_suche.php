<?php
require_once ("../config.inc.php");
$function = $_POST['function'];

if ($function == 'titel')
{
    if (isset($_POST["term"]))
    {
        $term = mb_strtoupper(trim($_POST["term"]));

        $query = "SELECT distinct titel FROM jumi_noten_daten WHERE upper(titel) LIKE '%" . $term . "%'";
        $result = $db->query($query) or die("Cannot execute titel");

        if (mysqli_num_rows($result) > 0)
        {
            while ($row = $result->fetch_array())
            {
                $output[] = array(
                    "label" => $row['titel'],
                    "value" => $row['titel']
                );
            }
            #}else{
            # $output[] = array("label" => "keine Treffer");
            
        }

        echo json_encode($output);
    }
}

if ($function == 'verlag')
{
    if (isset($_POST["term"]))
    {
        $term = mb_strtoupper(trim($_POST["term"]));

        $query = "SELECT distinct bezeichnung FROM jumi_noten_verlag WHERE upper(bezeichnung) LIKE '%" . $term . "%'";
        $result = $db->query($query) or die("Cannot execute verlag");

        if (mysqli_num_rows($result) > 0)
        {
            while ($row = $result->fetch_array())
            {
                $output[] = array(
                    "label" => $row['bezeichnung'],
                    "value" => $row['bezeichnung']
                );
            }
            #}else{
            # $output[] = array("label" => "keine Treffer");
           
        }

        echo json_encode($output);
    }
}


?>

