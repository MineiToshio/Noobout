using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {
                    LlenarProductos();
                }
            }
        }

        private void LlenarProductos()
        {
            ProductoBC objProductoBC = new ProductoBC();

            try
            {
                gvProductos.DataSource = objProductoBC.Select_Producto();
                gvProductos.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Habilitado"))
            {
                ProductoBC objProductoBC = new ProductoBC();

                objProductoBC.Update_Producto_Activo(Convert.ToInt32(e.CommandArgument));

                LlenarProductos();
            }
            else if (e.CommandName.Equals("Edicion"))
            {
                Response.Redirect("/administrador/producto.aspx?id_producto=" + e.CommandArgument);
            }
        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvProductos.PageIndex = e.NewPageIndex;
            LlenarProductos();
        }
    }
}