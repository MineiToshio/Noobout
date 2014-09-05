using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Carrito_ProductoBE
    {
        public Int32 Cantidad { get; set; }
        public Int32 Id_Carrito { get; set; }
        public Int32 Id_Producto { get; set; }
        public String Nombre { get; set; }
        public String Imagen { get; set; }
        public Decimal Precio { get; set; }
        public int? Id_Color { get; set; }
        public string Color { get; set; }
        public int Id_Carrito_Producto { get; set; }
        public List<Carrito_Producto_Elemento_AtributoBE> lstCarrito_Producto_Elemento_AtributoBE { get; set; }

        public Carrito_ProductoBE()
        {
            lstCarrito_Producto_Elemento_AtributoBE = new List<Carrito_Producto_Elemento_AtributoBE>();
        }
    }
}
