<?php
//--Funktion-Datenbankverbindung--------------------------------------------------------------------

   function dbconnect() //--Prozedur - kein return-Wert
    {
    
     $db = @new mysqli( 'localhost', 'root', '', 'survey' );
     $db->query("set sql_mode = 'ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'");
     $db->set_charset('utf8mb4');
     $db->query("SET NAMES 'utf8mb4'");
     return $db;
    }

//--------------------------------------------------------------------------------------------------
?>
