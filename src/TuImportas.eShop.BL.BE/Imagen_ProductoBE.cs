using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    [Serializable]
    public class Imagen_ProductoBE
    {
        public Int32 Id_Imagen { get; set; }
        public Int32 Id_Producto { get; set; }
        public String Nombre { get; set; }
        public bool Mostrar_Primero { get; set; }
    }
}
