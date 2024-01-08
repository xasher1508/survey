<?php
## INDEX gegen DB
if (!isset($_SESSION)) {
    session_start();
}
#$_SESSION['sessionid'] = session_id();


include_once '../classes/TestProjektSmarty.class_subdir.php';
require_once("../config/datenbankanbindung.php");
# config.inc.php kann hier nicht eingebunden werden, sonst ruft er in jeder Seite 2x die config auf, da das NAV in jeder Seite geladen wird
$smarty       = new SmartyAdmin();
$templatename = substr(basename($_SERVER['PHP_SELF']), 0, -3) . "html";
require_once "../language/german.inc.php";

##############################################################################


$db = dbconnect();
$uid = $_SESSION["userid"];

$query  = "SELECT mhid, headline, visible
             FROM jumi_menu_headline
             WHERE mhid IN (SELECT DISTINCT mhid 
                              FROM jumi_menu_entries a, jumi_admin_rollen_rechte_zuord b, jumi_admin_rollen_user_zuord c
                             WHERE a.meid=b.meid
                               AND  b.rid=c.rid
                               AND c.uid=$uid)
            ORDER by mhid ASC";
$result = $db->query($query);


// Ergebnisse lesen und an den Client ausgeben
while ($row = $result->fetch_array()) {
    $value2 = '';
    unset($inner1);
    
    
    $query2 = "SELECT meid
                        , headline
                        , link
                        , mhid
                        , fontawesome
                        , sup
                     FROM jumi_menu_entries
                    WHERE mhid=$row[mhid]
                      AND sup = meid
                      AND meid IN (SELECT DISTINCT meid
		                    FROM jumi_admin_rollen_rechte_zuord a, jumi_admin_rollen_user_zuord b
		                   WHERE a.rid = b.rid
                                     AND b.uid = $uid)
                    ORDER BY meid ASC
                   ";

#echo "<br><br><br><br><br><br><br><br>----------------------------------------$query2";
    
    $result2 = $db->query($query2) or die("Cannot execute query2");
    $ln2 = 0;
    
    while ($row2 = $result2->fetch_array()) {
        
        $inner1[$ln2]['headline']    = $row2['headline'];
        $inner1[$ln2]['link']        = $row2['link'];
        $inner1[$ln2]['fontawesome'] = $row2['fontawesome'];
        
        $value3 = '';
        unset($inner2);
        
        if ($row2['link'] == '#') {
            $query3 = "SELECT meid
                        , headline
                        , link
                        , mhid
                        , fontawesome
                        , sup
                     FROM jumi_menu_entries
                    WHERE mhid=$row2[mhid]
                      AND sup != meid
                      AND sup = $row2[sup]
                      AND meid IN (SELECT DISTINCT meid
		                    FROM jumi_admin_rollen_rechte_zuord a, jumi_admin_rollen_user_zuord b
		                   WHERE a.rid = b.rid
                                     AND b.uid = $uid)
                    ORDER BY meid ASC
                   ";
#echo "<br><br><br><br><br><br><br><br>----------------------------------------$query3<br>";
            $result3 = $db->query($query3) or die("Cannot execute query3");
            $ln3 = 0;
            
            while ($row3 = $result3->fetch_array()) {
                $inner2[$ln3]['headline']    = $row3['headline'];
                $inner2[$ln3]['link']        = $row3['link'];
                $inner2[$ln3]['fontawesome'] = $row3['fontawesome'];
                $value3                      = $inner2;
                $ln3++;
            }
            $inner1[$ln2]['inner2'] = $value3;
        }
        
        $value2 = $inner1;
        $ln2++;
    }
    $row['inner'] = $value2;
    
    $table_data[] = $row;
}
$smarty->assign('table_data', $table_data);

#echo "<pre>";
#print_r($table_data);
#echo "</pre>";

###############################################################################
$result_name = $db->query("SELECT vorname, nachname, mail FROM jumi_admin WHERE uid='$uid'");
$row_name    = $result_name->fetch_array();
$smarty->assign('nav_name', "$row_name[vorname] $row_name[nachname]");


$smarty->assign('action', "$action");
$smarty->display("modern/dashboard/$templatename");
?> 