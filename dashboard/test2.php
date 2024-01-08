<?php
$attachment   = array();

$a = ['filename'=>'../media/file_upload/finanzen/20230420_111236_RG_100121618035.pdf'];
$b = ['name'=>'RG_100121618035.pdf'];
$attachment[] = array_merge($a, $b);

$a = ['filename'=>'../media/file_upload/finanzen/20230420_111413_RG_100119951099.pdf'];
$b = ['name'=>'RG_100119951099.pdf'];
$attachment[] = array_merge($a, $b);

$a = ['filename'=>'../media/file_upload/finanzen/20230420_111614_RG_100117336090.pdf'];
$b = ['name'=>'RG_100117336090.pdf'];
$attachment[] = array_merge($a, $b);

echo"<pre>";
print_r($attachment);
echo"</pre><hr>";

foreach($attachment as $files) {
  echo "$files[filename] --> $files[name] <br>";
  echo "<br>";
}

echo sizeof($attachment);
?>