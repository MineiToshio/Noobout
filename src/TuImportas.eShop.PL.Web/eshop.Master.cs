using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;
using TuImportas.eShop.PL.Web.usercontrol;

namespace TuImportas.eShop.PL.Web
{
    public partial class eshop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    Llenar_Categorias();

                    if (Session["USUARIO"] != null)
                    {
                        UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                        lblUsuario.Text = objUsuarioBE.Usuario;
                        MostrarUsuarioLogueado(true);

                        if (objUsuarioBE.Activo_Correo)
                            hdVerifico.Value = "1";
                        else
                            hdVerifico.Value = "0";
                    }
                    else
                    {
                        MostrarUsuarioLogueado(false);

                        if (Session["CARRITO"] == null)
                            Session["CARRITO"] = new CarritoBE();

                        hdVerifico.Value = "1";
                    }
                }

                CargarItemsCarrito();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void Llenar_Categorias()
        {
            CategoriaBC objCategoriaBC = new CategoriaBC();
            string textoCategoria = "";
            string textoMenuCategoria = "";

            try
            {
                List<CategoriaBE> lstCategoriaBE = objCategoriaBC.Select_Categoria();

                foreach (CategoriaBE c in lstCategoriaBE)
                {
                    textoCategoria += "<li><a href='/Categoria/" + c.Id_Categoria + "'>" + c.Nombre.ToUpper() + "</a></li>";
                    textoMenuCategoria += "<li id=\"liMenu" + c.Id_Categoria + "\"><a href=\"/Categoria/" + c.Id_Categoria + "\">" + c.Nombre.ToUpper() + "</a></li>";
                }

                lMenuTienda.Text = textoMenuCategoria;

                textoCategoria += "<li><a href='/Nosotros'>NOSOTROS</a></li>";

                ulMapaSitio.InnerHtml = textoCategoria;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //Dropdown
        //private void Llenar_Categorias()
        //{
        //    CategoriaBC objCategoriaBC = new CategoriaBC();
        //    string textoCategoria = "";

        //    try
        //    {
        //        List<CategoriaBE> lstCategoriaBE = objCategoriaBC.Select_Categoria();

        //        foreach (CategoriaBE c in lstCategoriaBE)
        //        {
        //            textoCategoria += "<li><a href='/Categoria/" + c.Id_Categoria + "'>" + c.Nombre.ToUpper() + "</a></li>";
        //        }

        //        ulCategoria.InnerHtml = textoCategoria;

        //        textoCategoria += "<li><a href='/Nosotros'>NOSOTROS</a></li>";

        //        ulMapaSitio.InnerHtml = textoCategoria;
        //    }
        //    catch (Exception)
        //    {
                
        //        throw;
        //    }
        //}

        //Grande
        //private void Llenar_Categorias()
        //{
        //    CategoriaBC objCategoriaBC = new CategoriaBC();

        //    try
        //    {
        //        List<CategoriaBE> lstCategoriaBE = objCategoriaBC.Select_Categoria();

        //        int cantidad = 0; //Max 10
        //        int subcategoria = 0;
        //        String textoCategoria = "";
        //        bool termino = false;

        //        for (int i = 0; i < lstCategoriaBE.Count; i++)
        //        {
        //            if (cantidad == 0)
        //            {
        //                textoCategoria += "<div class=\"span2\">";
        //                termino = false;
        //            }

        //            if (lstCategoriaBE[i].Id_Padre == null)
        //            {
        //                subcategoria = 0;

        //                textoCategoria += "<ul class=\"nav nav-pills nav-stacked\"><li><a href=\"/Categoria/" + lstCategoriaBE[i].Id_Categoria + "\">" + lstCategoriaBE[i].Nombre + "</a></li></ul>";
        //                cantidad++;

        //                for (int j = 0; j < lstCategoriaBE.Count; j++)
        //                {
        //                    if (lstCategoriaBE[j].Id_Padre == lstCategoriaBE[i].Id_Categoria)
        //                    {
        //                        if (subcategoria == 0)
        //                            textoCategoria += "<ul class=\"nav unstyled\">";

        //                        textoCategoria += "<li><a href=\"/Categoria/" + lstCategoriaBE[j].Id_Categoria + "\">" + lstCategoriaBE[j].Nombre + "</a></li>";
        //                        cantidad++;

        //                        if (j == lstCategoriaBE.Count - 1 || lstCategoriaBE[j].Id_Padre != lstCategoriaBE[j + 1].Id_Padre)
        //                        {
        //                            textoCategoria += "</ul>";
        //                            break;
        //                        }
        //                    }
        //                }

        //                if (cantidad > 8 && i != lstCategoriaBE.Count - 1)
        //                {
        //                    cantidad = 0;
        //                    textoCategoria += "</div>";
        //                    termino = true;
        //                }
        //            }
        //            else
        //                break;
        //        }

        //        if (!termino)
        //            textoCategoria += "</div>";

        //        lblCategorias.Text = textoCategoria;
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        private int RegistrarUsuario(UsuarioBE objUsuarioBE)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                int id_usuario = objUsuarioBC.Insert_Usuario(objUsuarioBE);
                return id_usuario;
            }
            catch (Exception)
            {
                throw;
            }
        }

        //protected void btnRegistrarse_Click(object sender, EventArgs e)
        //{
        //    UsuarioBE objUsuarioBE = new UsuarioBE();
        //    MailBC objMailBC = new MailBC();

        //    try
        //    {
        //        objUsuarioBE.Nombre = txtRegistroNombre.Text.Trim();
        //        objUsuarioBE.Apellido_Paterno = txtRegistroApellidoP.Text.Trim();
        //        objUsuarioBE.Dni = txtRegistroDNI.Text.Trim();
        //        objUsuarioBE.Usuario = txtRegistroUsuario.Text.Trim();
        //        objUsuarioBE.Email = txtRegistroEmail.Text.Trim();
        //        objUsuarioBE.Password = txtRegistroContrasena.Text.Trim();
        //        objUsuarioBE.Token_Correo = RandomString.GenerarRandomString(10);
        //        objUsuarioBE.Id_Rol = (int)Rol.Usuario;

        //        int codigo = RegistrarUsuario(objUsuarioBE);

        //        switch (codigo)
        //        { 
        //            case (int)ErrorRegistroUsuario.Usuario_Repetido:
        //                Tools.Alert("Lo sentimos, el usuario que ha escogido ya se encuentra registrado.", "Usuario Repetido", GetType(), this);
        //                break;
        //            case (int)ErrorRegistroUsuario.Email_Repetido:
        //                Tools.Alert("Lo sentimos, el email que ha escogido ya se encuentra registrado.", "Email Repetido", GetType(), this);
        //                break;
        //            case (int)ErrorRegistroUsuario.Dni_Repetido:
        //                Tools.Alert("Lo sentimos, el DNI que ha escogido ya se encuentra registrado.", "DNI Repetido", GetType(), this);
        //                break;
        //            default:
        //                objMailBC.Registro_Usuario(objUsuarioBE);
        //                break;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //        throw;
        //    }
        //}

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            UsuarioBE objUsuarioBE = new UsuarioBE();
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                objUsuarioBE.Usuario = txtLoginUsuario.Text.Trim();
                objUsuarioBE.Password = txtLoginContrasena.Text;

                objUsuarioBE = objUsuarioBC.Login(objUsuarioBE);

                if (objUsuarioBE != null) //Logueo correcto
                {
                    Loguear(objUsuarioBE);
                }
                else
                    Tools.Alert("Lo sentimos, el usuario o contraseña es inválido.", "Datos Incorrectos", GetType(), this);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        public void Loguear(UsuarioBE objUsuarioBE)
        {
            try
            {
                Session["USUARIO"] = objUsuarioBE;
                lblUsuario.Text = objUsuarioBE.Usuario;
                MostrarUsuarioLogueado(true);
                //FormsAuthentication.Initialize();

                CarritoBC objCarritoBC = new CarritoBC();
                CarritoBE objCarritoBE = objCarritoBC.Get_Carrito_Usuario(objUsuarioBE.Id_Usuario);

                if (Session["CARRITO"] == null || ((CarritoBE)Session["CARRITO"]).lstCarrito_ProductoBE.Count == 0)
                {
                    Session["CARRITO"] = objCarritoBE != null ? objCarritoBE : new CarritoBE();
                }
                else //Hace un merge
                {
                    CarritoBE objCarritoSessionBE = (CarritoBE)Session["CARRITO"];
                    Carrito_ProductoBC objCarrito_ProductoBC = new Carrito_ProductoBC();

                    if (objCarritoBE == null) //Si el usuario no tiene productos en el carrito
                    {
                        objCarritoBE = new CarritoBE();
                        objCarritoBE.Id_Usuario = objUsuarioBE.Id_Usuario;
                        objCarritoBE.Id_Carrito = objCarritoBC.Insert_Carrito(objCarritoBE);
                    }

                    //Se obtiene una lista de los productos en sesion que no han sido agregados a BD
                    foreach (Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                    {
                        if (cp.lstCarrito_Producto_Elemento_AtributoBE.Count == 0) //Si no tiene atributos
                        {
                            objCarritoSessionBE.lstCarrito_ProductoBE = (from c in objCarritoSessionBE.lstCarrito_ProductoBE
                                                                         where c.Id_Producto != cp.Id_Producto
                                                                         select c).ToList();
                        }
                        else
                        {
                            foreach (Carrito_ProductoBE cps in objCarritoSessionBE.lstCarrito_ProductoBE)
                            {
                                if (cps.Id_Producto == cp.Id_Producto)
                                {
                                    int cantidadAtributo = 0;

                                    foreach (Carrito_Producto_Elemento_AtributoBE cpeas in cps.lstCarrito_Producto_Elemento_AtributoBE)
                                    {
                                        foreach (Carrito_Producto_Elemento_AtributoBE cpea in cp.lstCarrito_Producto_Elemento_AtributoBE)
                                        {
                                            if (cpeas.Id_Elemento_Atributo == cpea.Id_Elemento_Atributo)
                                            {
                                                cantidadAtributo++;
                                                break;
                                            }
                                        }


                                    }

                                    if (cantidadAtributo == cps.lstCarrito_Producto_Elemento_AtributoBE.Count)
                                    {
                                        objCarritoSessionBE.lstCarrito_ProductoBE.Remove(cps);
                                        break;
                                    }
                                }
                            }
                        }
                    }

                    foreach (Carrito_ProductoBE cp in objCarritoSessionBE.lstCarrito_ProductoBE)
                    {
                        cp.Id_Carrito = objCarritoBE.Id_Carrito;
                        cp.Id_Carrito_Producto = objCarrito_ProductoBC.Insert_Carrito_Producto_Completo(cp);
                        objCarritoBE.lstCarrito_ProductoBE.Add(cp);
                    }

                    objCarritoBE.Total = (from c in objCarritoBE.lstCarrito_ProductoBE select c.Precio).Sum();

                    Session["CARRITO"] = objCarritoBE;
                }

                CargarItemsCarrito();

                if (objUsuarioBE.Activo_Correo)
                    hdVerifico.Value = "1";
                else
                    hdVerifico.Value = "0";
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarUsuarioLogueado(bool logueado)
        {
            pnlUsuarioRegistrado.Visible = logueado;
            pnlUsuarioNoRegistrado.Visible = !logueado;
            pnlOpcionesUsuario.Visible = logueado;
        }

        protected void lnkSalir_Click(object sender, EventArgs e)
        {
            try
            {
                Session.RemoveAll();
                Session.Abandon();
                MostrarUsuarioLogueado(false);
                CargarItemsCarrito();
                Response.Redirect("/Inicio");
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        public void CargarItemsCarrito()
        {
            ucCarrito carrito;
            CarritoBE objCarritoBE = null;
            //decimal total = 0;

            try
            {
                objCarritoBE = Session["CARRITO"] != null ? (CarritoBE)Session["CARRITO"] : new CarritoBE();
                pnlItemsCarrito.Controls.Clear();

                foreach (Carrito_ProductoBE p in objCarritoBE.lstCarrito_ProductoBE)
                {
                    carrito = (ucCarrito)Page.LoadControl("~/usercontrol/ucCarrito.ascx");
                    carrito.SetParametros(p);

                    pnlItemsCarrito.Controls.Add(carrito);

                    //total += p.Precio * p.Cantidad;
                }

                lblSubTotalCarrito.Text = objCarritoBE.Total.ToString();
                lblCantidadCarrito.Text = objCarritoBE.lstCarrito_ProductoBE.Count.ToString();
                //lblCostoCarrito.Text = objCarritoBE.Total.ToString();

                //if (objCarritoBE.Total != 0)
                //    pnlCarrito.Style.Add("display", "");
                //else
                //    pnlCarrito.Style.Add("display", "none");
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}