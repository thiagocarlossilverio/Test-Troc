$(function() {
    $(".sortable").sortable({
        placeholder: "portlet-placeholder ui-corner-all",
        //revert: 400,
        opacity: 0.3,
        cancel: ".portlet-toggle",
        // tolerance: "pointer",

        stop: function(event, ui) {

            $ordem = [];

            $(".quadro").each(function(index, element) {

                $ordem.push($(this).data('ordem'));

            });

            console.log($ordem);
            $.ajax({
                type: "POST",
                url: "/admin/banners/ajax-ordem",
                data: {ordem: $ordem}
            }).done(function(data) {

            });
        }
    });
    
    


});
