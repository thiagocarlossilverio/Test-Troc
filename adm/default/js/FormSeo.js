// JavaScript Document
$(function () {
    $("#controlador").change(function () {
        // var controlador = $(this).find('option:selected').text();
        Actions($(this).val());
    });
    $("#acao").change(function () {
        var acao = $(this).val();
        Populate(acao);
    });
    // CONTADOR DE CARACTERES DIGITADOS
    $("#nome, #meta_description, #meta_keywords, #tag_title").keyup(function () {
        // ContaCaracteres(element)
        ContaCaracteres($(this));
    });
//    $("#controlador").find('option').each(function () {
//        var text = $(this).text();
//        $(this).text(text.replace('index', 'inicio'));
//    });
});
function ContaCaracteres(element) {
    if (!element.attr('maxlenght')) {
        var maxlength = 255;
    } else {
        var maxlength = element.attr('maxlenght');
    }
    var tamanho = element.val().length;
    element.next().html(tamanho + ' de ' + maxlength + ' caracteres').hasClass('description');
}
function Actions($valor) {
    $("#acao > option").remove();
    if ($valor !== '') {
        $("#acao").html('');
        $.getJSON('/admin/seo/ajax-acoes/controlador/' + $valor, function (data) {
            if (data !== '') {
                $('#acao').removeAttr('disabled');
                var item = '<option>Selecione uma Ação.</option>';
                $.each(data, function (key, val) {
                    item += '<option value="' + val + '">' + val + '</option>';
                });
                $("#acao").html(item);
                $('#tag_title').val('');
                $('#meta_description').val('');
                $('#meta_keywords').val('');
//                $("#acao").find('option').each(function () {
//                    var text = $(this).text();
//                    $(this).text(text.replace('index', 'inicio'));
//                });
            } else {
                $("#acao").append('<option>Nenhuma Action encontrada.</option>').attr('disabled', 'disabled');
            }
        });
    }
}
function Populate(acao) {
    $.ajax({
        url: '/admin/seo/ajax-populate/',
        type: 'POST',
        data: {
            controlador: $('#controlador').find('option:selected').text(),
            acao: acao
        },
        dataType: 'json',
        success: function (data) {
            if (data !== '') {
                $('#tag_title').val(data.title);
                $('#meta_description').val(data.description);
                $('#meta_keywords').val(data.keywords);
            } else {
                $('#tag_title').val('');
                $('#meta_description').val('');
                $('#meta_keywords').val('');
            }
        }
    });
}
