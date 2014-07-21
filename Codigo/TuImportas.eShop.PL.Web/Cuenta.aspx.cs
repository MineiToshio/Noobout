using System;
using System.Collections;
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
    public partial class Cuenta : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    //if (Session["USUARIO"] == null)
                    //{
                    //    Response.Redirect("/Inicio");
                    //}
                    //else
                    if (Tools.EstaLogueado())
                    {
                        if (RouteData.Values["Id_Menu"] != null)
                            MostrarMenu((MenuCuenta)Convert.ToInt32(RouteData.Values["Id_Menu"]));

                        LlenarDatosUsuario();
                        LlenarFavoritos();
                        LlenarDepartamentos();
                        LlenarDirecciones();
                        LlenarOrdenes();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarOrdenes()
        {
            PedidoBC objPedidoBC = new PedidoBC();
            Label lblOrden = new Label();
            
            try
            {
                List<PedidoBE> lstPedidoBE = objPedidoBC.Select_Pedido_Usuario(((UsuarioBE)Session["USUARIO"]).Id_Usuario);

                

                if (lstPedidoBE != null)
                {
                    foreach (PedidoBE p in lstPedidoBE)
                    {
                        lblOrden.Text += GetOrdenItem(p);
                    }
                }
                else
                {
                    lblOrden.Text = "<tr><td class=\"price\" colspan='6'>NO HAY PEDIDOS REGISTRADOS</td></tr>";
                }

                bodyOrdenes.Controls.Add(lblOrden);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarDepartamentos()
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();

            try
            {
                List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Departamento();

                ddlDepartamento.DataSource = lstUbigeoBE;
                ddlDepartamento.DataValueField = "CodDpto";
                ddlDepartamento.DataTextField = "Nombre";
                ddlDepartamento.DataBind();

                ddlDepartamento.Items.Insert(0, new ListItem("Departamento", "-1"));
                ddlDepartamento.Items[0].Attributes.Add("disabled", "disabled");
                ddlDepartamento.Items[0].Attributes.Add("selected", "selected");
                ddlDepartamento.Items[0].Attributes.Add("style", "display:none;");
            }
            catch (Exception)
            {

                throw;
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

        private void MostrarMenu(MenuCuenta menu)
        {
            try
            {
                liInfCuenta.Attributes.Add("class", "");
                liContrasena.Attributes.Add("class", "");
                liDirecciones.Attributes.Add("class", "");
                liOrdenes.Attributes.Add("class", "");
                liFavoritos.Attributes.Add("class", "");

                switch (menu)
                {
                    case MenuCuenta.Inf_Cuenta:
                        pnlInfCuenta.Style.Add("display", "");
                        liInfCuenta.Attributes.Add("class", "active");
                        break;
                    case MenuCuenta.Contrasena:
                        pnlContrasena.Style.Add("display", "");
                        liContrasena.Attributes.Add("class", "active");
                        break;
                    case MenuCuenta.Mis_Favoritos:
                        pnlFavoritos.Style.Add("display", "");
                        liFavoritos.Attributes.Add("class", "active");
                        break;
                    case MenuCuenta.Direcciones:
                        pnlDireccion.Style.Add("display", "");
                        liDirecciones.Attributes.Add("class", "active");
                        break;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarFavoritos()
        {
            WhishlistBC objWishlistBC = new WhishlistBC();
            Label lblWish = new Label();

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                List<WhishlistBE> lstWishlistBE = objWishlistBC.Get_Whishlist_Usuario(objUsuarioBE.Id_Usuario);

                if (lstWishlistBE != null)
                {
                    foreach (WhishlistBE w in lstWishlistBE)
                    {
                        lblWish.Text += GetWishItem(w);
                    }
                }
                else
                {
                    lblWish.Text = "<tr><td class=\"price\" colspan='3'>NO HAY PRODUCTOS AGREGADOS COMO FAVORITOS</td></tr>";
                }

                bodyFavoritos.Controls.Add(lblWish);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string GetWishItem(WhishlistBE objWishlistBE)
        {
            String wishitem = "";

            try
            {
                wishitem += "<tr id=\"trItemWish" + objWishlistBE.Id_Producto + "\">";
                wishitem += "<td class=\"image\"><img src=\"/images/productos/" + objWishlistBE.Nombre_Imagen + "\" alt=\"\" width=\"100\" height=\"124\" /></td>";
                wishitem += "<td class=\"desc\">" + objWishlistBE.Nombre + " <a title=\"Remove Item\" class=\"icon-remover\" href=\"#\" onclick=\"RemoverFavorito(" + objWishlistBE.Id_Producto + ")\"></a></td>";
                wishitem += "<td class=\"price\">S/. " + objWishlistBE.Precio + "</td>";
                wishitem += "</tr>";

                return wishitem;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string GetOrdenItem(PedidoBE objPedidoBE)
        {
            String pedidoItem = "";

            try
            {
                pedidoItem += "<tr id=\"trItemOrden" + objPedidoBE.Id_Pedido + "\">";
                pedidoItem += "<td class=\"price\">" + objPedidoBE.Id_Pedido + "</td>";
                pedidoItem += "<td class=\"price\">" + objPedidoBE.Fecha_Compra + "</td>";
                pedidoItem += "<td class=\"price\">" + objPedidoBE.Nombre_Estado + "</td>";
                pedidoItem += "<td class=\"price\">S/. " + objPedidoBE.Total + "</td>";
                pedidoItem += "<td class=\"price\"><a href=\"#\" onclick=\"VerOrden(" + objPedidoBE.Id_Pedido + ")\"> Ver Pedido </a></td>";
                pedidoItem += "</tr>";

                return pedidoItem;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private static string GetProductoItem(Pedido_ProductoBE objPedido_ProductoBE)
        {
            string itemCarrito = "";

            try
            {
                itemCarrito += "<tr name=\"itemProducto\" id=\"trItemCarrito" + objPedido_ProductoBE.Id_Producto + "\">";
                //itemCarrito += "<td class=\"image\"><img src=\"/images/productos/" + objPedido_ProductoBE.Imagen + "\" alt=\"\" width=\"100\" height=\"124\" /></td>";
                itemCarrito += "<td class=\"desc\">" + objPedido_ProductoBE.Nombre + "</td>";
                itemCarrito += "<td class=\"price\">" + objPedido_ProductoBE.Color + "</td>";
                itemCarrito += "<td class=\"price\">" + objPedido_ProductoBE.Cantidad + "</td>";
                itemCarrito += "<td class=\"price\">S/. <span id=\"spanPrecio" + objPedido_ProductoBE.Id_Producto + "\">" + objPedido_ProductoBE.Precio + "</span></td>";
                itemCarrito += "<td class=\"price\">" + (objPedido_ProductoBE.Cantidad * objPedido_ProductoBE.Precio) + "</td>";
                itemCarrito += "</tr>";

                return itemCarrito;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarDirecciones()
        {
            DireccionBC objDireccionBC = new DireccionBC();
            Label lblDireccion = new Label();

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                List<DireccionBE> lstDireccionBE = objDireccionBC.Select_Direccion_Usuario(objUsuarioBE.Id_Usuario);

                if (lstDireccionBE != null)
                {
                    foreach (DireccionBE d in lstDireccionBE)
                    {
                        lblDireccion.Text += GetDireccionItem(d);
                    }
                }
                else
                {
                    lblDireccion.Text = "<tr id='trSinDir'><td class=\"price\" colspan='5'>NO HAY DIRECCIONES AGREGADAS</td></tr>";
                }

                bodyDirecciones.Controls.Add(lblDireccion);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private static string GetDireccionItem(DireccionBE objDireccionBE)
        {
            String direccionItem = "";

            try
            {
                direccionItem += "<tr id=\"trItemDireccion" + objDireccionBE.Id_Direccion + "\">";
                direccionItem += "<td id=\"tdDireccionNombre" + objDireccionBE.Id_Direccion + "\" class=\"desc\"><a href=\"#\" onclick=\"VerDireccion(" + objDireccionBE.Id_Direccion + ")\">" + objDireccionBE.Nombre + "</a> <a title=\"Remove Item\" class=\"icon-remover\" href=\"#\" onclick=\"RemoverDireccion(" + objDireccionBE.Id_Direccion + ")\"></a></td>";
                direccionItem += "<td id=\"tdDireccionDpto" + objDireccionBE.Id_Direccion + "\" class=\"desc\" style=\"text-align:center;\">" + objDireccionBE.Nombre_Departamento + "</td>";
                direccionItem += "<td id=\"tdDireccionProv" + objDireccionBE.Id_Direccion + "\" class=\"desc\" style=\"text-align:center;\">" + objDireccionBE.Nombre_Provincia + "</td>";
                direccionItem += "<td id=\"tdDireccionDist" + objDireccionBE.Id_Direccion + "\" class=\"desc\" style=\"text-align:center;\">" + objDireccionBE.Nombre_Distrito + "</td>";
                direccionItem += "<td id=\"tdDireccionDir" + objDireccionBE.Id_Direccion + "\" class=\"desc\">" + objDireccionBE.Direccion + "</td>";
                //direccionItem += "<td class=\"desc\">" + objDireccionBE.Referencia + "</td>";
                direccionItem += "</tr>";

                return direccionItem;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        #region Webmethods

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

        [WebMethod]
        public static UsuarioBE TraerDatosUsuario()
        {
            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];

                return objUsuarioBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static void RemoverFavorito(int id_producto)
        {
            WhishlistBC objWhishlistBC = new WhishlistBC();

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];

                objWhishlistBC.Delete_Whishlist_Usuario_Producto(id_producto, objUsuarioBE.Id_Usuario);

                //return objUsuarioBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static ArrayList GetProvincia(string codDpto)
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();
            ArrayList arraylist = new ArrayList();

            try
            {
                if (!codDpto.Equals("-1"))
                {
                    List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Provincia(codDpto);

                    foreach (UbigeoBE ubigeoBE in lstUbigeoBE)
                    {
                        arraylist.Add(new ListItem(ubigeoBE.Nombre, ubigeoBE.CodProv));
                    }
                }
                return arraylist;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static ArrayList GetDistrito(string codDpto, string codProv)
        {
            UbigeoBC objUbigeoBC = new UbigeoBC();
            ArrayList arraylist = new ArrayList();

            try
            {
                if (!codDpto.Equals("-1") && !codProv.Equals("-1") && !codProv.Equals("null"))
                {
                    List<UbigeoBE> lstUbigeoBE = objUbigeoBC.Get_Ubigeo_Distrito(codDpto, codProv);

                    foreach (UbigeoBE ubigeoBE in lstUbigeoBE)
                    {
                        arraylist.Add(new ListItem(ubigeoBE.Nombre, ubigeoBE.CodDist));
                    }
                }
                return arraylist;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static string GuardarDireccion(DireccionBE objDireccionBE)
        {
            DireccionBC objDireccionBC = new DireccionBC();
            string itemDireccion = "";
            try
            {
                objDireccionBE.Id_Usuario = ((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario;

                int codigo = objDireccionBC.Insert_Direccion(objDireccionBE);

                if (codigo != -1)
                {
                    objDireccionBE.Id_Direccion = codigo;
                    itemDireccion = GetDireccionItem(objDireccionBE);
                }

                return itemDireccion;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static int ActualizarDireccion(DireccionBE objDireccionBE)
        {
            DireccionBC objDireccionBC = new DireccionBC();

            try
            {
                objDireccionBE.Id_Usuario = ((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario;

                int codigo = objDireccionBC.Update_Direccion(objDireccionBE);

                return codigo;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static void RemoverDireccion(int idDireccion)
        {
            DireccionBC objDireccionBC = new DireccionBC();

            try
            {
                objDireccionBC.Delete_Direccion(idDireccion);
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static DireccionBE VerDireccion(int idDireccion)
        {
            DireccionBC objDireccionBC = new DireccionBC();

            try
            {
                DireccionBE objDireccionBE = objDireccionBC.Get_Direccion(idDireccion);
                return objDireccionBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static PedidoBE VerOrden(int idOrden)
        {
            PedidoBC objPedidoBC = new PedidoBC();

            try
            {
                PedidoBE objPedidoBE = objPedidoBC.Get_Pedido_Completo(idOrden);
                
                for (int i = objPedidoBE.lstPedido_ProductoBE.Count - 1; i >= 0; i--)
                    objPedidoBE.Productos_Texto += GetProductoItem(objPedidoBE.lstPedido_ProductoBE[i]);

                objPedidoBE.Direccion_Envio_Texto = objPedidoBE.objDireccionEnvioBE.Direccion + ", " + objPedidoBE.objDireccionEnvioBE.Distrito + ", " + objPedidoBE.objDireccionEnvioBE.Provincia + ", " + objPedidoBE.objDireccionEnvioBE.Departamento;
                objPedidoBE.Direccion_Facturacion_Texto = objPedidoBE.objDireccionFacturacionBE.Direccion + ", " + objPedidoBE.objDireccionFacturacionBE.Distrito + ", " + objPedidoBE.objDireccionFacturacionBE.Provincia + ", " + objPedidoBE.objDireccionFacturacionBE.Departamento;

                return objPedidoBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
        #endregion
    }
}