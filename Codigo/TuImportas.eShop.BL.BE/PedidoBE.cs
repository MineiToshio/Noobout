using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class PedidoBE
    {
        public DateTime Fecha_Compra { get; set; }
        public Int32? Id_Forma_Pago { get; set; }
        public Int32 Id_Pedido { get; set; }
        public Int32 Id_Usuario { get; set; }
        public Decimal Total { get; set; }
        public decimal Subtotal { get; set; }
        public decimal Precio_Envio { get; set; }
        public int Id_Tipo_Recibo { get; set; }
        public string Razon_Social { get; set; }
        public string Ruc { get; set; }
        public List<Pedido_ProductoBE> lstPedido_ProductoBE { get; set; }
        public Pedido_DireccionBE objDireccionEnvioBE { get; set; }
        public Pedido_DireccionBE objDireccionFacturacionBE { get; set; }
        public String Nombre_Tipo_Recibo { get; set; }
        public String Nombre_Forma_Pago { get; set; }
        public String Fecha_Texto { get; set; }
        public string Productos_Texto { get; set; }
        public string Direccion_Envio_Texto { get; set; }
        public string Direccion_Facturacion_Texto { get; set; }
        public string Operador_Logistico { get; set; }
        public string Tiempo_Entrega { get; set; }
        public string Cip { get; set; }
        public string Nombre_Usuario { get; set; }
        public int Estado { get; set; }
        public string Nombre_Estado { get; set; }
        public string Correo_Usuario { get; set; }
        public PedidoBE()
        {
            lstPedido_ProductoBE = new List<Pedido_ProductoBE>();
            objDireccionEnvioBE = new Pedido_DireccionBE();
            objDireccionEnvioBE.Id_Tipo_Direccion = (int)Tipo_Direccion.Envio;
            objDireccionFacturacionBE = new Pedido_DireccionBE();
            objDireccionFacturacionBE.Id_Tipo_Direccion = (int)Tipo_Direccion.Facturacion;
            Productos_Texto = "";
        }
    }
}
