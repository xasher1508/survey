function verteilersave(){
  var verteilername = document.getElementById("verteilername").value;

        $.ajax({
            type: 'POST',
            url: '../controller/admin_verteilerlisten.php',
            data: {
                'function': 'verteilersave',
                'verteilername': verteilername
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("verteilername").value ="";
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "?"; }, 2000);
                  });
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

function erfuser(mveid, mvid) {


        $.ajax({
            type: 'POST',
            url: '../controller/admin_verteilerlisten.php',
            data: {
                'function': 'erfuser',
                'mveid': mveid,
                'mvid': mvid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('verteileruserzuordnung.php?edit='+value, function() {
                           $("#ZuordnungModal").modal("show");
                      });
                  });
                }
                $('#msg').show().delay(1000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}

function deluser(mveid, mvid) {


        $.ajax({
            type: 'POST',
            url: '../controller/admin_verteilerlisten.php',
            data: {
                'function': 'deluser',
                'mveid': mveid,
                'mvid': mvid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){

					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('verteileruserzuordnung.php?edit='+value, function() {
                           $("#ZuordnungModal").modal("show");
                      });
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



function delVerteiler(mvid) {
    r = confirm('Verteiler wirklich löschen?');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_verteilerlisten.php',
            data: {
                'function': 'delVerteiler',
                'mvid': mvid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
				      setTimeout(() => {  window.location = "?"; }, 2000);
                  });
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
}

