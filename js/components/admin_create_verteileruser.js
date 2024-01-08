function checkUser(){
  var mail = document.getElementById("mail").value;
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_verteileruser.php',
            data: {
                'function': 'checkuser',
                'mail': mail
            },
            success: function(result) { //we got the response
              if(result!=''){
				$('#msg').show().delay(5000).fadeOut(500);
                $('#msg').html(result);
		      }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });

}


function contactsave(){
  var vorname = document.getElementById("vorname").value;
  var nachname = document.getElementById("nachname").value;
  var mail = document.getElementById("mail").value;
  //var my_data = $("form").serialize();

  //komma getrennte Werte bei Mehrfachauswahl
  var verteiler = $("#verteiler").val();
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_verteileruser.php',
            data: {
                'function': 'contactsave',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'verteiler': verteiler
            },
            success: function(result) { //we got the response

              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("vorname").value ="";
                  document.getElementById("nachname").value ="";
                  document.getElementById("mail").value ="";
                  var elements = document.getElementById("verteiler").options;
                  for(var i = 0; i < elements.length; i++){
                    elements[i].selected = false;
                  }
                }
                $('#msg1').show().delay(10000).fadeOut(500);
                $('#msg1').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}



function contactupdate(mveid){
  var vorname = document.getElementById("vorname").value;
  var nachname = document.getElementById("nachname").value;
  var mail = document.getElementById("mail").value;
  //var my_data = $("form").serialize();

  //komma getrennte Werte bei Mehrfachauswahl
  var verteiler = $("#verteiler").val();
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_verteileruser.php',
            data: {
                'function': 'contactupdate',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'verteiler': verteiler,
                'mveid': mveid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "edit_verteileruser.php"; }, 1000);
                  });
                }
                $('#msg1').show().delay(10000).fadeOut(500);
                $('#msg1').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}

function deleteContact(mveid){
    r = confirm('Kontakt löschen?');
    if (r) {

        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_verteileruser.php',
            data: {
                'function': 'deleteContact',
                'mveid': mveid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "edit_verteileruser.php"; }, 1000);
                  });
                }
                $('#msg').show().delay(10000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
    }
}


