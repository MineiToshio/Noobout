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
    public partial class Contrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                { }
            }
        }

        [WebMethod]
        public static int CambiarContrasena(string contrasenaAntigua, string contrasenaNueva)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            int codigo = 0;

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];
                codigo = objUsuarioBC.Update_Password_Usuario(objUsuarioBE.Id_Usuario, contrasenaAntigua, contrasenaNueva);

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