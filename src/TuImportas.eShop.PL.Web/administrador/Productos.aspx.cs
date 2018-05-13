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
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarProductosTodos();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
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
            try
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
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void gvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                gvProductos.PageIndex = e.NewPageIndex;
                LlenarProductos();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProductoBC objProductoBC = new ProductoBC();
            bool? activo;

            try
            {
                switch (ddlActivoBuscar.SelectedValue)
                {
                    case "0": activo = false; break;
                    case "1": activo = true; break;
                    default: activo = null; break;
                }

                ViewState["PRODUCTOS"] = objProductoBC.Get_Producto_Buscar(txtNombreBuscar.Text.Trim(), activo);
                LlenarProductos();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void gvProductos_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                Admin masterPage = (Admin)Page.Master;
                ViewState["PRODUCTOS"] = masterPage.SortGrid<ProductoBE>(gvProductos, e.SortExpression, (List<ProductoBE>)ViewState["PRODUCTOS"]);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}