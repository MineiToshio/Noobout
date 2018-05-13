using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    [Serializable]
    public class Producto_Elemento_AtributoBE
    {
        public Int32 Id_Elemento_Atributo { get; set; }
        public Int32 Id_Producto { get; set; }
    }
}
