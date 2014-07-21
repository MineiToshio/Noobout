using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class CategoriaBE
    {
        public String Descripcion { get; set; }
        public Int32 Id_Categoria { get; set; }
        public String Nombre { get; set; }
        public int? Id_Padre { get; set; }
    }
}
