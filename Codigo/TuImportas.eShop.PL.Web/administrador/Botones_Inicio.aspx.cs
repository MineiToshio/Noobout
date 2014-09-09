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
    public partial class Botones_Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarBotones();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarBotones()
        {
            Boton_InicioBC objBoton_InicioBC = new Boton_InicioBC();

            try
            {
                gvBotonesInicio.DataSource = objBoton_InicioBC.Select_Boton_Inicio();
                gvBotonesInicio.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void gvBotonesInicio_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Editar

                if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvBotonesInicio.EditIndex = gvRow.RowIndex;
                    LlenarBotones();
                }

                #endregion

                #region Cancelar

                if (e.CommandName.Equals("Cancelar"))
                {
                    gvBotonesInicio.EditIndex = -1;
                    LlenarBotones();
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");
                    TextBox txtDescripcion = (TextBox)gvRow.FindControl("txtDescripcion");
                    TextBox txtUrl = (TextBox)gvRow.FindControl("txtUrl");

                    Boton_InicioBE objBoton_InicioBE = new Boton_InicioBE();

                    objBoton_InicioBE.Id_Boton_Inicio = Convert.ToInt32(e.CommandArgument);
                    objBoton_InicioBE.Nombre = txtNombre.Text;
                    objBoton_InicioBE.Descripcion = txtDescripcion.Text;
                    objBoton_InicioBE.Url = txtUrl.Text;

                    Boton_InicioBC objBoton_InicioBC = new Boton_InicioBC();
                    objBoton_InicioBC.Update_Boton_Inicio(objBoton_InicioBE);

                    gvBotonesInicio.EditIndex = -1;
                    LlenarBotones();

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