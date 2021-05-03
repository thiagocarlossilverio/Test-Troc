$(function () {

    $(document).on('click', ".mapear", function () {
        var latitude = $(this).attr('latitude');
        var longitude = $(this).attr('longitude');
        var os = $(this).attr('os');
        var ip = $(this).attr('ip');
        var urlMapa = 'https://maps.google.com.br/maps?f=q&q=' + latitude + ',' + longitude + '&z=16';
        var urlCity = 'http://www.localizaip.com.br/localizar-ip.php?ip=' + ip;

        if (latitude !== '0' && longitude !== '0') {
            abreJanela(urlMapa, os, '900', '500', '');
        } else {
            if (ip == '' || ip == 'undefined') {
                alert('Não há coordenadas, para este acesso!');
            } else {
                abreJanela(urlCity, os, '900', '500', '');
            }

        }

    });

    function abreJanela(Url, NomeJanela, width, height, extras) {
        var largura = width;
        var altura = height;
        var adicionais = extras;
        var topo = (screen.height - altura) / 2;
        var esquerda = (screen.width - largura) / 2;
        novaJanela = window.open('' + Url + '', '' + NomeJanela + '', 'width=' + largura + ',height=' + altura + ',top=' + topo + ',left=' + esquerda + ',features=' + adicionais + '');
        novaJanela.focus();
    }
});
