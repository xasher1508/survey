function membersave(){
  var vorname = document.getElementById("vorname").value;
  var nachname = document.getElementById("nachname").value;
  var mail = document.getElementById("mail").value;
  var alter16 = document.querySelector('input[name="alter16"]:checked').value;
  //komma getrennte Werte bei Mehrfachauswahl
  var singstimme = $("#singstimme").val();

        $.ajax({
            type: 'POST',
            url: '../controller/selfregistration.php',
            data: {
                'function': 'membersave',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'singstimme': singstimme,
                'alter16': alter16
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("vorname").value ="";
                  document.getElementById("nachname").value ="";
                  document.getElementById("mail").value ="";
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