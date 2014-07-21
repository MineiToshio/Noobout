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
    public partial class Usuario : System.Web.UI.Page
    {
        public int idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        if (Request.QueryString["id_usuario"] == null)
                        {
                            ViewState["MODO"] = Modo.Insertar;
                        }
                        else
                        {
                            ViewState["MODO"] = Modo.Editar;
                            ViewState["ID_USUARIO"] = Request.QueryString["id_usuario"];
                            idUsuario = Convert.ToInt32(ViewState["ID_USUARIO"]);
                            MostrarUsuario();
                        }

                        MostrarModo();
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarModo()
        {
            if ((Modo)ViewState["MODO"] == Modo.Insertar)
            {
                divUsuario.Style.Add("display", "");
                divContrasena.Style.Add("display", "");
                divContrasena2.Style.Add("display", "");
            }
            else if ((Modo)ViewState["MODO"] == Modo.Editar)
            {
                divUsuario.Style.Add("display", "none");
                divContrasena.Style.Add("display", "none");
                divContrasena2.Style.Add("display", "none");
            }
        }

        private void MostrarUsuario()
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            UsuarioBE objUsuarioBE = new UsuarioBE();

            try
            {
                objUsuarioBE = objUsuarioBC.Get_Usuario(Convert.ToInt32(ViewState["ID_USUARIO"]));

                txtAccApellidoM.Text = objUsuarioBE.Apellido_Materno;
                txtAccApellidoP.Text = objUsuarioBE.Apellido_Paterno;
                txtAccCelular.Text = objUsuarioBE.Celular;
                txtAccDNI.Text = objUsuarioBE.Dni;
                txtAccEmail.Text = objUsuarioBE.Email;
                txtAccNombre.Text = objUsuarioBE.Nombre;
                txtAccTelefono.Text = objUsuarioBE.Telefono;
                ddlRol.SelectedValue = objUsuarioBE.Id_Rol.ToString();
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
                objUsuarioBE.Apellido_Materno = !String.IsNullOrEmpty(objUsuarioBE.Apellido_Materno.Trim()) ? objUsuarioBE.Apellido_Materno.Trim() : null;
                objUsuarioBE.Celular = !String.IsNullOrEmpty(objUsuarioBE.Celular.Trim()) ? objUsuarioBE.Celular.Trim() : null;
                objUsuarioBE.Telefono = !String.IsNullOrEmpty(objUsuarioBE.Telefono.Trim()) ? objUsuarioBE.Telefono.Trim() : null;
                objUsuarioBE.Token_Correo = RandomString.GenerarRandomString(10);

                codigo = objUsuarioBC.Update_Usuario(objUsuarioBE);

                if (codigo == -2)
                {
                    objUsuarioBE.Activo_Correo = false;
                    objMailBC.Registro_Usuario(objUsuarioBE);
                    HttpContext.Current.Session["USUARIO"] = objUsuarioBE;
                }
                return codigo;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static int RegistrarUsuario(UsuarioBE objUsuarioBE)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            MailBC objMailBC = new MailBC();

            try
            {
                objUsuarioBE.Token_Correo = RandomString.GenerarRandomString(10);

                int id_usuario = objUsuarioBC.Insert_Usuario(objUsuarioBE);

                if (id_usuario > 0)
                    objMailBC.Registro_Usuario(objUsuarioBE);

                return id_usuario;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();
            UsuarioBE objUsuarioBE = new UsuarioBE();

            try
            {
                objUsuarioBE.Nombre = txtAccNombre.Text.Trim();
                objUsuarioBE.Apellido_Paterno = txtAccApellidoP.Text.Trim();
                objUsuarioBE.Apellido_Materno = txtAccApellidoM.Text.Trim();
                objUsuarioBE.Dni = txtAccDNI.Text.Trim();
                objUsuarioBE.Celular = txtAccCelular.Text.Trim();
                objUsuarioBE.Telefono = txtAccTelefono.Text.Trim();
                objUsuarioBE.Email = txtAccEmail.Text.Trim();
                objUsuarioBE.Id_Rol = Convert.ToInt32(ddlRol.SelectedValue);
                objUsuarioBE.Token_Correo = RandomString.GenerarRandomString(10);

                if ((Modo)ViewState["MODO"] == Modo.Insertar)
                {
                    objUsuarioBC.Insert_Usuario(objUsuarioBE);
                }
                else if ((Modo)ViewState["MODO"] == Modo.Editar)
                {
                    objUsuarioBE.Id_Usuario = Convert.ToInt32(ViewState["ID_USUARIO"]);
                    int codigo = objUsuarioBC.Update_Usuario(objUsuarioBE);

                    //switch (codigo)
                    //{
                    //    case -1: Tools.AlertRedirect("Lo sentimos, el correo que ha escogido ya se encuentra en uso.", "Actualizar Datos", "/administrador/usuarios.aspx", GetType(), this);
                    //        break;
                    //    case -2: Tools.AlertRedirect("Ha cambiado su correo. Por favor vuelva a verificar su cuenta.", "Actualizar Datos", "/administrador/usuarios.aspx", GetType(), this);
                    //        break;
                    //    case -3: Tools.AlertRedirect("Sus datos han sido cambiados satisfactoriamente.", "Actualizar Datos", "/administrador/usuarios.aspx", GetType(), this);
                    //        break;
                    //}

                    //Tools.Alert("hola", "cha7", GetType(), this);
                    //ScriptManager.RegisterStartupScript(this, GetType(), "YourUniqueScriptKey", "alert('This pops up');", true);
                    ScriptManager.RegisterStartupScript(this, GetType(), "msg", "MensajeRedirect('Sus datos han sido cambiados satisfactoriamente.', 'Actualizar Datos', '/administrador/usuarios.aspx')", true);
                }

                //Response.Redirect("/administrador/usuarios.aspx");
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}