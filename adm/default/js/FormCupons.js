// JavaScript Document
$(function () {
    $("#tipo_desconto").change(function () {
        console.log('entrou');
        var tipo = $(this).find('option:selected').val();
        
        if(tipo=='1'){
            $('#desconto-label').html('<label for="desconto" class="required">Insira o percentual do desconto (%)</label>');
        }else{
            $('#desconto-label').html('<label for="desconto" class="required">Insira o valor do desconto (R$)</label>');
        }
       
    });
  
});
