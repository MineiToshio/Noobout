using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Pedido_Producto_Elemento_AtributoBE
    {
        public String Atributo { get; set; }
        public String Element { get; set; }
        public Int32 Id_Pedido_Producto { get; set; }
        public Int32 Id_Pedido_Producto_Elemento_Atributo { get; set; }
    }
}
