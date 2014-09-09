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
    public partial class Elemento_Atributo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        ViewState["ID_ATRIBUTO"] = Request.QueryString["id"];
                        LlenarElementos();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarElementos()
        {
            try
            {
                Elemento_AtributoBC objElemento_AtributoBC = new Elemento_AtributoBC();
                List<Elemento_AtributoBE> lstElemento_AtributoBE = new List<Elemento_AtributoBE>();

                try
                {
                    lstElemento_AtributoBE = objElemento_AtributoBC.Get_Elemento_Atributo_Atributo(Convert.ToInt32(ViewState["ID_ATRIBUTO"]));

                    if (lstElemento_AtributoBE != null)
                    {
                        gvElementos.DataSource = lstElemento_AtributoBE;
                        gvElementos.DataBind();
                    }
                    else
                    {
                        lstElemento_AtributoBE = new List<Elemento_AtributoBE>();
                        lstElemento_AtributoBE.Add(new Elemento_AtributoBE());
                        gvElementos.DataSource = lstElemento_AtributoBE;
                        gvElementos.DataBind();
                        int TotalColumns = gvElementos.Rows[0].Cells.Count;
                        gvElementos.Rows[0].Cells.Clear();
                        gvElementos.Rows[0].Cells.Add(new TableCell());
                        gvElementos.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Left;
                        gvElementos.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                        gvElementos.Rows[0].Cells[0].Text = "<center>[No se encontraron elementos]</center>";
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void gvElementos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Nuevo

                if (e.CommandName.Equals("Nuevo"))
                {
                    TextBox txtNewNombre = (TextBox)gvElementos.FooterRow.FindControl("txtNewNombre");

                    Elemento_AtributoBE objElemento_AtributoBE = new Elemento_AtributoBE();

                    objElemento_AtributoBE.Nombre = txtNewNombre.Text;
                    objElemento_AtributoBE.Id_Atributo = Convert.ToInt32(ViewState["ID_ATRIBUTO"]);

                    Elemento_AtributoBC objElemento_AtributoBC = new Elemento_AtributoBC();
                    objElemento_AtributoBC.Insert_Elemento_Atributo(objElemento_AtributoBE);

                    LlenarElementos();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Editar

                else if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvElementos.EditIndex = gvRow.RowIndex;
                    LlenarElementos();
                }

                #endregion

                #region Cancelar

                else if (e.CommandName.Equals("Cancelar"))
                {
                    gvElementos.EditIndex = -1;
                    LlenarElementos();
                }

                #endregion

                #region Actualizar

                else if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");

                    Elemento_AtributoBE objElemento_AtributoBE = new Elemento_AtributoBE();

                    objElemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(e.CommandArgument);
                    objElemento_AtributoBE.Nombre = txtNombre.Text;
                    objElemento_AtributoBE.Id_Atributo = Convert.ToInt32(ViewState["ID_ATRIBUTO"]);

                    Elemento_AtributoBC objElemento_AtributoBC = new Elemento_AtributoBC();
                    objElemento_AtributoBC.Update_Elemento_Atributo(objElemento_AtributoBE);

                    gvElementos.EditIndex = -1;
                    LlenarElementos();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Eliminar

                else if (e.CommandName.Equals("Eliminar"))
                {
                    Elemento_AtributoBC objElemento_AtributoBC = new Elemento_AtributoBC();

                    objElemento_AtributoBC.Delete_Elemento_Atributo(Convert.ToInt32(e.CommandArgument));
                    LlenarElementos();

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