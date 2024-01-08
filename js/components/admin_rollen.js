function rollesave(){
  var rollenname = document.getElementById("rollenname").value;

        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'rollesave',
                'rollenname': rollenname
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  document.getElementById("rollenname").value ="";
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
function erfzuordnung(val) {
   var param = val.split('|');
   var meid  = param[0];
   var rid   = param[1];

        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'erfzuordnung',
                'meid': meid,
                'rid': rid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('rollenzuordnung.php?edit='+value, function() {
                           $("#ZuordnungModal").modal("show");
                      });
                  });
                }
                $('#msg').show().delay(5000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}

function delzuordnung(val) {
   var param = val.split('|');
   var meid  = param[0];
   var rid   = param[1];

        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'delzuordnung',
                'meid': meid,
                'rid': rid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){

					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('rollenzuordnung.php?edit='+value, function() {
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



function erfuser(val) {
   var param = val.split('|');
   var uid  = param[0];
   var rid   = param[1];

        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'erfuser',
                'uid': uid,
                'rid': rid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('userzuordnung.php?edit='+value, function() {
                           $("#ZuordnungModal").modal("show");
                      });
                  });
                }
                $('#msg').show().delay(5000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}

function deluser(val) {
   var param = val.split('|');
   var uid  = param[0];
   var rid   = param[1];

        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'deluser',
                'uid': uid,
                'rid': rid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){

					  // Refresh Modal
                      var value = a[2];
                      // load the url and show modal on success
                      $("#ZuordnungModal .modal-body").load('userzuordnung.php?edit='+value, function() {
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



function delRole(rid) {
    r = confirm('Rolle löschen? Benutzer sind dann unzugeordnet!');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_rollen.php',
            data: {
                'function': 'delRole',
                'rid': rid
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
