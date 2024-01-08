function erf_multiple(){
  var checkBox = document.getElementById("multiple");

  if(checkBox.checked == true){
   var var_multiple = 1;
  }else{
   var var_multiple = 0;
  }
        $.ajax({
            type: 'POST',
            url: '../controller/admin_erfassen.php',
            data: {
                'function': 'erfmultiple',
                'multiple': var_multiple
            },
            success: function(result) { //we got the response
//                if(result==-1){
//                  alert("Bitte zunächst die Frage erfassen");
//                  $(document).ajaxStop(function(){
//                    window.location = "?action=fragen&erfassen=1";
//                  });
//			    }else{
//                  $(document).ajaxStop(function(){
//                    window.location = "?action=fragen&erfassen=1";
//                  });
//			   }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });

}

function erfassensave(){
  var frage = document.getElementById("frage").value;
  var antwort = document.getElementById("antwort").value;
  var checkBox = document.getElementById("multiple");

  if(checkBox.checked == true){
   var var_multiple = 1;
  }else{
   var var_multiple = 0;
  }

        $.ajax({
            type: 'POST',
            url: '../controller/admin_erfassen.php',
            data: {
                'function': 'save',
                'frage': frage,
                'antwort': antwort,
                'multiple': var_multiple
            },
            success: function(result) { //we got the response
                $(document).ajaxStop(function(){
				    window.location = "?action=fragen&erfassen=1";
                });
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });

}

function onClickDelete(id) {

    document.getElementById("antwort").value = "";
    r = confirm('Antwort löschen?');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_erfassen.php',
            data: {
                'function': 'delete',
                'tabelle': 'jumi_umfragen_antworten',
                'spalte': 'uaid',
                'id': id
            },
            success: function(result) { //we got the response
                $(document).ajaxStop(function(){
				    window.location = "?action=fragen&erfassen=1";
                });
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
    }
}

function onClickDeleteQuestion(id2) {
    document.getElementById("frage").value = "";
    document.getElementById("antwort").value = "";
    r = confirm('Gesamte Frage löschen?');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_erfassen.php',
            data: {
                'function': 'deleteQuestion',
                'id2': id2
            },
            success: function(result) {
                //               document.getElementById("del").innerHTML = "<strong>entfernt</strong>";
                //Text einblenden geht nicht, da ein Refresh gemacht wird. Dann sieht man den Text nicht
                $(document).ajaxStop(function(){
				    window.location = "?action=fragen&erfassen=1";
                });
            }
        });
    }
}