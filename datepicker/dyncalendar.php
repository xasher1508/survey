<?php
include("kurs/datenbankanbindung.php");     // f&uuml;gt die Datenbankanbindung ein: Sys:\php\includes\kurs\datenbankanbindung.php
echo"
<html>
<head>

	<link rel='stylesheet' href='dynCalendar/dynCalendar.css' type='text/css' media='screen'>
	<script src='dynCalendar/browserSniffer.js' type='text/javascript' language='javascript'></script>
	<script src='dynCalendar/dynCalendar.js' type='text/javascript' language='javascript'></script>
	<script type='text/javascript'>
	<!--
		// Calendar callback. When a date is clicked on the calendar
		// this function is called so you can do as you want with it
		function calendarCallback(date, month, year, pos)
		{
		    if(date<10){date='0'+date;}
		    if(month<10){month='0'+month;}
			date_tag = date;
			date_mon = month;
			date_jahr = year;
			document.getElementById('date_tag'+pos).value = date_tag;
			document.getElementById('date_mon'+pos).value = date_mon;
			document.getElementById('date_jahr'+pos).value = date_jahr;
		}

		function calendarCallback_end(date, month, year, pos)
		{
		    if(date<10){date='0'+date;}
		    if(month<10){month='0'+month;}
			date_tag = date;
			date_mon = month;
			date_jahr = year;
			document.getElementById('date_tag_end'+pos).value = date_tag;
			document.getElementById('date_mon_end'+pos).value = date_mon;
			document.getElementById('date_jahr_end'+pos).value = date_jahr;
		}
	// -->
	</script>

</head>
<body>
<table width=100%>
<form>
<tr>
<td width='60%' align='left' style='border-style: none; border-width: medium' height='0'>

	<input type='text' name='date_tag2' id='date_tag2' value='' size=2>.<input type='text' name='date_mon2' id='date_mon2'value='' size=2>.<input type='text' name='date_jahr2' id='date_jahr2' value='' size=4>
	<script language='JavaScript' type='text/javascript'>
    <!--
    	fooCalendar1 = new dynCalendar('fooCalendar1', 'calendarCallback', 'dynCalendar/images/', '', '2');
    //-->
    </script>
    bis

	<input type='text' name='date_tag_end2' id='date_tag_end2' value='' size=2>.<input type='text' name='date_mon_end2' id='date_mon_end2'value='' size=2>.<input type='text' name='date_jahr_end2' id='date_jahr_end2' value='' size=4>
	<script language='JavaScript' type='text/javascript'>
    <!--
    	fooCalendar2 = new dynCalendar('fooCalendar2', 'calendarCallback_end', 'dynCalendar/images/', '', '2');
    //-->
    </script>
</td>
<td width='60%' align='left' style='border-style: none; border-width: medium' height='0'>
</td>
</tr>
<tr>
<td width='60%' align='left' style='border-style: none; border-width: medium' height='0'>

	<input type='text' name='date_tag3' id='date_tag3' value='' size=2>.<input type='text' name='date_mon3' id='date_mon3'value='' size=2>.<input type='text' name='date_jahr3' id='date_jahr3' value='' size=4>
	<script language='JavaScript' type='text/javascript'>
    <!--
    	fooCalendar3 = new dynCalendar('fooCalendar3', 'calendarCallback', 'dynCalendar/images/', '', '3');
    //-->
    </script>

</td>
<td width='60%' align='left' style='border-style: none; border-width: medium' height='0'>
</td>
</tr>

</table>


</form>

</body>
</html>";

?>