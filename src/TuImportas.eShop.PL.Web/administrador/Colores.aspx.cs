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
    public partial class Colores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {
                    LlenarColor();
                }
            }
        }

        private void LlenarColor()
        {
            List<ColorBE> lstColorBE = null;
            ColorBC objColorBC = new ColorBC();

            try
            {
                lstColorBE = objColorBC.Select_Color();

                if (lstColorBE != null)
                {
                    gvColores.DataSource = lstColorBE;
                    gvColores.DataBind();
                }
                else
                {
                    lstColorBE = new List<ColorBE>();
                    lstColorBE.Add(new ColorBE());
                    gvColores.DataSource = lstColorBE;
                    gvColores.DataBind();
                    int TotalColumns = gvColores.Rows[0].Cells.Count;
                    gvColores.Rows[0].Cells.Clear();
                    gvColores.Rows[0].Cells.Add(new TableCell());
                    gvColores.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Left;
                    gvColores.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    gvColores.Rows[0].Cells[0].Text = "[No se encontraron colores]";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvColores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Nuevo

                if (e.CommandName.Equals("Nuevo"))
                {
                    TextBox txtNewNombre = (TextBox)gvColores.FooterRow.FindControl("txtNewNombre");

                    ColorBE objColorBE = new ColorBE();

                    objColorBE.Nombre = txtNewNombre.Text;

                    ColorBC objColorBC = new ColorBC();
                    objColorBC.Insert_Color(objColorBE);

                    LlenarColor();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Editar

                if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvColores.EditIndex = gvRow.RowIndex;
                    LlenarColor();
                }

                #endregion

                #region Cancelar

                if (e.CommandName.Equals("Cancelar"))
                {
                    gvColores.EditIndex = -1;
                    LlenarColor();
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");

                    ColorBE objColorBE = new ColorBE();

                    objColorBE.Id_Color = Convert.ToInt32(e.CommandArgument);
                    objColorBE.Nombre = txtNombre.Text;

                    ColorBC objColorBC = new ColorBC();
                    objColorBC.Update_Color(objColorBE);

                    gvColores.EditIndex = -1;
                    LlenarColor();

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