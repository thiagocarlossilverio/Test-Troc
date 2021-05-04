$(function () {
    
     $.getScript('/adm/default/js/lib/jquery.mask.min.js', function () {
       $('#valor, #km_rodados').mask('###.##0', {reverse: true, placeholder: "0.000"});
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



