$(function () {
    CKEDITOR.replace('conteudo');
    var pagina = $('#pagina').val();
    if (pagina == 0)
    {
        $('#conteudo').attr('disabled', 'disabled');
    }
    $('#pagina').change(function () {
        var pagina = $(this).val();
        window.location = '/admin/institucional/index/item/' + pagina;
    });

});
