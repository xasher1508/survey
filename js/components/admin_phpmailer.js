
         $(document).ready(function (e){
         $("#frmEnquiry").on('submit',(function(e){
         	e.preventDefault();
         	//$('#loader-icon').show();
         	var valid;
         	valid = validateContact();
         	if(valid) {
				var dataString = new FormData(this);
				dataString.append('function', 'sendmail');
         		$.ajax({
         		url: "../controller/admin_phpmailer.php",
         		type: "POST",
                data: dataString,
         		contentType: false,
         		cache: false,
         		processData:false,
         		success: function(result){
//alert(result);
                if(result!=''){
                  var a = result.split('|***|');
                  if(a[1]=="success"){
					//https://developer.snapappointments.com/bootstrap-select/methods/#selectpickertoggle
                    $('.selectpicker').selectpicker('deselectAll');
                    document.getElementById("subject").value ="";
                    tinyMCE.get(0).setContent("");
                    $('#empf').html('');
                  }
                  $('#msg').show().delay(5000).fadeOut(500);
                  $('#msg').html(a[0]);
                }
                //alert(data);
         		//$("#mail-status").html(data);
         		//$('#loader-icon').hide();
         		},
         		error: function(){}

         		});
         	}
         }));

         function validateContact() {
         	var valid = true;
         	$(".InputBox").css('background-color','');
         	$(".info").html('');
//         	$("#userName").removeClass("invalid");
//         	$("#userEmail").removeClass("invalid");
//            $('.selectpicker').removeClass('invalid').selectpicker('setStyle');
            //https://github.com/snapappointments/bootstrap-select/issues/1891
            $('.selectpicker').removeClass('invalid').selectpicker('setStyle').parent().removeClass('invalid ');


         	$("#subject").removeClass("invalid");
         	$("#content").removeClass("invalid");
         	// Bei TinyMCE geht das anders
         	var t = tinyMCE.get(0);
         	var color = '#fff';
            t.getBody().style.backgroundColor = color;

         	if($("#empfaenger").val()=='') {
         		$('.selectpicker').addClass('invalid').selectpicker('setStyle');
                 valid = false;
         	}
/*
             if(!$("#userEmail").val()) {
                 $("#userEmail").addClass("invalid");
                 $("#userEmail").attr("title","Required");
                 valid = false;
             }
             if(!$("#userEmail").val().match(/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/)) {
                 $("#userEmail").addClass("invalid");
                 $("#userEmail").attr("title","Invalid Email");
                 valid = false;
             }
*/
         	if(!$("#subject").val()) {
         		$("#subject").addClass("invalid");
                 $("#subject").attr("title","Required");
         		valid = false;
         	}
           if($("#content").val()=='') {
              var color = '#fbf2f2';
              t.getBody().style.backgroundColor = color;
              $("#content").attr("title","Required");
              valid = false;
           }

         	return valid;
         }

         });


function showmail(){
  //komma getrennte Werte bei Mehrfachauswahl
  var empfaenger = $("#empfaenger").val();
  if(empfaenger != ''){
        $.ajax({
            type: 'POST',
            url: '../controller/admin_phpmailer.php',
            data: {
                'function': 'showmail',
                'empfaenger': empfaenger
            },
            success: function(result) { //we got the response
              if(result !=''){
				var name = "";
				var mail = "";
				var komplett = "";
				var result_array = result.split(',');
                for(var i = 0; i < result_array.length; i++) {
                   // Trim the excess whitespace.
                   result_array[i] = result_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
                   // Add additional code here, such as:
                   var name_array = result_array[i].split('|');
                     name += name_array[0]+"&nbsp;<a href='#' class='settings text-danger' id='disable' onclick='deleteContact(\""+name_array[0]+"|"+name_array[1]+"\");' title='Kontalt entfernen' data-toggle='tooltip'><i class='fa fa-trash'></i></a>, ";
                     mail += name_array[1]+"|";
                     komplett += name_array[0]+"|"+name_array[1]+",";
                }
                name = name.substring(0,name.length-2);
                //mail = mail.substring(0,mail.length-1);

                // auskommentiert, das letzte Komma wird beim deleteContact benötigt: komplett_neu = komplett_neu.replace(contact+',' , '');
                //komplett = komplett.substring(0,komplett.length-1);
                $('#empf').html('<br><b>Kontakte:</b><br>'+name);
                document.getElementById("mailhidden").value = mail;
                document.getElementById("komplett").value = komplett;
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
  }
}


function deleteContact(contact){

  //komma getrennte Werte bei Mehrfachauswahl
  var komplett_neu = document.getElementById("komplett").value;
  komplett_neu = komplett_neu.replace(contact+',' , '');

  //letztes Komma entfernen, damit die For Schleife nicht einmal zu viel durchläuft
  komplett_neu = komplett_neu.substring(0,komplett_neu.length-1);

  if(komplett_neu != ''){
    var name = "";
    var mail = "";
    var komplett = "";
    var komplett_neu_array = komplett_neu.split(',');
    //Alexander2 Schwarz2|alexander@ja-schwarz.de,Alexander3 Schwarz3|technik@ju-and-mi.de,


    for(var i = 0; i < komplett_neu_array.length; i++) {

       // Trim the excess whitespace.
       komplett_neu_array[i] = komplett_neu_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
       // Add additional code here, such as:
       var name_array = komplett_neu_array[i].split('|');
         //name += name_array[i][0] +"->"+ name_array[i][1]+",";
         name += name_array[0]+"&nbsp;<a href='#' class='settings text-danger' id='disable' onclick='deleteContact(\""+name_array[0]+"|"+name_array[1]+"\");' title='Kontalt entfernen' data-toggle='tooltip'><i class='fa fa-trash'></i></a>, ";
         mail += name_array[1]+"|";
         komplett += name_array[0]+"|"+name_array[1]+",";
    }
    name = name.substring(0,name.length-2);
    //mail = mail.substring(0,mail.length-1);

    // auskommentiert, das letzte Komma wird beim deleteContact benötigt: komplett_neu = komplett_neu.replace(contact+',' , '');
    //komplett = komplett.substring(0,komplett.length-1);
    $('#empf').html('<br><b>Kontakte:</b><br>'+name);
    document.getElementById("mailhidden").value = mail;
    document.getElementById("komplett").value = komplett;
  }else{
	$('.selectpicker').selectpicker('deselectAll');
    $('#empf').html('');
    document.getElementById("mailhidden").value = '';
    document.getElementById("komplett").value = '';
  }
}
