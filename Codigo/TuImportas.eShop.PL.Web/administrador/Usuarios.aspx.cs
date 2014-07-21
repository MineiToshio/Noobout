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
                        LlenarUsuarios();
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
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                gvUsuarios.DataSource = objUsuarioBC.Select_Usuario();
                gvUsuarios.DataBind();
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
    }
}