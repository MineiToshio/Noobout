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
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {
                    LlenarCategoria();
                }
            }
        }

        private void LlenarCategoria()
        {
            List<CategoriaBE> lstCategoriaBE = null;
            CategoriaBC objCategoriaBC = new CategoriaBC();

            try
            {
                lstCategoriaBE = objCategoriaBC.Select_Categoria();

                if (lstCategoriaBE != null)
                {
                    gvCategorias.DataSource = lstCategoriaBE;
                    gvCategorias.DataBind();
                }
                else
                {
                    lstCategoriaBE = new List<CategoriaBE>();
                    lstCategoriaBE.Add(new CategoriaBE());
                    gvCategorias.DataSource = lstCategoriaBE;
                    gvCategorias.DataBind();
                    int TotalColumns = gvCategorias.Rows[0].Cells.Count;
                    gvCategorias.Rows[0].Cells.Clear();
                    gvCategorias.Rows[0].Cells.Add(new TableCell());
                    gvCategorias.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Left;
                    gvCategorias.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    gvCategorias.Rows[0].Cells[0].Text = "[No se encontraron colores]";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Nuevo

                if (e.CommandName.Equals("Nuevo"))
                {
                    TextBox txtNewNombre = (TextBox)gvCategorias.FooterRow.FindControl("txtNewNombre");

                    CategoriaBE objCategoriaBE = new CategoriaBE();

                    objCategoriaBE.Nombre = txtNewNombre.Text;

                    CategoriaBC objCategoriaBC = new CategoriaBC();
                    objCategoriaBC.Insert_Categoria(objCategoriaBE);

                    LlenarCategoria();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Editar

                if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvCategorias.EditIndex = gvRow.RowIndex;
                    LlenarCategoria();
                }

                #endregion

                #region Cancelar

                if (e.CommandName.Equals("Cancelar"))
                {
                    gvCategorias.EditIndex = -1;
                    LlenarCategoria();
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");

                    CategoriaBE objCategoriaBE = new CategoriaBE();

                    objCategoriaBE.Id_Categoria = Convert.ToInt32(e.CommandArgument);
                    objCategoriaBE.Nombre = txtNombre.Text;

                    CategoriaBC objCategoriaBC = new CategoriaBC();
                    objCategoriaBC.Update_Categoria(objCategoriaBE);

                    gvCategorias.EditIndex = -1;
                    LlenarCategoria();

                    Tools.Unload(GetType(), this);
                }

                #endregion
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}