using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    [Serializable]
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
        public int Id_Pedido_Producto { get; set; }
        public List<Pedido_Producto_Elemento_AtributoBE> lstPedido_Producto_Elemento_AtributoBE { get; set; }

        public Pedido_ProductoBE()
        {
            lstPedido_Producto_Elemento_AtributoBE = new List<Pedido_Producto_Elemento_AtributoBE>();
        }
    }
}
