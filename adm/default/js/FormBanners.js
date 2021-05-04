$(function () {
    
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#imagem").change(function () {
        $('#preview').remove();
        $('#link-element').css({'margin-bottom': '16px'});
        $('#link-element').after('<img id="preview" src="" style="width: 460px; height: 270px; border-radius: 10px;" />');
        readURL(this);
    });

    $(function () {
        $('#link').bind('click', function (e) {
            if ($.trim($(e.target).val()) === '')
                $(e.target).val('http://');
        });
    });
    
    
   
});



