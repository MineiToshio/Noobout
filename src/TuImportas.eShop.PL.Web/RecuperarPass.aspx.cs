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
    public partial class RecuperarPass : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    hdUsuario.Value = RouteData.Values["Usuario"].ToString();
                    hdTokenRecuperar.Value = RouteData.Values["TokenRecuperar"].ToString();

                    ValidarAcceso();
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void ValidarAcceso()
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            UsuarioBE objUsuarioBE = new UsuarioBE();

            try
            {
                objUsuarioBE.Usuario = hdUsuario.Value;
                objUsuarioBE.Token_Recuperacion = hdTokenRecuperar.Value;

                if (objUsuarioBC.Validar_Recuperar_Pass(objUsuarioBE) == 0)
                    Tools.AlertRedirect("Lo sentimos, la página a la cual ha ingresado no se encuentra disponible.", "Recuperar Contraseña", "/inicio", GetType(), this);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        [WebMethod]
        public static void Guardar(UsuarioBE objUsuarioBE)
        {
            try
            {
                UsuarioBC objUsuarioBC = new UsuarioBC();

                objUsuarioBC.Recuperar_Password(objUsuarioBE);
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}