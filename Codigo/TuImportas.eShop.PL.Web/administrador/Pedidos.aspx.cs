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
    public partial class Pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarPedidos();
        }

        protected void gvPedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        private void LlenarPedidos()
        {
            PedidoBC objPedidoBC = new PedidoBC();

            try
            {
                gvPedidos.DataSource = objPedidoBC.Select_Pedido();
                gvPedidos.DataBind();
            }
            catch (Exception)
            {
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

        [WebMethod]
        public static UsuarioBE VerUsuario(int idUsuario)
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                UsuarioBE objUsuarioBE = objUsuarioBC.Get_Usuario(idUsuario);

                return objUsuarioBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
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

        protected void gvPedidos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPedidos.PageIndex = e.NewPageIndex;
            LlenarPedidos();
        }

        protected void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            PedidoBC objPedidoBC = new PedidoBC();

            try
            {
                objPedidoBC.Update_Pedido_Estado(Convert.ToInt32(hdIdPedidoSel.Value), (int)EstadoPedido.Entregado);
                LlenarPedidos();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}