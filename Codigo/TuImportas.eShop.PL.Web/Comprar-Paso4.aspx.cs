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
    public partial class Comprar_Paso4 : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EstaLogueado())
                    {
                        ValidarCarrito();
                        LlenarCarrito();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void ValidarCarrito()
        {
            try
            {
                CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                switch (objCarritoBE.PasosCarrito)
                {
                    case EtapaCompra.Compra0:
                        Response.Redirect("/Comprar");
                        break;
                    case EtapaCompra.Compra1:
                        Response.Redirect("/Comprar2");
                        break;
                    case EtapaCompra.Compra2:
                        Response.Redirect("/Comprar3");
                        break;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarCarrito()
        {
            decimal subtotal = 0;

            try
            {
                CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                for (int i = objCarritoBE.lstCarrito_ProductoBE.Count - 1; i >= 0; i--)
                {
                    Label lblCarrito = new Label();

                    lblCarrito.Text = GetCarritoItem(objCarritoBE.lstCarrito_ProductoBE[i]);

                    bodyCarrito.Controls.AddAt(0, lblCarrito);

                    subtotal += objCarritoBE.lstCarrito_ProductoBE[i].Precio * objCarritoBE.lstCarrito_ProductoBE[i].Cantidad;
                }

                objCarritoBE.Subtotal = subtotal;
                objCarritoBE.Total = subtotal + objCarritoBE.Precio_Envio;

                lblFinalEnvio.Text = objCarritoBE.Precio_Envio.ToString();
                lblFinalSubTotal.Text = subtotal.ToString();
                lblFinalTotal.Text = (subtotal + objCarritoBE.Precio_Envio).ToString();

                Session["CARRITO"] = objCarritoBE;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string GetCarritoItem(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            string itemCarrito = "";

            try
            {
                itemCarrito += "<tr id=\"trItemCarrito" + objCarrito_ProductoBE.Id_Producto + "\">";
                itemCarrito += "<td class=\"image\"><img src=\"/images/productos/" + objCarrito_ProductoBE.Imagen + "\" alt=\"\" width=\"100\" height=\"124\" /></td>";
                itemCarrito += "<td class=\"desc\">" + objCarrito_ProductoBE.Nombre + "</td>";
                itemCarrito += "<td class=\"price\">" + objCarrito_ProductoBE.Color + "</td>";
                itemCarrito += "<td class=\"price\">" + objCarrito_ProductoBE.Cantidad + "</td>";
                itemCarrito += "<td class=\"price\">S/. <span id=\"spanPrecio" + objCarrito_ProductoBE.Id_Producto + "\">" + objCarrito_ProductoBE.Precio + "</span></td>";
                itemCarrito += "</tr>";

                return itemCarrito;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void lnkContinuar_Click(object sender, EventArgs e)
        {
            PedidoBC objPedidoBC = new PedidoBC();
            //PedidoBE objPedidoBE = new PedidoBE();
            //Pedido_DireccionBC objPedidoDireccionBC = new Pedido_DireccionBC();
            //Pedido_ProductoBC objPedidoProductoBC = new Pedido_ProductoBC();
            //Pedido_ProductoBE objPedidoProductoBE = new Pedido_ProductoBE();
            CarritoBC objCarritoBC = new CarritoBC();

            try
            {
                if (Tools.EstaLogueado())
                {
                    CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                    //objPedidoBE.Id_Pedido = objPedidoBC.Insert_Pedido_Completo(objPedidoBE);
                    //objCarritoBC.Delete_Carrito_Total(((UsuarioBE)Session["USUARIO"]).Id_Usuario);

                    //Enviar_Confirmacion();
                    
                    if (objCarritoBE.Id_Forma_Pago == (int)FormaPago.PagoEfectivo)
                    {
                        Response.Redirect("/PagoEfectivo");
                    }
                    else
                    { 
                        Response.Redirect("/Inicio");
                        Session["CARRITO"] = new CarritoBE();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        //private void Enviar_Confirmacion()
        //{
        //    MailBC objMailBC = new MailBC();

        //    try
        //    {
        //        CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];
        //        UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

        //        objMailBC.Confirmar_Compra(objUsuarioBE, objCarritoBE);
        //    }
        //    catch (Exception)
        //    {
                
        //        throw;
        //    }
        //}
    }
}