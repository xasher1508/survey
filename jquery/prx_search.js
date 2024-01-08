$(document).ready(function()
{
	$('#search').keyup(function()
	{

		if($(this).val().length >= 3 || $(this).val() == '%')
		{
			$.get("../admin/prx_search.php", {search: $(this).val()}, function(data)
			{
				$("#results").html(data);
			});
		}
	});

    $("#btnSubmit").click(function(){
			$.get("../admin/prx_search.php", {search: '%'}, function(data)
			{
				$("#results").html(data);
			});
    });
    $("#reg").click(function(){
			$.get("../admin/prx_search.php", {search: 'reg'}, function(data)
			{
				$("#results").html(data);
			});
    });
    $("#unreg").click(function(){
			$.get("../admin/prx_search.php", {search: 'unreg'}, function(data)
			{
				$("#results").html(data);
			});
    });
});
