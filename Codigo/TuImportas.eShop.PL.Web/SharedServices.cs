using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web
{
    public class SharedServices : System.Web.UI.Page
    {
        [WebMethod]
        public static object AgregarCarrito(int id_producto, string atributos)
        {
            try
            {
                if (Tools.AñadirCarrito(id_producto, 1, atributos))
                {
                    CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                    //Saco una instancia del carrito que acabo de agregar
                    Carrito_ProductoBE objCarrito_ProductoBE = objCarritoBE.lstCarrito_ProductoBE[objCarritoBE.lstCarrito_ProductoBE.Count - 1];

                    string control = Tools.HtmlCarrito(objCarrito_ProductoBE);

                    return new { control = control, precio = objCarrito_ProductoBE.Precio };
                }
                else
                    return new { control = "", precio = 0 };
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static decimal QuitarCarrito(int id_producto, string idAtributos)
        {
            CarritoBE objCarritoBE = null;
            List<Carrito_ProductoBE> lstCarrito_ProductoBE = null;
            Carrito_ProductoBE objCarrito_ProductoBE = new Carrito_ProductoBE();

            try
            {
                objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                lstCarrito_ProductoBE = (from c in objCarritoBE.lstCarrito_ProductoBE
                                        where c.Id_Producto == Convert.ToInt32(id_producto)
                                        select c).ToList();

                foreach (Carrito_ProductoBE cp in lstCarrito_ProductoBE)
                {
                    string[] atributos = idAtributos.Split('_');
                    int atributosEliminados = 0;

                    foreach (Carrito_Producto_Elemento_AtributoBE cpe in cp.lstCarrito_Producto_Elemento_AtributoBE)
                    {
                        foreach (string s in atributos)
                        {
                            if (!string.IsNullOrEmpty(s) && cpe.Id_Elemento_Atributo == Convert.ToInt32(s))
                            {
                                atributosEliminados++;
                                break;
                            }
                        }
                    }

                    if (atributosEliminados == atributos.Length - 1)
                    {
                        objCarrito_ProductoBE = cp;
                        break;
                    }
                }

                if (objCarritoBE.lstCarrito_ProductoBE.Count == 1)
                {
                    objCarritoBE = new CarritoBE();

                    if (HttpContext.Current.Session["USUARIO"] != null)
                    {
                        CarritoBC objCarritoBC = new CarritoBC();
                        objCarritoBC.Delete_Carrito_Total(((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario);
                    }
                }
                else
                {
                    objCarritoBE.lstCarrito_ProductoBE.Remove(objCarrito_ProductoBE);

                    objCarritoBE.Total -= objCarrito_ProductoBE.Precio * objCarrito_ProductoBE.Cantidad;

                    if (HttpContext.Current.Session["USUARIO"] != null)
                    {
                        Carrito_ProductoBC objCarrito_ProductoBC = new Carrito_ProductoBC();
                        objCarrito_ProductoBC.Delete_Carrito_Producto(objCarrito_ProductoBE.Id_Carrito_Producto);
                    }
                }

                HttpContext.Current.Session["CARRITO"] = objCarritoBE;

                return objCarrito_ProductoBE.Precio * objCarrito_ProductoBE.Cantidad;
            }
            catch(Exception ex)
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
            int id_usuario;

            try
            {
                if (objUsuarioBE.Captcha.ToLower() == HttpContext.Current.Session["CaptchaImageText"].ToString().ToLower())
                {
                    objUsuarioBE.Token_Correo = RandomString.GenerarRandomString(10);
                    objUsuarioBE.Id_Rol = (int)Rol.Usuario;
                    id_usuario = objUsuarioBC.Insert_Usuario(objUsuarioBE);

                    if (id_usuario > 0)
                        objMailBC.Registro_Usuario(objUsuarioBE);
                }
                else
                    id_usuario = -4;

                return id_usuario;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static int AgregarFavoritos(int id_producto)
        {
            try
            {
                if (HttpContext.Current.Session["USUARIO"] == null)
                    return 0;
                else
                {
                    Tools.AñadirFavoritos(id_producto);
                    return 1;
                }
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static int RecuperarPass(string email)
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

        [WebMethod]
        public static ProductoBE GetProducto(int id_producto)
        {
            ProductoBC objProductoBC = new ProductoBC();
            ProductoBE objProductoBE = new ProductoBE();

            try
            {
                objProductoBE = objProductoBC.Get_Producto(id_producto);

                return objProductoBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}