using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web
{
    public class Tools
    {
        public static void AlertError(Type tipo, Control control)
        {
            ScriptManager.RegisterStartupScript(control, tipo, "msg", "jError('" + "Ha ocurrido un error inesperado. Por favor, vuelva a intentar en un momento." + "', '" + "Error" + "');", true);
        }

        public static void Error(Type tipo, Control control, Exception ex)
        {
            LogFile.EscribirLog(ex);
            AlertError(tipo, control);
        }

        public static void Alert(String mensaje, String header, Type tipo, Control control)
        {
            ScriptManager.RegisterStartupScript(control, tipo, "msg", "jAlert('" + mensaje + "', '" + header + "');", true);
        }

        public static void AlertRedirect(String mensaje, String header, String url, Type tipo, Control control)
        {
            String script = "jRedirect('" + mensaje + "', '" + header + "', function(r) { window.location.href ='" + url + "'; });";
            ScriptManager.RegisterStartupScript(control, tipo, "msg", script, true);
        }

        public static bool ExisteProductoCarrito(int idProducto, string atributos)
        {
            bool existe = false;
            int repetido = 0;

            try
            {
                CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                string[] arrAtributos = atributos.Split('|'); 

                foreach(Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                {
                    repetido = 0;

                    if (cp.Id_Producto == idProducto)
                    {
                        if (cp.lstCarrito_Producto_Elemento_AtributoBE.Count == 0)
                            existe = true;
                        else
                        {
                            foreach (Carrito_Producto_Elemento_AtributoBE cpe in cp.lstCarrito_Producto_Elemento_AtributoBE)
                            {
                                foreach (string s in arrAtributos)
                                {
                                    if (cpe.Id_Elemento_Atributo.ToString().Equals(s))
                                    {
                                        repetido++;
                                        break;
                                    }
                                }

                                if (cp.lstCarrito_Producto_Elemento_AtributoBE.Count == repetido)
                                {
                                    return true;
                                }
                            }
                        }
                    }
                }

                return existe;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static bool AñadirCarrito(int idProducto, int cantidad, string atributos)
        {
            CarritoBE objCarritoBE;
            Carrito_ProductoBE objCarrito_ProductoBE = new Carrito_ProductoBE();
            Carrito_Producto_Elemento_AtributoBE objCarrito_Producto_Elemento_AtributoBE = new Carrito_Producto_Elemento_AtributoBE();
            ProductoBC objProductoBC = new ProductoBC();
            ProductoBE objProductoBE = new ProductoBE();
            //decimal total = 0;

            try
            {
                if (!ExisteProductoCarrito(idProducto, atributos))
                {

                    objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                    string[] arrAtributos = atributos.Split('|');

                    objProductoBE = objProductoBC.Get_Producto(idProducto);

                    objCarrito_ProductoBE.Id_Producto = objProductoBE.Id_Producto;
                    objCarrito_ProductoBE.Imagen = objProductoBE.lstImagen_ProductoBE[0].Nombre;
                    objCarrito_ProductoBE.Nombre = objProductoBE.Nombre;
                    objCarrito_ProductoBE.Precio = objProductoBE.Precio;
                    objCarrito_ProductoBE.Cantidad = cantidad;

                    foreach (string s in arrAtributos)
                    {
                        if (!string.IsNullOrEmpty(s))
                        {
                            string[] arrElemento = s.Split(','); //Atributo,Elemento,Id_Elemento

                            objCarrito_Producto_Elemento_AtributoBE = new Carrito_Producto_Elemento_AtributoBE();
                            objCarrito_Producto_Elemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(arrElemento[2]);
                            objCarrito_Producto_Elemento_AtributoBE.Atributo = arrElemento[0];
                            objCarrito_Producto_Elemento_AtributoBE.Elemento = arrElemento[1];
                            objCarrito_ProductoBE.lstCarrito_Producto_Elemento_AtributoBE.Add(objCarrito_Producto_Elemento_AtributoBE);
                        }
                    }

                    objCarritoBE.Total += cantidad * objProductoBE.Precio;
                    
                    if (HttpContext.Current.Session["USUARIO"] != null)
                    {
                        objCarritoBE.Id_Usuario = ((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario;

                        CarritoBC objCarritoBC = new CarritoBC();
                        Carrito_ProductoBC objCarrito_ProductoBC = new Carrito_ProductoBC();

                        if (objCarritoBE.lstCarrito_ProductoBE.Count == 0) //El carrito no existe
                            objCarritoBE.Id_Carrito = objCarritoBC.Insert_Carrito(objCarritoBE);
                        //else
                        //    objCarritoBC.Update_Carrito(objCarritoBE);

                        objCarrito_ProductoBE.Id_Carrito = objCarritoBE.Id_Carrito;
                        objCarrito_ProductoBE.Id_Carrito_Producto = objCarrito_ProductoBC.Insert_Carrito_Producto_Completo(objCarrito_ProductoBE);
                    }

                    objCarritoBE.lstCarrito_ProductoBE.Add(objCarrito_ProductoBE);

                    objCarritoBE.PasosCarrito = EtapaCompra.Compra0;

                    HttpContext.Current.Session["CARRITO"] = objCarritoBE;

                    return true;
                }
                else
                    return false;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static string HtmlCarrito(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            try
            {
                String control = "";

                string textoAtributos = "";
                string idAtributos = "";

                foreach (Carrito_Producto_Elemento_AtributoBE cp in objCarrito_ProductoBE.lstCarrito_Producto_Elemento_AtributoBE)
                {
                    textoAtributos += cp.Atributo + ": " + cp.Elemento + "<br/>";
                    idAtributos += cp.Id_Elemento_Atributo + "_";
                }

                control += "<div class=\"item-in-cart clearfix\" id=\"pnlItemCart" + objCarrito_ProductoBE.Id_Producto + "_" + idAtributos + "\">";
                control += "<div class=\"image\">";
                control += "<img src=\"/images/productos/" + objCarrito_ProductoBE.Imagen + "\" width=\"124\" height=\"124\" alt=\"cart item\" />";
                control += "</div>";
                control += "<div class=\"desc\">";
                control += "<strong><a href=\"/Producto/" + objCarrito_ProductoBE.Id_Producto + "\">" + objCarrito_ProductoBE.Nombre + "</a> <a href=\"#\" class=\"icon-remover\" title=\"Remover Item\" onclick=\"QuitarCarrito(" + objCarrito_ProductoBE.Id_Producto + ",'" + idAtributos + "');\"></a></strong>";
                control += "<span class=\"light-clr qty\">";
                control += textoAtributos;
                control += "Cantidad: " + objCarrito_ProductoBE.Cantidad.ToString();
                control += "</span>";
                control += "</div>";
                control += "<div class=\"price\">";
                control += "<strong>S/. " + objCarrito_ProductoBE.Precio.ToString() + "</strong>";
                control += "</div>";
                control += "</div>";

                return control;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static string MostrarSlider(SliderBE objSliderBE)
        {
            try
            {
                String control = "";

                control += "<li data-transition=\"premium-random\" data-slotamount=\"3\">";
                control += "<img src=\"/images/sliders/" + objSliderBE.Background + "\" alt=\"slider img\" width=\"1400\" height=\"377\" />";
                control += "<div class=\"caption lfb ltb\" data-x=\"800\" data-y=\"50\" data-speed=\"1000\" data-start=\"1000\" data-easing=\"easeInOutCubic\">";
                control += "<img src=\"/images/sliders/" + objSliderBE.Imagen + "\" alt=\"woman\" width=\"361\" height=\"374\" />";
                control += "</div>";
                control += "<div class=\"caption lfl big_theme\" data-x=\"120\" data-y=\"120\" data-speed=\"1000\" data-start=\"500\" data-easing=\"easeInOutBack\">";
                control += objSliderBE.Nombre;
                control += "</div>";
                control += "<div class=\"caption lfl small_theme\" data-x=\"120\" data-y=\"190\" data-speed=\"1000\" data-start=\"700\" data-easing=\"easeInOutBack\">";
                control += objSliderBE.Descripcion;
                control += "</div>";
                control += "<a href=\"" + objSliderBE.Url + "\" class=\"caption lfl btn btn-primary btn_theme\" data-x=\"120\" data-y=\"260\" data-speed=\"1000\" data-start=\"900\" data-easing=\"easeInOutBack\">";
                control += objSliderBE.Boton;
                control += "</a>";
                control += "</li>";

                return control;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static void AñadirFavoritos(int idProducto)
        {
            WhishlistBC objWhishlistBC = new WhishlistBC();
            WhishlistBE objWhishlistBE = new WhishlistBE();

            try
            {
                objWhishlistBE.Id_Usuario = ((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario;
                objWhishlistBE.Id_Producto = idProducto;

                objWhishlistBC.Insert_Whishlist(objWhishlistBE);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static bool EstaLogueado()
        {
            try
            {
                if (HttpContext.Current.Session["USUARIO"] == null)
                {
                    HttpContext.Current.Response.Redirect("/Inicio");
                    return false;
                }
                else
                    return true;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static bool EsAdmin()
        {
            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];

                if (objUsuarioBE == null)
                {
                    HttpContext.Current.Response.Redirect("/LoginA");
                    return false;
                }
                else
                {
                    if (objUsuarioBE.Id_Rol == (int)Rol.Admin)
                        return true;
                    else
                    {
                        HttpContext.Current.Response.Redirect("/LoginA");
                        return false;
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public static void Unload(Type tipo, Control control)
        {
            ScriptManager.RegisterStartupScript(control, tipo, "msg", "$.unblockUI();", true);
        }

        public static bool EsImagen(String ext)
        {
            try
            {
                if (ext.ToLower().Equals(".png") || ext.ToLower().Equals(".jpg") || ext.ToLower().Equals(".gif") || ext.ToLower().Equals(".jpeg") || ext.ToLower().Equals(".bmp"))
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static PedidoBE LlenarPedido()
        {
            PedidoBE objPedidoBE = new PedidoBE();
            Pedido_ProductoBE objPedidoProductoBE = new Pedido_ProductoBE();
            Pedido_Producto_Elemento_AtributoBE objPedido_Producto_Elemento_AtributoBE = new Pedido_Producto_Elemento_AtributoBE();

            try
            {
                CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                objPedidoBE.Id_Forma_Pago = objCarritoBE.Id_Forma_Pago;
                objPedidoBE.Id_Tipo_Recibo = objCarritoBE.Id_Tipo_Recibo;
                objPedidoBE.Id_Usuario = ((UsuarioBE)HttpContext.Current.Session["USUARIO"]).Id_Usuario;
                objPedidoBE.Precio_Envio = objCarritoBE.Precio_Envio;
                objPedidoBE.Razon_Social = objCarritoBE.Razon_Social;
                objPedidoBE.Ruc = objCarritoBE.Ruc;
                objPedidoBE.Subtotal = objCarritoBE.Subtotal;
                objPedidoBE.Total = objCarritoBE.Total;
                objPedidoBE.Operador_Logistico = objCarritoBE.Nombre_Operador_Logistico;
                objPedidoBE.Tiempo_Entrega = objCarritoBE.Tiempo_Entrega;
                objPedidoBE.Cip = objCarritoBE.Cip;

                //objPedidoBE.objDireccionEnvioBE.Id_Pedido = objPedidoBE.Id_Pedido;
                objPedidoBE.objDireccionEnvioBE.Departamento = objCarritoBE.Direccion_Envio.Nombre_Departamento;
                objPedidoBE.objDireccionEnvioBE.Direccion = objCarritoBE.Direccion_Envio.Direccion;
                objPedidoBE.objDireccionEnvioBE.Distrito = objCarritoBE.Direccion_Envio.Nombre_Distrito;
                objPedidoBE.objDireccionEnvioBE.Provincia = objCarritoBE.Direccion_Envio.Nombre_Departamento;
                objPedidoBE.objDireccionEnvioBE.Referencia = objCarritoBE.Direccion_Envio.Referencia;

                //objPedidoBE.objDireccionFacturacionBE.Id_Pedido = objPedidoBE.Id_Pedido;
                objPedidoBE.objDireccionFacturacionBE.Departamento = objCarritoBE.Direccion_Facturacion.Nombre_Departamento;
                objPedidoBE.objDireccionFacturacionBE.Direccion = objCarritoBE.Direccion_Facturacion.Direccion;
                objPedidoBE.objDireccionFacturacionBE.Distrito = objCarritoBE.Direccion_Facturacion.Nombre_Distrito;
                objPedidoBE.objDireccionFacturacionBE.Provincia = objCarritoBE.Direccion_Facturacion.Nombre_Departamento;
                objPedidoBE.objDireccionFacturacionBE.Referencia = objCarritoBE.Direccion_Facturacion.Referencia;

                foreach (Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                {
                    objPedidoProductoBE = new Pedido_ProductoBE();
                    objPedidoProductoBE.Cantidad = cp.Cantidad;
                    objPedidoProductoBE.Color = cp.Color;
                    //objPedidoProductoBE.Id_Pedido = objPedidoBE.Id_Pedido;
                    objPedidoProductoBE.Id_Producto = cp.Id_Producto;
                    objPedidoProductoBE.Precio = cp.Precio;

                    foreach (Carrito_Producto_Elemento_AtributoBE cpe in cp.lstCarrito_Producto_Elemento_AtributoBE)
                    {
                        objPedido_Producto_Elemento_AtributoBE = new Pedido_Producto_Elemento_AtributoBE();
                        objPedido_Producto_Elemento_AtributoBE.Atributo = cpe.Atributo;
                        objPedido_Producto_Elemento_AtributoBE.Element = cpe.Elemento;

                        objPedidoProductoBE.lstPedido_Producto_Elemento_AtributoBE.Add(objPedido_Producto_Elemento_AtributoBE);
                    }

                    objPedidoBE.lstPedido_ProductoBE.Add(objPedidoProductoBE);
                }

                return objPedidoBE;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static void Comprar()
        {
            PedidoBC objPedidoBC = new PedidoBC();
            CarritoBC objCarritoBC = new CarritoBC();
            MailBC objMailBC = new MailBC();

            try
            {
                CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];
                UsuarioBE objUsuarioBE = (UsuarioBE)HttpContext.Current.Session["USUARIO"];

                PedidoBE objPedidoBE = LlenarPedido();

                objPedidoBE.Id_Pedido = objPedidoBC.Insert_Pedido_Completo(objPedidoBE);
                objCarritoBC.Delete_Carrito_Total(objUsuarioBE.Id_Usuario);

                objMailBC.Confirmar_Compra(objUsuarioBE, objCarritoBE);

                HttpContext.Current.Session["CARRITO"] = new CarritoBE();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public static void MostrarGridSortDirection(GridView grid, string sortExpression, string sortDirection)
        {
            Image sortImage = new Image();
            sortImage.ImageUrl = "/images/" + (sortDirection == "Asc" ? "arrow_asc.png" : "arrow_desc.png");
            int columnIndex = 0;
            foreach (DataControlFieldHeaderCell headerCell in grid.HeaderRow.Cells)
            {
                if (headerCell.ContainingField.SortExpression == sortExpression)
                {
                    columnIndex = grid.HeaderRow.Cells.GetCellIndex(headerCell);
                    break;
                }
            }

            grid.HeaderRow.Cells[columnIndex].Controls.Add(sortImage);
        }

        public static void DropDownPlaceHolder(DropDownList ddl, string placeholder)
        {
            ddl.Items.Insert(0, new ListItem(placeholder, "-1"));
            ddl.Items[0].Attributes.Add("disabled", "disabled");
            ddl.Items[0].Attributes.Add("selected", "selected");
            ddl.Items[0].Attributes.Add("style", "display:none;");
        }
    }
}