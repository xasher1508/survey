function checkUser(){
  var mail = document.getElementById("mail").value;
        $.ajax({
            type: 'POST',
            url: '../controller/admin_memberupload.php',
            data: {
                'function': 'checkuser',
                'mail': mail
            },
            success: function(result) { //we got the response
              if(result!=''){
				$('#mailmsg').show().delay(5000).fadeOut(500);
                $('#mailmsg').html(result);
		      }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });

}


function vpb_multiple_file_uploader(vpb_configuration_settings) {
    this.vpb_settings = vpb_configuration_settings;
    this.vpb_files = "";
    this.vpb_browsed_files = []
    var self = this;
    var vpb_msg = "Sorry, your browser does not support this application. Thank You!";

    //Get all browsed file extensions
    function vpb_file_ext(file) {
        return (/[.]/.exec(file)) ? /[^.]+$/.exec(file.toLowerCase()) : '';
    }

    /* Display added files which are ready for upload */
    //with their file types, names, size, date last modified along with an option to remove an unwanted file
    vpb_multiple_file_uploader.prototype.vpb_show_added_files = function(vpb_value) {
        this.vpb_files = vpb_value;
        if (this.vpb_files.length > 0) {
            var vpb_added_files_displayer = vpb_file_id = "";
            for (var i = 0; i < this.vpb_files.length; i++) {
                //Use the names of the files without their extensions as their ids
                var files_name_without_extensions = this.vpb_files[i].name.substr(0, this.vpb_files[i].name.lastIndexOf('.')) || this.vpb_files[i].name;
                vpb_file_id = files_name_without_extensions.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');

                var vpb_file_to_add = vpb_file_ext(this.vpb_files[i].name);
                var vpb_class = $("#added_class").val();
                var vpb_file_icon;

                //Check and display File Size
                var vpb_fileSize = (this.vpb_files[i].size / 1024);
                if (vpb_fileSize / 1024 > 1) {
                    if (((vpb_fileSize / 1024) / 1024) > 1) {
                        vpb_fileSize = (Math.round(((vpb_fileSize / 1024) / 1024) * 100) / 100);
                        var vpb_actual_fileSize = vpb_fileSize + " GB";
                    } else {
                        vpb_fileSize = (Math.round((vpb_fileSize / 1024) * 100) / 100)
                        var vpb_actual_fileSize = vpb_fileSize + " MB";
                    }
                } else {
                    vpb_fileSize = (Math.round(vpb_fileSize * 100) / 100)
                    var vpb_actual_fileSize = vpb_fileSize + " KB";
                }

                //Check and display the date that files were last modified
                var vpb_date_last_modified = new Date(this.vpb_files[i].lastModifiedDate);
                var dd = vpb_date_last_modified.getDate();
                var mm = vpb_date_last_modified.getMonth() + 1;
                var yyyy = vpb_date_last_modified.getFullYear();
                var vpb_date_last_modified_file = dd + '/' + mm + '/' + yyyy;

                //File Display Classes
                if (vpb_class == 'vpb_blue') {
                    var new_classc = 'vpb_white';
                } else {
                    var new_classc = 'vpb_blue';
                }


                if (typeof this.vpb_files[i] != undefined && this.vpb_files[i].name != "") {
                    //Check for the type of file browsed so as to represent each file with the appropriate file icon

                    if (vpb_file_to_add == "jpg" || vpb_file_to_add == "JPG" || vpb_file_to_add == "jpeg" || vpb_file_to_add == "JPEG" || vpb_file_to_add == "gif" || vpb_file_to_add == "GIF" || vpb_file_to_add == "png" || vpb_file_to_add == "PNG") {
                        vpb_file_icon = '<img src="../media/file_upload_images/images_file.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "doc" || vpb_file_to_add == "docx" || vpb_file_to_add == "rtf" || vpb_file_to_add == "DOC" || vpb_file_to_add == "DOCX") {
                        vpb_file_icon = '<img src="../media/file_upload_images/doc.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "pdf" || vpb_file_to_add == "PDF") {
                        vpb_file_icon = '<img src="../media/file_upload_images/pdf.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "txt" || vpb_file_to_add == "TXT" || vpb_file_to_add == "RTF") {
                        vpb_file_icon = '<img src="../media/file_upload_images/txt.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "php") {
                        vpb_file_icon = '<img src="../media/file_upload_images/php.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "css") {
                        vpb_file_icon = '<img src="../media/file_upload_images/general.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "js") {
                        vpb_file_icon = '<img src="../media/file_upload_images/general.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "html" || vpb_file_to_add == "HTML" || vpb_file_to_add == "htm" || vpb_file_to_add == "HTM") {
                        vpb_file_icon = '<img src="../media/file_upload_images/html.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "setup") {
                        vpb_file_icon = '<img src="../media/file_upload_images/setup.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "video") {
                        vpb_file_icon = '<img src="../media/file_upload_images/video.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "real") {
                        vpb_file_icon = '<img src="../media/file_upload_images/real.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "psd") {
                        vpb_file_icon = '<img src="../media/file_upload_images/psd.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "fla") {
                        vpb_file_icon = '<img src="../media/file_upload_images/fla.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "xls" || vpb_file_to_add == "xlsx") {
                        vpb_file_icon = '<img src="../media/file_upload_images/xls.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "swf") {
                        vpb_file_icon = '<img src="../media/file_upload_images/swf.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "eps") {
                        vpb_file_icon = '<img src="../media/file_upload_images/eps.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "exe") {
                        vpb_file_icon = '<img src="../media/file_upload_images/exe.gif" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "binary") {
                        vpb_file_icon = '<img src="../media/file_upload_images/binary.png" align="absmiddle" border="0" alt="" />';
                    } else if (vpb_file_to_add == "zip") {
                        vpb_file_icon = '<img src="../media/file_upload_images/archive.png" align="absmiddle" border="0" alt="" />';
                    } else {
                        vpb_file_icon = '<img src="../media/file_upload_images/general.png" align="absmiddle" border="0" alt="" />';
                    }
                    var split = this.vpb_files[i].name.split('.');
                    var filename = split[0];
                    var extension = split[1];
                    if (filename.length > 15) {
                        filename = filename.substring(0, 10) + '[...]';
                    }
                    var result = filename + '.' + extension;
                    //Assign browsed files to a variable so as to later display them below
                    vpb_added_files_displayer += '<tr id="add_fileID' + vpb_file_id + '" class="' + new_classc + '"><td><div align="left"><span style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:gray;">' + vpb_file_icon + '&nbsp;' + result + '</span></div></td><td><span id="uploading_' + vpb_file_id + '"><span style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:gray;">Uploadbereit</span></span></td><td><div align="right"><span style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:gray;">' + vpb_actual_fileSize + '</span></div></td><td><span id="remove' + vpb_file_id + '"><span class="vpb_files_remove_left_inner" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;" onclick="vpb_remove_this_file(\'' + vpb_file_id + '\',\'' + this.vpb_files[i].name + '\');">Entfernen</span></span></td></tr></div>';

                }
            }
            //Display browsed files on the screen to the user who wants to upload them
            $("#add_files").append(vpb_added_files_displayer);
            $("#added_class").val(new_classc);
        }
    }

    //File Reader
    vpb_multiple_file_uploader.prototype.vpb_read_file = function(vpb_e) {
        if (vpb_e.target.files) {
            self.vpb_show_added_files(vpb_e.target.files);
            self.vpb_browsed_files.push(vpb_e.target.files);
        } else {
            alert('Sorry, a file you have specified could not be read at the moment. Thank You!');
        }
    }


    function addEvent(type, el, fn) {
        if (window.addEventListener) {
            el.addEventListener(type, fn, false);
        } else if (window.attachEvent) {
            var f = function() {
                fn.call(el, window.event);
            };
            el.attachEvent('on' + type, f)
        }
    }


    //Get the ids of all added files and also start the upload when called
    vpb_multiple_file_uploader.prototype.vpb_starter = function() {
        if (window.File && window.FileReader && window.FileList && window.Blob) {
            var vpb_browsed_file_ids = $("#" + this.vpb_settings.vpb_form_id).find("input[type='file']").eq(0).attr("id");
            document.getElementById(vpb_browsed_file_ids).addEventListener("change", this.vpb_read_file, false);
            document.getElementById(this.vpb_settings.vpb_form_id).addEventListener("submit", this.vpb_submit_added_files, true);
        } else {
            alert(vpb_msg);
        }
    }

    //Call the uploading function when click on the upload button
    vpb_multiple_file_uploader.prototype.vpb_submit_added_files = function() {
        self.vpb_upload_bgin();
    }

    //Start uploads
    vpb_multiple_file_uploader.prototype.vpb_upload_bgin = function() {

        if (this.vpb_browsed_files.length > 0) {
            for (var k = 0; k < this.vpb_browsed_files.length; k++) {
                var file = this.vpb_browsed_files[k];
                this.vasPLUS(file, 0);
            }
        } else {
            // Else Zweig ergänzt A. Schwarz. Wenn keine Dateien zum hochladen sind, dann Insert mit den Daten machen
            this.vasINSERT();
        }
    }

    //Main file uploader

    // A. Schwarz: Insert mit File
    vpb_multiple_file_uploader.prototype.vasPLUS = function(file, file_counter) {
        if (typeof file[file_counter] != undefined && file[file_counter] != '') {
            //Use the file names without their extensions as their ids
            var files_name_without_extensions = file[file_counter].name.substr(0, file[file_counter].name.lastIndexOf('.')) || file[file_counter].name;
            var ids = files_name_without_extensions.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');
            var vpb_browsed_file_ids = $("#" + this.vpb_settings.vpb_form_id).find("input[type='file']").eq(0).attr("id");

            var removed_file = $("#" + ids).val();

            if (removed_file != "" && removed_file != undefined && removed_file == ids) {
                self.vasPLUS(file, file_counter + 1);
            } else {
                var dataString = new FormData();
                dataString.append('upload_file', file[file_counter]);
                dataString.append('upload_file_ids', ids);

                var vorname = document.getElementById("vorname").value;
                var nachname = document.getElementById("nachname").value;
                var mail = document.getElementById("mail").value;
                var singstimme = document.getElementById("singstimme").value;
                var bemerkung =tinyMCE.get('bemerkung').getContent()
                // csid beim Bearbeiten von Membern
                var csid_edit = document.getElementById("csid").value;
                var chk_einw_livestream = document.getElementById("einw_livestream");
                var chk_einw_homepage = document.getElementById("einw_homepage");
                var chk_einw_socialmedia = document.getElementById("einw_socialmedia");
                if(chk_einw_livestream.checked == true){
				 var var_einw_livestream = 1;
				}else{
				 var var_einw_livestream = 0;
                }
                if(chk_einw_homepage.checked == true){
				 var var_einw_homepage = 1;
				}else{
				 var var_einw_homepage = 0;
                }
                if(chk_einw_socialmedia.checked == true){
				 var var_einw_socialmedia = 1;
				}else{
				 var var_einw_socialmedia = 0;
                }
                var alter16 = document.querySelector('input[name="alter16"]:checked').value;
                dataString.append('vorname', vorname);
                dataString.append('nachname', nachname);
                dataString.append('mail', mail);
                dataString.append('singstimme', singstimme);
                dataString.append('bemerkung', bemerkung);
                dataString.append('csid_edit', csid_edit);
                dataString.append('einw_livestream', var_einw_livestream);
                dataString.append('einw_homepage', var_einw_homepage);
                dataString.append('einw_socialmedia', var_einw_socialmedia);
                dataString.append('alter16', alter16);
                dataString.append('function', 'save_with_files');


                $.ajax({
                    type: "POST",
                    url: this.vpb_settings.vpb_server_url,
                    data: dataString,
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $("#uploading_" + ids).html('<div align="left"><img src="../media/file_upload_images/loadings.gif" width="80" align="absmiddle" title="Upload...."/></div>');
                        $("#remove" + ids).html('<div align="center" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:blue;">Uploading...</div>');
                    },
                    success: function(response) {

                        var a = response.split('|***|');

                        // Länge der Zeit berechnen, wie lange die Messagebox angezeigt wird. Jedes File wird zumindest optisch einzeln hochgeladen.
                        var waitempty_chk = ($('[id^=add_fileID]').length*2000)+2000;

                        if(waitempty_chk >5000 ){
                          var waitempty	= waitempty_chk;
                        }else{
					      // Mindestens aber 5 Sekunden
                          var waitempty = 5000;
                        }
                            setTimeout(function() {
//                              document.getElementById("titel").value = "";
//                              document.getElementById("verlag").value = "";
//                              document.getElementById("anz_lizenzen").value = "";
//                              document.getElementById("vasplus_multiple_files").value = "";
//                              document.getElementById("streamlizenz").checked = false;
//                              var $el = $('#vasplus_multiple_files');
//                              $el.wrap('<form>').closest('form').get(0).reset();
//                              $el.unwrap();
//
//                              $("#add_files > tbody").empty();
                                // Alternativlösung. Felder leeren alleine bringt nichts. Wenn man eine File hochlädt und das nächste Mal ohne File, dann werden die letzten Files nochmals hochgeladen.
                                // Daher eine Weiterleitung auf sich selbst, damit der Prozess neu initiiert wird.
                                window.location = "";
                            }, waitempty);


                        $('#msg').show().delay(waitempty).fadeOut(500);
                        $('#msg').html(a[0]);

                        var responseid = a[2];
                        setTimeout(function() {
                            var response_brought = responseid.indexOf(ids);
                            if (response_brought != -1) {
                                $("#uploading_" + ids).html('<div align="left" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:blue;">Vollst&auml;ndig</div>');
                                $("#remove" + ids).html('<div align="center" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:gray;">Hochgeladen</div>');
                            } else {
                                var fileType_response_brought = responseid.indexOf('file_type_error');
                                if (fileType_response_brought != -1) {

                                    var filenamewithoutextension = responseid.replace('file_type_error&', '').substr(0, responseid.replace('file_type_error&', '').lastIndexOf('.')) || responseid.replace('file_type_error&', '');
                                    var fileID = filenamewithoutextension.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');
                                    $("#uploading_" + fileID).html('<div align="left" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:red;">Invalid File</div>');
                                    $("#remove" + fileID).html('<div align="center" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:orange;">Abgebrochen</div>');

                                } else {
                                    var filesize_response_brought = responseid.indexOf('file_size_error');
                                    if (filesize_response_brought != -1) {
                                        var filenamewithoutextensions = responseid.replace('file_size_error&', '').substr(0, responseid.replace('file_size_error&', '').lastIndexOf('.')) || responseid.replace('file_size_error&', '');
                                        var fileID = filenamewithoutextensions.replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, '');
                                        $("#uploading_" + fileID).html('<div align="left" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:red;">Exceeded Size</div>');
                                        $("#remove" + fileID).html('<div align="center" style="font-family:Verdana, Geneva, sans-serif;font-size:11px;color:orange;">Abgebrochen</div>');
                                    } else {
                                        var general_response_brought = responseid.indexOf('general_system_error');
                                        if (general_response_brought != -1) {
                                            alert('Sorry, the file was not uploaded...');
                                        } else {
                                            /* Do nothing */ }
                                    }
                                }
                            }
                            if (file_counter + 1 < file.length) {
                                self.vasPLUS(file, file_counter + 1);
                            } else {}
                        }, 2000);
                    }
                });
            }
        } else {
            alert('Sorry, this system could not verify the identity of the file you were trying to upload at the moment. Thank You!');
        }
    }


    // By A. Schwarz: Insert ohne File
    vpb_multiple_file_uploader.prototype.vasINSERT = function() {
                var vorname = document.getElementById("vorname").value;
                var nachname = document.getElementById("nachname").value;
                var mail = document.getElementById("mail").value;
                var singstimme = document.getElementById("singstimme").value;
                var bemerkung =tinyMCE.get('bemerkung').getContent()
                // csid beim Bearbeiten von Membern
                var csid_edit = document.getElementById("csid").value;
                var chk_einw_livestream = document.getElementById("einw_livestream");
                var chk_einw_homepage = document.getElementById("einw_homepage");
                var chk_einw_socialmedia = document.getElementById("einw_socialmedia");
                if(chk_einw_livestream.checked == true){
				 var var_einw_livestream = 1;
				}else{
				 var var_einw_livestream = 0;
                }
                if(chk_einw_homepage.checked == true){
				 var var_einw_homepage = 1;
				}else{
				 var var_einw_homepage = 0;
                }
                if(chk_einw_socialmedia.checked == true){
				 var var_einw_socialmedia = 1;
				}else{
				 var var_einw_socialmedia = 0;
                }
                var alter16 = document.querySelector('input[name="alter16"]:checked').value;

        $.ajax({
            type: 'POST',
            url: this.vpb_settings.vpb_server_url,
            data: {
                'function': 'save_without_files',
                'vorname': vorname,
                'nachname': nachname,
                'mail': mail,
                'singstimme': singstimme,
                'bemerkung': bemerkung,
                'csid_edit': csid_edit,
                'einw_livestream': var_einw_livestream,
                'einw_homepage': var_einw_homepage,
                'einw_socialmedia': var_einw_socialmedia,
                'alter16': alter16
            },
            success: function(response) { //we got the response
                if (response != '') {
                    var a = response.split('|***|');
                    if (a[1] == "success") {
                        //document.getElementById("titel").value = "";
                        //document.getElementById("verlag").value = "";
                        //document.getElementById("anz_lizenzen").value = "";
                        //document.getElementById("vasplus_multiple_files").value = "";
                        //document.getElementById("streamlizenz").checked = false;
                        // Alternativlösung. Felder leeren alleine bringt nichts. Wenn man eine File hochlädt und das nächste Mal ohne File, dann werden die letzten Files nochmals hochgeladen.
                        // Daher eine Weiterleitung auf sich selbst, damit der Prozess neu initiiert wird.
                       if(csid_edit == '-1'){
						 // Bei Neuanlage Seite refreshen, damit die Felder leer sind. Beim Bearbeiten brauchts das nicht, da die bearbeiteten Werte schon in den Feldern stehen
                         setTimeout(function() {
                           window.location = "";
                         }, 2000);
				       }
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




    this.vpb_starter();
}

function vpb_remove_this_file(id, filename) {
    if (confirm('If you are sure to remove the file: ' + filename + ' then click on OK otherwise, Cancel it.')) {
        $("#vpb_removed_files").append('<input type="hidden" id="' + id + '" value="' + id + '">');
        $("#add_fileID" + id).slideUp();
    }
    return false;
}

function delMemberFile(id) {
    r = confirm('Dokument löschen?');
    if (r) {


        $.ajax({
            type: 'POST',
            url: '../controller/admin_memberupload.php',
            data: {
                'function': 'delMemberFile',
                'id': id
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                var csid = a[2];
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
                   setTimeout(function() {
				      window.location = "?editcsid="+csid;
				    }, 2000);
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

function delMember(csid) {
    r = confirm('SängerIn löschen?');
    if (r) {

        $.ajax({
            type: 'POST',
            url: '../controller/admin_memberupload.php',
            data: {
                'function': 'delMember',
                'csid': csid
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                if(a[1]=="success"){
                  $(document).ajaxStop(function(){
                   setTimeout(function() {
				      window.location = "";
				    }, 2000);
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

function erf_einw(id, user){
  // Funktion, wenn man User editiert und nicht extra auf speichern klickt: Livespeichern der Einwilligungen
  if(user != ""){
    var checkBox = document.getElementById(id);

    if(checkBox.checked == true){
     var var_check = 1;
    }else{
     var var_check = 0;
    }

          $.ajax({
              type: 'POST',
              url: '../controller/admin_memberupload.php',
              data: {
                  'function': 'erfeinw',
                  'id': id,
                  'user': user,
                  'var_check': var_check
              },
              success: function(result) { //we got the response
                 console.log('Einwilligung save');
              },
              error: function(xhr, status, exception) {
                  console.log(xhr);
              }
          });
  }
}

function erf_alter(user){
  // Funktion, wenn man User editiert und nicht extra auf speichern klickt: Livespeichern der Einwilligungen
  if(user != ""){
    var alter16 = document.querySelector('input[name="alter16"]:checked').value;

          $.ajax({
              type: 'POST',
              url: '../controller/admin_memberupload.php',
              data: {
                  'function': 'erf_alter',
                  'alter16': alter16,
                  'user': user
              },
              success: function(result) { //we got the response
                 console.log('Alter save');
              },
              error: function(xhr, status, exception) {
                  console.log(xhr);
              }
          });
  }
}