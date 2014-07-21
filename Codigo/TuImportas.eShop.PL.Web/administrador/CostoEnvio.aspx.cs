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
    public partial class CostoEnvio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {
                    LlenarDepartamentos();
                }
            }
        }

        private void LlenarDepartamentos()
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();

            try
            {
                List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Departamento();

                ddlDepartamento.DataSource = lstUbigeoBE;
                ddlDepartamento.DataValueField = "CodDpto";
                ddlDepartamento.DataTextField = "Nombre";
                ddlDepartamento.DataBind();

                ddlDepartamento.Items.Insert(0, new ListItem("Departamento", "-1"));
                ddlDepartamento.Items[0].Attributes.Add("disabled", "disabled");
                ddlDepartamento.Items[0].Attributes.Add("selected", "selected");
                ddlDepartamento.Items[0].Attributes.Add("style", "display:none;");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void ddlDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                LlenarProvincia();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void LlenarProvincia()
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();

            try
            {
                List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Provincia(ddlDepartamento.SelectedValue);

                ddlProvincia.DataSource = lstUbigeoBE;
                ddlProvincia.DataValueField = "CodProv";
                ddlProvincia.DataTextField = "Nombre";
                ddlProvincia.DataBind();

                ddlProvincia.Items.Insert(0, new ListItem("Provincia", "-1"));
                ddlProvincia.Items[0].Attributes.Add("disabled", "disabled");
                ddlProvincia.Items[0].Attributes.Add("selected", "selected");
                ddlProvincia.Items[0].Attributes.Add("style", "display:none;");
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvDistrito_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Editar

                if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvDistrito.EditIndex = gvRow.RowIndex;
                    LlenarDistritos();
                }

                #endregion

                #region Cancelar

                if (e.CommandName.Equals("Cancelar"))
                {
                    gvDistrito.EditIndex = -1;
                    LlenarDistritos();
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtPrecio = (TextBox)gvRow.FindControl("txtPrecio");

                    UbigeoBE objUbigeoBE = new UbigeoBE();

                    objUbigeoBE.CodDpto = ddlDepartamento.SelectedValue;
                    objUbigeoBE.CodProv = ddlProvincia.SelectedValue;
                    objUbigeoBE.CodDist = e.CommandArgument.ToString();
                    objUbigeoBE.Nombre = txtPrecio.Text;

                    UbigeoBC objUbigeoBC = new UbigeoBC();
                    objUbigeoBC.Update_Ubigeo_Precio(objUbigeoBE);

                    gvDistrito.EditIndex = -1;
                    LlenarDistritos();

                    Tools.Unload(GetType(), this);
                }

                #endregion
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            LlenarDistritos();
        }

        private void LlenarDistritos()
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();

            try
            {
                List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Distrito(ddlDepartamento.SelectedValue, ddlProvincia.SelectedValue);

                gvDistrito.DataSource = lstUbigeoBE;
                gvDistrito.DataBind();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}