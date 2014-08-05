using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

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
                    LlenarProductosTodos();
                }
            }
        }

        private void LlenarProductos()
        {
            ProductoBC objProductoBC = new ProductoBC();

            try
            {
                gvProductos.DataSource = ViewState["PRODUCTOS"];
                gvProductos.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarProductosTodos()
        { 
            ProductoBC objProductoBC = new ProductoBC();

            try
            {
                ViewState["PRODUCTOS"] = objProductoBC.Select_Producto();
                LlenarProductos();
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

                List<ProductoBE> lstProductoBE = (List<ProductoBE>)ViewState["PRODUCTOS"];

                for (int i = 0; i < lstProductoBE.Count; i++)
                {
                    if (lstProductoBE[i].Id_Producto == Convert.ToInt32(e.CommandArgument))
                    {
                        lstProductoBE[i].Activo = !lstProductoBE[i].Activo;
                        lstProductoBE[i].Img_Habilitado = "/images/" + (lstProductoBE[i].Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                        break;
                    }
                }

                ViewState["PRODUCTOS"] = lstProductoBE;

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

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProductoBC objProductoBC = new ProductoBC();

            bool? activo;

            switch (ddlActivoBuscar.SelectedValue)
            {
                case "0": activo = false; break;
                case "1": activo = true; break;
                default: activo = null; break;
            }

            ViewState["PRODUCTOS"] = objProductoBC.Get_Producto_Buscar(txtNombreBuscar.Text.Trim(), activo);
            LlenarProductos();
        }

        protected void gvProductos_Sorting(object sender, GridViewSortEventArgs e)
        {
            Admin masterPage = (Admin)Page.Master;
            ViewState["PRODUCTOS"] = masterPage.SortGrid<ProductoBE>(gvProductos, e.SortExpression, (List<ProductoBE>)ViewState["PRODUCTOS"]);
        }
    }
}