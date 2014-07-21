using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Pedido_DireccionBE
    {
        public String Departamento { get; set; }
        public String Direccion { get; set; }
        public String Distrito { get; set; }
        public Int32 Id_Pedido_Direccion { get; set; }
        public String Provincia { get; set; }
        public String Referencia { get; set; }
        public int Id_Pedido { get; set; }
        public int Id_Tipo_Direccion { get; set; }
        public string Nombre_Tipo_Direccion { get; set; }
    }
}
