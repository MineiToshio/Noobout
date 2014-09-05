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
    public partial class Comprar_Paso1 : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EstaLogueado())
                    {
                        LlenarCarrito();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarCarrito()
        {
            decimal subtotal = 0;
            string codigo = "";
            Producto_ColorBC objProducto_ColorBC = new Producto_ColorBC();
            List<Producto_ColorBE> lstProducto_ColorBE = new List<Producto_ColorBE>();

            try
            {
                CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                if (objCarritoBE.lstCarrito_ProductoBE.Count > 0)
                {
                    foreach (Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                    {
                        codigo += cp.Id_Producto + ",";
                    }

                    codigo = codigo.Remove(codigo.Length - 1);

                    if (!String.IsNullOrEmpty(codigo))
                        lstProducto_ColorBE = objProducto_ColorBC.Select_Producto_Color(codigo);

                    for (int i = objCarritoBE.lstCarrito_ProductoBE.Count - 1; i >= 0; i--)
                    {
                        Label lblCarrito = new Label();
                        //List<Producto_ColorBE> lstProducto_ColorAuxBE = new List<Producto_ColorBE>();

                        //lstProducto_ColorAuxBE = (from c in lstProducto_ColorBE
                        //                          where c.Id_Producto == objCarritoBE.lstCarrito_ProductoBE[i].Id_Producto
                        //                          select c).ToList();

                        lblCarrito.Text = GetCarritoItem(objCarritoBE.lstCarrito_ProductoBE[i]);

                        bodyCarrito.Controls.AddAt(0, lblCarrito);

                        subtotal += objCarritoBE.lstCarrito_ProductoBE[i].Precio * objCarritoBE.lstCarrito_ProductoBE[i].Cantidad;
                    }

                    lblShopSubtotalCarrito.Text = subtotal.ToString();
                }
                else
                {
                    CarritoVacio();
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CarritoVacio()
        {
            try
            {
                Label lblCarrito = new Label();
                lblCarrito.Text = "<tr><td class=\"qty\" colspan=\"5\"><br/>SU CARRITO DE COMPRAS SE ENCUENTRA VACÍO<br/></td></tr>";
                bodyCarrito.Controls.AddAt(0, lblCarrito);
                trSubTotal.Style.Add("display", "none");
                pContinuar.Style.Add("display", "none");
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string GetCarritoItem(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            string itemCarrito = "";
            string idAtributos = "";
            string atributos = "";

            try
            {
                foreach (Carrito_Producto_Elemento_AtributoBE cpe in objCarrito_ProductoBE.lstCarrito_Producto_Elemento_AtributoBE)
                {
                    idAtributos += cpe.Id_Elemento_Atributo + "_";
                    atributos += "<br/><span class=\"compra-atributos\">" + cpe.Atributo + ": " + cpe.Elemento + "</span>";
                }

                itemCarrito += "<tr id=\"trItemCarrito" + objCarrito_ProductoBE.Id_Producto + "_" + idAtributos + "\">";
                itemCarrito += "<td class=\"image\"><img src=\"/images/productos/" + objCarrito_ProductoBE.Imagen + "\" alt=\"\" width=\"100\" height=\"124\" /></td>";
                itemCarrito += "<td class=\"desc\">";
                itemCarrito += objCarrito_ProductoBE.Nombre + " <a title=\"Remove Item\" class=\"icon-remover\" href=\"#\" onclick=\"RemoverShopCarrito(" + objCarrito_ProductoBE.Id_Producto + ",'" + idAtributos + "')\"></a>";
                itemCarrito += atributos;
                itemCarrito += "</td>";
                //itemCarrito += "<td>";
                //if (lstProducto_ColorBE != null)
                //{

                //    itemCarrito += "<select name=\"ddlColor\" id=\"ddlColor" + objCarrito_ProductoBE.Id_Producto + "\" class=\"span2 validate[required]\">";
                //    itemCarrito += "<option value=\"-1\" disabled=\"disabled\" " + (objCarrito_ProductoBE.Id_Color == null ? "selected=\"selected\"" : "") + " style=\"display:none;\">Elija un Color</option>";
                //    foreach (Producto_ColorBE pc in lstProducto_ColorBE)
                //    {
                //        itemCarrito += "<option value=\"" + pc.Id_Color + "\" " + (objCarrito_ProductoBE.Id_Color == pc.Id_Color ? "selected=\"selected\"" : "") + ">" + pc.Color + "</option>";
                //    }
                //    itemCarrito += "</select>";
                //}
                //itemCarrito += "</td>";
                itemCarrito += "<td class=\"qty\"><input type=\"text\" maxlength=\"2\" class=\"tiny-size positive-integer validate[required]\" name=\"inputCantidad\" id=\"inputCantidad" + objCarrito_ProductoBE.Id_Carrito_Producto + "\" value=\"" + objCarrito_ProductoBE.Cantidad + "\" onkeyup=\"CalcularSubtotal()\" /></td>";
                itemCarrito += "<td class=\"price\">S/. <span id=\"spanPrecio" + objCarrito_ProductoBE.Id_Carrito_Producto + "\">" + objCarrito_ProductoBE.Precio + "</span></td>";
                itemCarrito += "<td class=\"price\">S/. <span id=\"spanTotal" + objCarrito_ProductoBE.Id_Carrito_Producto + "\">" + objCarrito_ProductoBE.Precio * objCarrito_ProductoBE.Cantidad + "</span></td>";
                itemCarrito += "</tr>";

                return itemCarrito;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        [WebMethod]
        public static int Continuar(String lstCantidad)
        {
            try
            {
                if (Tools.EstaLogueado())
                {
                    CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                    if (objCarritoBE.lstCarrito_ProductoBE != null && objCarritoBE.lstCarrito_ProductoBE.Count != 0)
                    {
                        
                        lstCantidad = lstCantidad.Remove(lstCantidad.Length - 1);

                        String[] cantidades = lstCantidad.Split('|');

                        for (int i = 0; i < cantidades.Length; i++)
                        {
                            string[] cantidad = cantidades[i].Split(',');
                            int id_carrito_producto = Convert.ToInt32(cantidad[0]);

                            for (int j = 0; j < objCarritoBE.lstCarrito_ProductoBE.Count; j++)
                            {
                                if (objCarritoBE.lstCarrito_ProductoBE[j].Id_Carrito_Producto == id_carrito_producto)
                                {
                                    objCarritoBE.lstCarrito_ProductoBE[j].Cantidad = Convert.ToInt32(cantidad[1]);
                                    break;
                                }
                            }
                        }

                        objCarritoBE.PasosCarrito = EtapaCompra.Compra1;

                        HttpContext.Current.Session["CARRITO"] = objCarritoBE;

                        return 1;
                    }
                    else
                        return -1;
                }
                return -1;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}