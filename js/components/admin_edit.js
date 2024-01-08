function onClickDeleteSurvey(id) {
    r = confirm('Gesamte Umfrage löschen?');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_edit.php',
            data: {
                'function': 'deleteSurvey',
                'id': id
            },
            success: function(result) {
                //               document.getElementById("del").innerHTML = "<strong>entfernt</strong>";
                //Text einblenden geht nicht, da ein Refresh gemacht wird. Dann sieht man den Text nicht
                $(document).ajaxStop(function(){
				    window.location = "?";
                });
            }
        });
    }
}