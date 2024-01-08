<?php
require_once("../config.inc.php");
$function = $_POST['function'];

if ($function == 'saveParameter') {
  $inputs = $_POST['inputs'];
  $inputs = json_decode(stripslashes($_POST['inputs']),true);
  
  $error = 0;
  foreach($inputs as $parameters){
    $pid = $parameters['name'];
    $wert = $parameters['value'];
  
    $sql1 = $db->query( "UPDATE jumi_parameter 
                            SET wert = '$wert'
                          WHERE pid = $pid
                      " );
    if(!$sql1){
     $error++;
    }
  }
  if($error == 0){
    echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Parameter wurden aktualisiert.</div>|***|success';
  }else{
    echo '<div class="alert alert-danger"><i class="fa fa-fw fa-thumbs-down"></i> Parameter wurde nicht aktualisiert.</div>|***|success';
  }
}


?>