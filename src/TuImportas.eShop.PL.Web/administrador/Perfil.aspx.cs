using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarDatosUsuario();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarDatosUsuario()
        {
            try
            {
                if (Tools.EstaLogueado())
                {
                    UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                    txtAccApellidoM.Text = objUsuarioBE.Apellido_Materno;
                    txtAccApellidoP.Text = objUsuarioBE.Apellido_Paterno;
                    txtAccCelular.Text = objUsuarioBE.Celular;
                    txtAccDNI.Text = objUsuarioBE.Dni;
                    txtAccEmail.Text = objUsuarioBE.Email;
                    txtAccNombre.Text = objUsuarioBE.Nombre;
                    txtAccTelefono.Text = objUsuarioBE.Telefono;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        [WebMethod]
        public static int ActualizarDatos(UsuarioBE objUsuarioBE)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            MailBC objMailBC = new MailBC();
            int codigo = 0;

            try
            {
                UsuarioBE objUsuarioSesionBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];

                objUsuarioSesionBE.Nombre = objUsuarioBE.Nombre;
                objUsuarioSesionBE.Apellido_Paterno = objUsuarioBE.Apellido_Paterno;
                objUsuarioSesionBE.Apellido_Materno = !String.IsNullOrEmpty(objUsuarioBE.Apellido_Materno.Trim()) ? objUsuarioBE.Apellido_Materno.Trim() : null;
                objUsuarioSesionBE.Dni = objUsuarioBE.Dni;
                objUsuarioSesionBE.Celular = !String.IsNullOrEmpty(objUsuarioBE.Celular.Trim()) ? objUsuarioBE.Celular.Trim() : null;
                objUsuarioSesionBE.Telefono = !String.IsNullOrEmpty(objUsuarioBE.Telefono.Trim()) ? objUsuarioBE.Telefono.Trim() : null;
                objUsuarioSesionBE.Email = objUsuarioBE.Email;
                objUsuarioSesionBE.Token_Correo = RandomString.GenerarRandomString(10);

                codigo = objUsuarioBC.Update_Usuario(objUsuarioSesionBE);

                if (codigo == -2)
                {
                    objUsuarioSesionBE.Activo_Correo = false;
                    objMailBC.Registro_Usuario(objUsuarioSesionBE);
                    HttpContext.Current.Session["USUARIO"] = objUsuarioSesionBE;
                }
                return codigo;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}