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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarUsuariosTodos();
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarUsuarios()
        {
            try
            {
                gvUsuarios.DataSource = ViewState["USUARIOS"];
                gvUsuarios.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarUsuariosTodos()
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                ViewState["USUARIOS"] = objUsuarioBC.Select_Usuario();
                LlenarUsuarios();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Habilitado"))
            {
                UsuarioBC objUsuarioBC = new UsuarioBC();

                objUsuarioBC.Update_Activo_Usuario(Convert.ToInt32(e.CommandArgument));

                LlenarUsuarios();
            }
            else if (e.CommandName.Equals("Edicion"))
            {
                Response.Redirect("/administrador/usuario.aspx?id_usuario=" + e.CommandArgument);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsuarioBE objUsuarioBE = new UsuarioBE();
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                objUsuarioBE.Usuario = txtUsuarioBuscar.Text.Trim();
                objUsuarioBE.Nombre = txtUsuarioNombreBuscar.Text.Trim();
                objUsuarioBE.Apellido_Paterno = txtUsuarioApellidoPBuscar.Text.Trim();
                objUsuarioBE.Apellido_Materno = txtUsuarioApellidoMBuscar.Text.Trim();
                objUsuarioBE.Email = txtUsuarioEMailBuscar.Text.Trim();
                objUsuarioBE.Dni = txtUsuarioDniBuscar.Text.Trim();

                switch (ddlActivoBuscar.SelectedValue)
                {
                    case "0": objUsuarioBE.Activo = false; break;
                    case "1": objUsuarioBE.Activo = true; break;
                    default: objUsuarioBE.Activo = null; break;
                }

                ViewState["USUARIOS"] = objUsuarioBC.Get_Usuario_Buscar(objUsuarioBE);
                LlenarUsuarios();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}