infoPE = {};
function cargarInfoPago(configuration) {
    $.ajax({
        type: 'GET',
        url: configuration.url + configuration.codigo + '.json?callback=?',
        jsonpCallback: 'PagoEfectivo',
        dataType: 'jsonp',
        success: function (data) {
            infoPE = data;
            var text = $(configuration.elementTarget).html(infoPE.infoPago).text();
            $(configuration.elementTarget).html(text);
        },
        error: function (e) {
            //console.log(e.message);
        }
    });
}
function cargarInfoBancos(configuration) {
    var html = configuration.moneda == 2 ? infoPE.dolares : infoPE.soles;
    var text = $(configuration.elementTarget).html(html).text();
    $(configuration.elementTarget).html(text);
}
