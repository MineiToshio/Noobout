using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    [Serializable]
    public class ProductoBE
    {
        public Boolean Activo { get; set; }
        public String Descripcion_Corta { get; set; }
        public String Descripcion { get; set; }
        public Decimal? Descuento { get; set; }
        public String Detalle { get; set; }
        public DateTime Fecha_Creacion { get; set; }
        public DateTime Fecha_Modificacion { get; set; }
        public Int32 Id_Producto { get; set; }
        public Int32 Id_Usuario_Creacion { get; set; }
        public Int32 Id_Usuario_Modificacion { get; set; }
        public String Nombre { get; set; }
        public Decimal Precio { get; set; }
        public bool Destacado { get; set; }
        public int Cantidad_Vendidos { get; set; }
        public List<Imagen_ProductoBE> lstImagen_ProductoBE { get; set; }
        public List<CategoriaBE> lstCategoriaBE { get; set; }
        public bool Escoger_Color { get; set; }
        public List<ColorBE> lstColorBE { get; set; }
        public string Caracteristica_Tecnica { get; set; }
        public string Youtube { get; set; }
        public string Img_Habilitado { get; set; }
        public string Ruta_Img_Principal { get; set; }
        public ProductoBE()
        {
            lstImagen_ProductoBE = new List<Imagen_ProductoBE>();
            lstCategoriaBE = new List<CategoriaBE>();
            lstColorBE = new List<ColorBE>();
        }
    }
}
