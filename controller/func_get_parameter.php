<?php
#require_once("config.inc.php");


function get_parameter($pid){

  $db = dbconnect();
  $query_get_parameter = $db->query("SELECT wert FROM jumi_parameter WHERE pid=$pid");
  $row_get_parameter= $query_get_parameter->fetch_array();
  $wert = $row_get_parameter['wert'];
  return $wert;
}

#echo get_parameter(6);

?>
