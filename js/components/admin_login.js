function login(){
  var mail = document.getElementById("mail").value;
  var password = document.getElementById("password").value;
  var angemeldet_bleiben = document.getElementById("angemeldet_bleiben");

  if(angemeldet_bleiben.checked == true){
   var angemeldet_bleiben = 1;
  }else{
   var angemeldet_bleiben = 0;
  }

        $.ajax({
            type: 'POST',
            url: '../controller/admin_login.php',
            data: {
                'function': 'login',
                'mail': mail,
                'password': password,
                'angemeldet_bleiben': angemeldet_bleiben
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("mail").value ="";
                  document.getElementById("password").value ="";
                  $('#msg').show().delay(1000).fadeOut(500);
                  $('#msg').html(a[0]);
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "index.php"; }, 1000);
                  });

                }else{
                  $('#msg').show().delay(10000).fadeOut(500);
                  $('#msg').html(a[0]);
			    }
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}

function passwortvergessen(){
  var email = document.getElementById("mail_pwvergessen").value;

        $.ajax({
            type: 'POST',
            url: '../controller/admin_login.php',
            data: {
                'function': 'passwortvergessen',
                'email': email
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("mail_pwvergessen").value ="";
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


function resetpasswort(){
  var password_new1 = document.getElementById("password_new1").value;
  var password_new2 = document.getElementById("password_new2").value;
  var code = document.getElementById("code").value;
  var uid = document.getElementById("uid").value;

        $.ajax({
            type: 'POST',
            url: '../controller/admin_login.php',
            data: {
                'function': 'resetpasswort',
                'password_new1': password_new1,
                'password_new2': password_new2,
                'code': code,
                'uid': uid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("password_new1").value ="";
                  document.getElementById("password_new2").value ="";
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "login.php"; }, 1000);
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