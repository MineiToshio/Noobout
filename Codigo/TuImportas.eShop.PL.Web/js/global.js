function top_noty(tipo, mensaje) {
    var n = noty({
        text: mensaje,
        type: tipo,
        dismissQueue: true,
        layout: 'top',
        theme: 'defaultTheme',
        timeout: 5000
    });
}

function error() {
    top_noty('Error', 'Ha ocurrido un error inesperado. Por favor, vuelva a intentar en un momento.');
}

