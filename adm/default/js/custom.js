/*============================================================= Autor: Thiago Carlos Silvério ========================================================  */(function ($) {    "use strict";    var mainApp = {        main_fun: function () {            /*====================================             METIS MENU              ======================================*/            $('#main-menu').metisMenu();            /*====================================             LOAD APPROPRIATE MENU BAR             ======================================*/            $(window).bind("load resize", function () {                if ($(this).width() < 768) {                    $('div.sidebar-collapse').addClass('collapse')                } else {                    $('div.sidebar-collapse').removeClass('collapse')                }            });        },        initialization: function () {            mainApp.main_fun();        }    }    // Initializing ///    $(document).ready(function () {        mainApp.main_fun();        $("select").not('#permissao').select2({width: "element"});        $(".fancybox").fancybox();        //$(".upload").niceFileInput();        $(".upload").filestyle();        var base_url = '/admin/';        var table = $('.table').not('.ticket').dataTable({            "language": {                "sEmptyTable": "Nenhum registro encontrado",                "sInfo": "Mostrando de _START_ at _END_ de _TOTAL_ registros",                "sInfoEmpty": "Exibindo 0 até 0 de 0 registros",                "sInfoFiltered": "(Filtrados de _MAX_ registros)",                "sInfoPostFix": "",                "sInfoThousands": ".",                "sLengthMenu": "_MENU_ &nbsp;&nbsp;Resultados por página",                "sLoadingRecords": "Carregando...",                "sProcessing": "Processando...",                "sZeroRecords": "Nenhum registro encontrado",                "sSearch": "Pesquisar&nbsp;&nbsp;",                "oPaginate": {                    "sNext": "Próximo",                    "sPrevious": "Anterior",                    "sFirst": "Primeiro",                    "sLast": "último"                },                "oAria": {                    "sSortAscending": ": Ordenar colunas de forma ascendente",                    "sSortDescending": ": Ordenar colunas de forma descendente"                }},            "iDisplayLength": 25,                         "aaSorting": [[ 0, "desc" ]]        });        $(".sortable").sortable({            placeholder: "portlet-placeholder ui-corner-all",            //revert: 400,            opacity: 0.3,            cancel: ".portlet-toggle",            // tolerance: "pointer",            stop: function (event, ui) {                var ordem = [];                $(".quadro").each(function (index, element) {                    ordem.push($(this).data('ordem'));                });                $.ajax({                    type: "POST",                    url: "/admin/index/ajax-ordem",                    data: {ordem: ordem}                }).done(function (data) {                });            }        });    });}(jQuery));$(function () {// DIALOGS DE EXCLUSÃO    $(".iconDelete").click(function (event) {        //não redirecionar para a pagina interna quando clicar na <td> de opções        event.stopPropagation($(this).parent('tr'));        event.preventDefault();        $dialog = $("#confirm_delete");        $element = $(this);        if ($(this).attr('title')) {            var titulo = $(this).attr('title');        } else {            var titulo = 'Excluir';        }        var conteudo = $(this).data('dialog-text');        $('.dialog_text').text(conteudo);        $("#confirm_delete").dialog({            title: titulo,            resizable: false,            draggable: false,            width: 450,            modal: true,            buttons: {                "Cancelar": function () {                    $(this).dialog("close");                },                "Excluir": {text: 'Excluir',                    class: 'btnExcluir',                    click: function () {                        $dialog.dialog("close");                        window.location.href = $element.attr('href');                    }                }            },            open: function (event, ui) {                // $('#confirm_delete .dialog_text').html(conteudo);            },        });    });});