function rand(a, i) {
    return Math.floor(Math.random() * (i - a + 1) + a);
}

function ReturnURL() {
    var a = window.location.href,
            i = a.split("/");
    return i[4];
}

function SetaOrder(a) {
    var i = [];
    $(" #" + a + " li").each(function (a) {
        i[$(this).index() + 1] = $(this).data("id");
    }),
            $.ajax({
                url: "/admin/" + ReturnURL() + "/ajax-seta-order",
                type: "POST",
                data: {
                    param: i
                }
            });
}

function SetaCapa(a) {
    $.ajax({
        url: "/admin/" + ReturnURL() + "/ajax-seta-capa",
        type: "POST",
        data: {
            param: a
        }
    });
}
$(function () {
    URL = window.location.href;
    var a = URL.split("/");

    $("input[type=file][class=multiUpload]") && ($('<style type="text/css"> @import url(/adm/default/js/lib/jQuery-File-Upload-9.9.3/css/jquery.fileupload.css); </style>').prependTo("head"), $.getScript("/adm/default/js/lib/jQuery-File-Upload-9.9.3/js/vendor/jquery.ui.widget.js", function () {
        $.getScript("/adm/default/js/lib/jQuery-File-Upload-9.9.3/js/jquery.iframe-transport.js", function () {
            $.getScript("/adm/default/js/lib/jQuery-File-Upload-9.9.3/js/jquery.fileupload.js", function () {
                $height = $(".multiUpload").height(),
                        $i = 0,
                        $(".multiUpload").each(function () {
                    $input = $(this).attr("name"),
                            $("#id").val() ? $rand = $("#id").val() : $rand = $(this).attr("rel"),
                            $sess = $(this).attr("class").split(" "),
                            $height && ($('<ul id="files-' + $i + '" class="files col-sm-12"  ondragleave="DragOut(this)" ondragover="DragOver(this)" ondrop="DropStop(this)"></ul>').insertAfter(this),
                                    $dir = $(this).attr("dir"), $(this).replaceWith('<span class="btn btn-upload fileinput-button"><span>Selecionar Arquivos</span><input id="fileupload-' + $i + '" type="file" name="imagens" style="cursor:pointer;" multiple></span>'),
                                    $("#fileupload-" + $i).fileupload({
                                url: URL + "/multiUpload/1",
                                formData: {
                                    vinculoRand: $rand
                                }
                            }).on("fileuploaddone", function (a, i) {
                                $(a.target).parent().next(".files").find("div.vazio").first().parent().attr("data-id", i.result),
                                        $(a.target).parent().next(".files").find("div.vazio").first().css({
                                    backgroundImage: "url(/" + $dir + i.result + ")",
                                    backgroundSize: "cover"
                                }), $(a.target).parent().next(".files").find("div.vazio").first().find(":radio").click(function () {
                                    SetaCapa(i.result);
                                }), $(a.target).parent().next(".files").find("div.vazio").first().find(".glyphicon").first().click(function () {
                                    $(this).parents("li").fadeOut(500),
                                            $.ajax({
                                                type: "POST",
                                                url: URL,
                                                data: {
                                                    "delete": 1,
                                                    imagem: i.result
                                                }
                                            });
                                }), $(a.target).parent().next(".files").find("div.vazio").first().removeClass("vazio"),
                                        SetaOrder($(a.target).parent().next(".files").attr("id"));
                            }).on("fileuploadadd", function (a, i) {
                                $quadro = $(this).parent().next(".files"), $.each(i.files, function (a, i) {
                                    $($quadro).append('<li class="imgContain">\n\
                                                        <div class="quadro vazio">\n\
                                                        <input type="radio" name="capa" value="1" >\n\
                                                        <div class="btn btn-xs btn-danger glyphicon glyphicon-remove"></div></div></li>');
                                });
                            }).prop("disabled", !$.support.fileInput).parent().addClass($.support.fileInput ? void 0 : "disabled")), $("#id").length && "" != $("#id").val() && "undefined" != $("#id").val() && $.ajax({
                        url: "/admin/" + a[4] + "/ajax-imagens",
                        type: "POST",
                        data: {
                            param: $("#id").val()
                        },
                        success: function (a) {
                            $(a).each(function (a, i) {
                                $capa = 1 == i.capa ? ' checked="checked" ' : "",
                                        $("#files-" + ($i - 1)).append('<li class="imgContain" data-id="' + i.imagem + '"><div class="quadro" style="background-image: url(/' + $dir + i.imagem + '); background-size: cover;"><input type="radio" onclick="SetaCapa(\'' + i.imagem + '\')" name="capa" value="1" ' + $capa + '><div class="glyphicon glyphicon-remove" data-id="' + i.imagem + '"></div></div></li>');
                            }), $(".glyphicon").click(function () {
                                $img = $(this).attr("data-id"), $(this).parents(".imgContain").fadeOut(500),
                                        $.ajax({
                                            url: URL,
                                            type: "POST",
                                            data: {
                                                "delete": 1,
                                                imagem: $img
                                            }
                                        }), SetaOrder($(this).parents(".files").attr("id"));
                            });
                        }
                    }), $("#files-" + $i).sortable({
                        placeholder: "place",
                        containment: "parent",
                        update: function (a, i) {
                            SetaOrder(a.target.id);
                        }
                    }), $("#files-" + $i).disableSelection(), $i++;

                });
            });
        });

    }));

    $.getScript('/adm/default/js/lib/jquery.mask.min.js', function () {
        $('#cpf').mask('999.999.999-99');
        $('.ip_address').mask('099.099.099.099');
        $('.price').mask('###.##0', {reverse: true, placeholder: "0.000"});
        $(".data").mask("99/99/9999");
        $(".hora").mask("99:99");
        $(".data").datepicker({
            dateFormat: "dd/mm/yy",
            dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"],
            monthNames: ["Janeiro", "Fevereiro", "MarÃ§o", "Abril", "Maio", "junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]});

        $(".data_time").mask("99/99/9999 99:99");
        $(".data_time").datetimepicker({
            //numberOfMonths: 3,
            showButtonPanel: true,
            minDate: 0,
            dateFormat: "dd/mm/yy",
            dayNamesMin: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"],
            monthNames: ["Janeiro", "Fevereiro", "MarÃ§o", "Abril", "Maio", "junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]});
    });
    
     $editor = CKEDITOR.replace('descricao', {
        toolbar: [
            {name: 'editing', groups: ['find', 'selection', 'spellchecker'], items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt']},
            {name: 'basicstyles', groups: ['basicstyles', 'cleanup'], items: ['Bold', 'Italic', 'Underline', '-', 'RemoveFormat']},
            {name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi'], items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote']},
            {name: 'links', items: ['Link', 'Unlink']},
            {name: 'tools', items: ['Maximize', 'ShowBlocks']},
        ]
    });
});