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

namespace TuImportas.eShop.PL.Web
{
    public partial class Contacto : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    TraerDatos();
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void TraerDatos()
        {
            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                if (objUsuarioBE != null)
                {
                    txtEmail.Text = objUsuarioBE.Email;
                    txtNombre.Text = objUsuarioBE.Nombre;
                    txtApellido.Text = objUsuarioBE.Apellido_Paterno + (String.IsNullOrEmpty(objUsuarioBE.Apellido_Materno) ? "" : " " + objUsuarioBE.Apellido_Materno);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            MensajeBE objMensajeBE = new MensajeBE();
            MailBC objMailBC = new MailBC();

            try
            {
                objMensajeBE.Correo = txtEmail.Text.Trim();
                objMensajeBE.Mensaje = txtMensaje.Text.Trim();
                objMensajeBE.Nombre = txtNombre.Text.Trim();
                objMensajeBE.Apellido = txtApellido.Text.Trim();
                objMensajeBE.Telefono = txtTelefono.Text.Trim();
                objMensajeBE.ComoAyudar = ddlComoAyudar.SelectedItem.Text;

                objMailBC.Contacto(objMensajeBE);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        [WebMethod]
        public static void Enviar(MensajeBE objMensajeBE)
        {
            MailBC objMailBC = new MailBC();

            try
            {
                objMailBC.Contacto(objMensajeBE);
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}