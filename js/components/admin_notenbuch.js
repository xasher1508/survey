function notenbuchsave() {
    var notenbuch = document.getElementById("notenbuchname").value;
    var anz_lizenz = document.getElementById("notenbuchlizenz").value;
    var checkliz = document.getElementById("checkliz");

    if (checkliz.checked == true) {
        var var_checkliz = 1;
    } else {
        var var_checkliz = 0;
    }
    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'notenbuchsave',
            'notenbuch': notenbuch,
            'var_checkliz': var_checkliz,
            'anz_lizenz': anz_lizenz
        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    setTimeout(function() {
                        document.getElementById("notenbuchname").value = "";
                        window.location = "?";
                    }, 1000);
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

function notenbuchupdate(zsid) {
    var notenbuch = document.getElementById("notenbuchname").value;
    var anz_lizenz = document.getElementById("notenbuchlizenz").value;
    var checkliz = document.getElementById("checkliz");

    if (checkliz.checked == true) {
        var var_checkliz = 1;
    } else {
        var var_checkliz = 0;
    }
    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'notenbuchupdate',
            'notenbuch': notenbuch,
            'var_checkliz': var_checkliz,
            'zsid': zsid,
            'anz_lizenz': anz_lizenz

        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    setTimeout(function() {
                        document.getElementById("notenbuchname").value = "";
                        window.location = "?";
                    }, 1000);
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

function editNotenbuch(zsid) {

    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'editNotenbuch',
            'zsid': zsid
        },
        success: function(result) { //we got the response
            const obj = JSON.parse(result);
            var bezeichnung = obj.bezeichnung;
            var lizenzpflicht = obj.lizenzpflicht;
            var anzahl_lizenz = obj.anzahl_lizenz;

            document.getElementById('notenbuchname').value = bezeichnung;
            document.getElementById('save').onclick = function() {
                notenbuchupdate(zsid)
            };
            document.getElementById('save').innerText = 'Update';

            if (lizenzpflicht == 1) {
                document.getElementById("checkliz").checked = true;
                document.getElementById('notenbuchlizenz').disabled = false;
                document.getElementById('notenbuchlizenz').value = anzahl_lizenz;
            } else {
                document.getElementById("checkliz").checked = false;
                document.getElementById('notenbuchlizenz').disabled = true;
                document.getElementById('notenbuchlizenz').value = '';
            }

            //              if(result!=''){
            //                var a = result.split('|***|');
            //                if(a[1]=="success"){
            //                  setTimeout(function() {
            //                    document.getElementById("notenbuchname").value ="";
            //                    window.location = "?";
            //                  }, 1000);
            //                }
            //                $('#msg').show().delay(1000).fadeOut(500);
            //                $('#msg').html(a[0]);
            //              }
        },
        error: function(xhr, status, exception) {
            console.log(xhr);
        }
    });

}

function erfzuordnung(jndid, zsid) {

    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'erfzuordnung',
            'jndid': jndid,
            'zsid': zsid
        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    setTimeout(function() {
                        // Refresh Modal
                        var value = a[2];
                        // load the url and show modal on success
                        $("#ZuordnungModal .modal-body").load('notenbuchzuordnung.php?edit=' + value, function() {
                            $("#ZuordnungModal").modal("show");
                        });
                    }, 1000);
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

function delzuordnung(jndid, zsid) {


    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'delzuordnung',
            'jndid': jndid,
            'zsid': zsid
        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    setTimeout(function() {
                        // Refresh Modal
                        var value = a[2];
                        // load the url and show modal on success
                        $("#ZuordnungModal .modal-body").load('notenbuchzuordnung.php?edit=' + value, function() {
                            $("#ZuordnungModal").modal("show");
                        });
                    }, 2000);
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


function erfNotenUser(csid, zsid) {

    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'erfNotenUser',
            'csid': csid,
            'zsid': zsid
        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    $(document).ajaxStop(function() {
                        // Refresh Modal
                        var value = a[2];
                        // load the url and show modal on success
                        $("#ZuordnungModal .modal-body").load('notenuserzuordnung.php?edit=' + value, function() {
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

function delNotenUser(csid, zsid) {

    $.ajax({
        type: 'POST',
        url: '../controller/admin_notenbuch.php',
        data: {
            'function': 'delNotenUser',
            'csid': csid,
            'zsid': zsid
        },
        success: function(result) { //we got the response
            if (result != '') {
                var a = result.split('|***|');
                if (a[1] == "success") {
                    $(document).ajaxStop(function() {

                        // Refresh Modal
                        var value = a[2];
                        // load the url and show modal on success
                        $("#ZuordnungModal .modal-body").load('notenuserzuordnung.php?edit=' + value, function() {
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


function delZusammenstellung(zsid) {
    r = confirm('Zusammenstellung löschen?');
    if (r) {
        $.ajax({
            type: 'POST',
            url: '../controller/admin_notenbuch.php',
            data: {
                'function': 'delZusammenstellung',
                'zsid': zsid
            },
            success: function(result) { //we got the response
                if (result != '') {
                    var a = result.split('|***|');
                    if (a[1] == "success") {
                        $(document).ajaxStop(function() {
                            window.location = "?";
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