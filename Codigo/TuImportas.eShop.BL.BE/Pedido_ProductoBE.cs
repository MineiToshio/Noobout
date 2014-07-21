using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Pedido_ProductoBE
    {
        public Int32 Cantidad { get; set; }
        public Int32 Id_Direccion_Envio { get; set; }
        public Int32 Id_Direccion_Facturacion { get; set; }
        public Int32 Id_Pedido { get; set; }
        public Int32 Id_Producto { get; set; }
        public Decimal Precio { get; set; }
        public string Color { get; set; }
        public string Nombre { get; set; }
        public string Imagen { get; set; }
    }
}
