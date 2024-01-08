function changepwd(){
  var password = document.getElementById("password").value;
  var password_new1 = document.getElementById("password_new1").value;
  var password_new2 = document.getElementById("password_new2").value;

        $.ajax({
            type: 'POST',
            url: '../controller/admin_changepwd.php',
            data: {
                'function': 'changepwd',
                'password': password,
                'password_new1': password_new1,
                'password_new2': password_new2
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("password").value ="";
                  document.getElementById("password_new1").value ="";
                  document.getElementById("password_new2").value ="";

                }
                $('#msg').show().delay(2000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}