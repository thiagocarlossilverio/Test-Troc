// JavaScript Document
$(function () {

    if ($("#tipo_desconto").find('option:selected').val() == '1') {
        $("#desconto").mask("99,99%");
    } else {
        $('#desconto').mask('###.##0', {reverse: true, placeholder: "0.000"});
    }

    $("#tipo_desconto").change(function () {
        var tipo = $(this).find('option:selected').val();

        if (tipo == '1') {
            $('#desconto-label').html('<label for="desconto" class="required">Insira o percentual do desconto (%)</label>');
            $("#desconto").mask("99,99%");
        } else {
            $('#desconto-label').html('<label for="desconto" class="required">Insira o valor do desconto (R$)</label>');
            $('#desconto').mask('###.##0', {reverse: true, placeholder: "0.000"});
        }

    });

});
