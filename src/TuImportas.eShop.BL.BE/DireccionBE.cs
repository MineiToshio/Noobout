using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class DireccionBE
    {
        public String Direccion { get; set; }
        public String Id_Departamento { get; set; }
        public Int32 Id_Direccion { get; set; }
        public String Id_Distrito { get; set; }
        public String Id_Provincia { get; set; }
        public Int32 Id_Usuario { get; set; }
        public String Nombre { get; set; }
        public String Referencia { get; set; }
        public String Nombre_Departamento { get; set; }
        public String Nombre_Provincia { get; set; }
        public String Nombre_Distrito { get; set; }
        public decimal Precio_Envio { get; set; }
    }
}
