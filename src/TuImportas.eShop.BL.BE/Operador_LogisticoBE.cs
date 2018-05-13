using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class Operador_LogisticoBE
    {
        public Decimal Costo_Lima { get; set; }
        public Decimal Costo_Provincia { get; set; }
        public Boolean Habilitado { get; set; }
        public Int32 Id_Operador { get; set; }
        public String Nombre { get; set; }
        public String Tiempo_Entrega { get; set; }
        public string Img_Habilitado { get; set; }
    }
}
