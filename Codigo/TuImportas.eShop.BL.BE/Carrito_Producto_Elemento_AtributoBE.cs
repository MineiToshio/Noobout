using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Carrito_Producto_Elemento_AtributoBE
    {
        public Int32 Id_Carrito_Producto { get; set; }
        public Int32 Id_Elemento_Atributo { get; set; }
        public string Atributo { get; set; }
        public string Elemento { get; set; }
        public Int32 Id_Atributo { get; set; }
    }
}
