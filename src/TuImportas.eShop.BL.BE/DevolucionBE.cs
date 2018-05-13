using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class DevolucionBE
    {
        public Int32 Id_Devolucion { get; set; }
        public Int32 Id_Pedido { get; set; }
        public Int32 Id_Producto { get; set; }
        public String Motivo { get; set; }
    }
}
