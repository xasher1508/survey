<?php   
echo "
<form name='logout' action='../controller/admin_login.php' method='POST'’>
<input type='hidden' name='function' value='logout'>
</form>
<script type='text/javascript'>
    document.logout.submit();
</script>";

exit();
?>
