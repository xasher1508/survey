function onClickSaveParameter() {
var inputs = $(":input").serializeArray()
inputs = JSON.stringify(inputs)
        $.ajax({
            type: 'POST',
            url: '../controller/admin_parameter.php',
            data: {
                'function': 'saveParameter',
                'inputs': inputs
            },
            success: function(result) { //we got the response
              if(result!=''){
                var a = result.split('|***|');
                $('#msg').show().delay(5000).fadeOut(500);
                $('#msg').html(a[0]);
              }
            },
            error: function(xhr, status, exception) {
                console.log(xhr);
            }
        });
}