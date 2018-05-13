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
    public partial class Atributos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarAtributos();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarAtributos()
        {
            AtributoBC objAtributoBC = new AtributoBC();
            List<AtributoBE> lstAtributoBE = new List<AtributoBE>();

            try
            {
                lstAtributoBE = objAtributoBC.Select_Atributo();

                if (lstAtributoBE != null)
                {
                    gvAtributos.DataSource = lstAtributoBE;
                    gvAtributos.DataBind();
                }
                else
                {
                    lstAtributoBE = new List<AtributoBE>();
                    lstAtributoBE.Add(new AtributoBE());
                    gvAtributos.DataSource = lstAtributoBE;
                    gvAtributos.DataBind();
                    int TotalColumns = gvAtributos.Rows[0].Cells.Count;
                    gvAtributos.Rows[0].Cells.Clear();
                    gvAtributos.Rows[0].Cells.Add(new TableCell());
                    gvAtributos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Left;
                    gvAtributos.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    gvAtributos.Rows[0].Cells[0].Text = "<center>[No se encontraron atributos]</center>";
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void gvAtributos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Nuevo

                if (e.CommandName.Equals("Nuevo"))
                {
                    TextBox txtNewNombre = (TextBox)gvAtributos.FooterRow.FindControl("txtNewNombre");
                    TextBox txtNewDescripcion = (TextBox)gvAtributos.FooterRow.FindControl("txtNewDescripcion");

                    AtributoBE objAtributoBE = new AtributoBE();

                    objAtributoBE.Nombre = txtNewNombre.Text;
                    objAtributoBE.Descripcion = txtNewDescripcion.Text;

                    AtributoBC objAtributoBC = new AtributoBC();
                    objAtributoBC.Insert_Atributo(objAtributoBE);

                    LlenarAtributos();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Editar

                else if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvAtributos.EditIndex = gvRow.RowIndex;
                    LlenarAtributos();
                }

                #endregion

                #region Cancelar

                else if (e.CommandName.Equals("Cancelar"))
                {
                    gvAtributos.EditIndex = -1;
                    LlenarAtributos();
                }

                #endregion

                #region Actualizar

                else if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");
                    TextBox txtDescripcion = (TextBox)gvRow.FindControl("txtDescripcion");

                    AtributoBE objAtributoBE = new AtributoBE();

                    objAtributoBE.Id_Atributo = Convert.ToInt32(e.CommandArgument);
                    objAtributoBE.Nombre = txtNombre.Text;
                    objAtributoBE.Descripcion = txtDescripcion.Text;

                    AtributoBC objAtributoBC = new AtributoBC();
                    objAtributoBC.Update_Atributo(objAtributoBE);

                    gvAtributos.EditIndex = -1;
                    LlenarAtributos();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Eliminar

                else if (e.CommandName.Equals("Eliminar"))
                {
                    AtributoBC objAtributoBC = new AtributoBC();

                    objAtributoBC.Delete_Atributo(Convert.ToInt32(e.CommandArgument));
                    LlenarAtributos();

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