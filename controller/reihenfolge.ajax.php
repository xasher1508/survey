<?php 
require_once("../config.inc.php");

if(isset($_REQUEST['action']) and $_REQUEST['action']=="updateSortedRows"){
	$newOrder	=	explode(",",$_REQUEST['sortOrder']);
	$n	=	'0';
	foreach($newOrder as $id){
		$db->query('UPDATE jumi_umfragen_antworten SET userorder="'.$n.'" WHERE uaid="'.$id.'" ');
		$n++;
	}
	echo '<div class="alert alert-success"><i class="fa fa-fw fa-thumbs-up"></i> Reihenfolge angepasst!</div>|***|update';
}