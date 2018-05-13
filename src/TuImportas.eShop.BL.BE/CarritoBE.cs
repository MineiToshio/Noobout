using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class CarritoBE
    {
        public Int32 Id_Carrito { get; set; }
        public Int32? Id_Direccion_Envio { get; set; }
        public Int32? Id_Direccion_Facturacion { get; set; }
        public Int32 Id_Usuario { get; set; }
        public Decimal Total { get; set; }
        public Decimal Subtotal { get; set; }
        public List<Carrito_ProductoBE> lstCarrito_ProductoBE { get; set; }
        public int? Id_Forma_Pago { get; set; }
        public decimal Precio_Envio { get; set; }
        public EtapaCompra PasosCarrito { get; set; }
        public int Id_Tipo_Recibo { get; set; }
        public String Ruc { get; set; }
        public String Razon_Social { get; set; }
        public DireccionBE Direccion_Envio { get; set; }
        public DireccionBE Direccion_Facturacion { get; set; }
        public int? Id_Operador { get; set; }
        public string Nombre_Operador_Logistico { get; set; }
        public string Tiempo_Entrega { get; set; }
        public string Cip { get; set; }

        public CarritoBE()
        {
            lstCarrito_ProductoBE = new List<Carrito_ProductoBE>();
            PasosCarrito = EtapaCompra.Compra0;
            Direccion_Envio = new DireccionBE();
            Direccion_Facturacion = new DireccionBE();
        }
    }
}
