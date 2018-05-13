using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web
{
    public partial class Activar : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    string usuario = RouteData.Values["Usuario"].ToString();
                    string tokenCorreo = RouteData.Values["TokenCorreo"].ToString();

                    UsuarioBC objUsuarioBC = new UsuarioBC();
                    UsuarioBE objUsuarioBE = new UsuarioBE();

                    objUsuarioBE.Usuario = usuario;
                    objUsuarioBE.Token_Correo = tokenCorreo;

                    objUsuarioBE = objUsuarioBC.Usuario_Activar(objUsuarioBE);

                    if (objUsuarioBE == null)
                    {
                        lblMensaje.Text = "El código que ha ingresado es inválido";
                    }
                    else
                    {
                        eshop masterPage = (eshop)Page.Master;
                        masterPage.Loguear(objUsuarioBE);

                        lblMensaje.Text = "Su cuenta ha sido activada satisfactoriamente";
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}