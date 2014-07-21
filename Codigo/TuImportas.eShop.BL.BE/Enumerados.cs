using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuImportas.eShop.BL.BE
{
    public enum Rol
    { 
        Admin = 1,
        Usuario = 2
    }

    public enum ServidorCorreo
    {
        GMail = 1,
        GoDaddy = 2
    }

    public enum ErrorRegistroUsuario
    { 
        Usuario_Repetido = -1,
        Email_Repetido = -2,
        Dni_Repetido = -3
    }

    public enum CasillaProducto
    { 
        Nuevo = 1,
        Destacado = 2,
        Popular = 3
    }

    public enum MenuCuenta
    { 
        Inf_Cuenta = 1,
        Contrasena = 2,
        Direcciones = 3,
        Mis_Ordenes = 4,
        Mis_Favoritos = 5
    }

    public enum EtapaCompra
    { 
        Compra0 = 0,
        Compra1 = 1,
        Compra2 = 2,
        Compra3 = 3,
        Compra4 = 4
    }

    public enum Tipo_Recibo
    {
        Boleta = 1,
        Factura = 2
    }

    public enum Tipo_Direccion
    { 
        Envio = 1,
        Facturacion = 2
    }

    public enum Modo
    { 
        Insertar = 1,
        Editar = 2
    }

    public enum FormaPago
    { 
        PagoEfectivo = 1,
        PayPal = 2
    }

    public enum EstadoPedido
    { 
        Pedido = 1,
        Pagado = 2,
        Expirado = 3,
        Entregado = 4
    }
}
