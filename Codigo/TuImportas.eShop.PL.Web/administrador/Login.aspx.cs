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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static int Ingresar(String usuario, String password)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            UsuarioBE objUsuarioBE = new UsuarioBE();

            try
            {
                objUsuarioBE.Usuario = usuario;
                objUsuarioBE.Password = password;

                objUsuarioBE = objUsuarioBC.Login(objUsuarioBE);

                if (objUsuarioBE != null)
                {
                    if (objUsuarioBE.Id_Rol == (int)Rol.Admin)
                    {
                        HttpContext.Current.Session["USUARIO"] = objUsuarioBE;
                        return 1;
                    }
                }

                return 0;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw ex;
            }
        }

        [WebMethod]
        public static int Recuperar_Datos(string email)
        {
            MailBC objMailBC = new MailBC();
            UsuarioBC objUsuarioBC = new UsuarioBC();
            UsuarioBE objUsuarioBE = new UsuarioBE();

            try
            {
                objUsuarioBE.Token_Recuperacion = RandomString.GenerarRandomString(10);
                objUsuarioBE.Email = email;

                objUsuarioBE = objUsuarioBC.Update_Usuario_Recuperar_Pass(objUsuarioBE);

                if (objUsuarioBE != null)
                {
                    objMailBC.Olvido_Datos(objUsuarioBE);
                    return 1;
                }
                else
                {
                    return -1;
                }
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}