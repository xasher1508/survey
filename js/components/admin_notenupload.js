// Anders als sonst. Hier ist das Javascript auf der  ID des Textfelds
// https://stackoverflow.com/questions/8300381/jquery-ui-autocomplete-how-to-send-post-data

$("#titel").autocomplete({
    source: function(request, response) {
        $.ajax({
            type: "POST",
            url: "../controller/admin_suche.php",
            data: {
                term: request.term,
                function: "titel"
            },
            success: response,
            dataType: 'json',
            delay: 10
        });
    }
}, {
    minLength: 2
});

$("#verlag").autocomplete({
    source: function(request, response) {
        $.ajax({
            type: "POST",
            url: "../controller/admin_suche.php",
            data: {
                term: request.term,
                function: "verlag"
            },
            success: response,
            dataType: 'json',
            delay: 10
        });
    }
}, {
    minLength: 2
});