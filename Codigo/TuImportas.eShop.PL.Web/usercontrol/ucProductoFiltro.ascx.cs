using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web.usercontrol
{
    public partial class ucProductoFiltro : System.Web.UI.UserControl
    {
        const string PATH_IMG_PROD = "/images/productos/";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void SetParametros(ProductoBE objProductoBE)
        {
            try
            {
                //imgProducto.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[0].Nombre;
                lblVerMas.Text = "<a ID=\"lnkVerMas\" class=\"btn more btn-primary\" href=\"/Producto/" + objProductoBE.Id_Producto + "\">ver más</a>";
                hdIdProducto.Value = objProductoBE.Id_Producto.ToString();
                lblPrecio.Text = objProductoBE.Precio.ToString();
                lblNombre.Text = objProductoBE.Nombre;
                pnlImagen.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[0].Nombre + "')");

                TimeSpan diaCreacion = new TimeSpan();
                diaCreacion = HelperTools.GetDate() - objProductoBE.Fecha_Creacion;

                if (diaCreacion.Days < 15)
                    pnlNuevo.Visible = true;

                pnlProducto.Attributes.Add("data-price", objProductoBE.Precio.ToString());

                String color = "";

                foreach (ColorBE c in objProductoBE.lstColorBE)
                    color += c.Nombre + "|";

                color = color.Remove(color.Length - 1);

                pnlProducto.Attributes.Add("data-color", color);
                pnlProducto.Attributes.Add("data-popularity", objProductoBE.Cantidad_Vendidos.ToString());

                String categoria = "";

                foreach (CategoriaBE c in objProductoBE.lstCategoriaBE)
                    categoria += " filter--" + c.Id_Categoria;

                pnlProducto.CssClass = "span3 isotope--target" + categoria;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void lnkAnadir_Click(object sender, EventArgs e)
        {
            try
            {
                if (Tools.AñadirCarrito(Convert.ToInt32(hdIdProducto.Value), 1, null))
                {
                    eshop masterPage = (eshop)Page.Master;
                    masterPage.CargarItemsCarrito();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}