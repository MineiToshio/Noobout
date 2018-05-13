using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class WhishlistBE
    {
        public DateTime Fecha_Creacion { get; set; }
        public Int32 Id_Producto { get; set; }
        public Int32 Id_Usuario { get; set; }
        public Int32 Id_Whishlist { get; set; }
        public String Nombre_Imagen { get; set; }
        public String Nombre { get; set; }
        public decimal Precio { get; set; }
        public String Descripcion_Corta { get; set; }
    }
}
