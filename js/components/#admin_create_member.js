function checkUser(){
  var mail = document.getElementById("mail").value;
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_member.php',
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


function membersave(){
  var vorname = document.getElementById("vorname").value;
  var nachname = document.getElementById("nachname").value;
  var mail = document.getElementById("mail").value;
  var bemerkung =tinyMCE.get('bemerkung').getContent()


  //var my_data = $("form").serialize();

  //komma getrennte Werte bei Mehrfachauswahl
  var singstimme = $("#singstimme").val();
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_member.php',
            data: {
                'function': 'membersave',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'singstimme': singstimme,
                'bemerkung': bemerkung
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("vorname").value ="";
                  document.getElementById("nachname").value ="";
                  document.getElementById("mail").value ="";
                  tinymce.get("bemerkung").setContent("");
                  var elements = document.getElementById("singstimme").options;
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

/*

function userupdate(uid){
  var vorname = document.getElementById("vorname").value;
  var nachname = document.getElementById("nachname").value;
  var mail = document.getElementById("mail").value;
  var pwdback = document.getElementById("pwdback");

  if(pwdback.checked == true){
   var var_pwdback = 1;
  }else{
   var var_pwdback = 0;
  }
  //var my_data = $("form").serialize();

  //komma getrennte Werte bei Mehrfachauswahl
  var rollen = $("#rollen").val();
        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_member.php',
            data: {
                'function': 'userupdate',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'rollen': rollen,
                'pwdback': var_pwdback,
                'uid': uid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "edit_user.php"; }, 1000);
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

function disableuser(uid){

        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_member.php',
            data: {
                'function': 'disableuser',
                'uid': uid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "edit_user.php"; }, 1000);
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

function enableuser(uid){

        $.ajax({
            type: 'POST',
            url: '../controller/admin_create_member.php',
            data: {
                'function': 'enableuser',
                'uid': uid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "edit_user.php"; }, 1000);
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
*/