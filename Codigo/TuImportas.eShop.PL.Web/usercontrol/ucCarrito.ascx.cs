using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.usercontrol
{
    public partial class ucCarrito : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkRemoverCarrito_Click(object sender, EventArgs e)
        {
            CarritoBE objCarritoBE = null;
            Carrito_ProductoBE objCarrito_ProductoBE = null;

            try
            {
                objCarritoBE = (CarritoBE)Session["CARRITO"];

                if (objCarritoBE.lstCarrito_ProductoBE.Count == 1)
                {
                    objCarritoBE = new CarritoBE();

                    if (Session["USUARIO"] != null)
                    {
                        CarritoBC objCarritoBC = new CarritoBC();
                        objCarritoBC.Delete_Carrito_Total(((UsuarioBE)Session["USUARIO"]).Id_Usuario);
                    }
                }
                else
                {
                    //objCarritoBE.lstCarrito_ProductoBE = (from c in objCarritoBE.lstCarrito_ProductoBE
                    //                                      where c.Id_Producto != Convert.ToInt32(hdIdProducto.Value)
                    //                                      select c).ToList();

                    objCarrito_ProductoBE = (from c in objCarritoBE.lstCarrito_ProductoBE
                                            where c.Id_Producto != Convert.ToInt32(hdIdProducto.Value)
                                            select c).ToList()[0];

                    objCarritoBE.lstCarrito_ProductoBE.Remove(objCarrito_ProductoBE);

                    objCarritoBE.Total -= objCarrito_ProductoBE.Precio * objCarrito_ProductoBE.Cantidad; 

                    if (Session["USUARIO"] != null)
                    {
                        Carrito_ProductoBC objCarrito_ProductoBC = new Carrito_ProductoBC();
                        objCarrito_ProductoBC.Delete_Carrito_Producto(objCarritoBE.Id_Carrito, Convert.ToInt32(hdIdProducto.Value));
                    }
                }

                Session["CARRITO"] = objCarritoBE;

                eshop masterPage = (eshop)Page.Master;
                masterPage.CargarItemsCarrito();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void SetParametros(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            imgProducto.ImageUrl = "/images/productos/" + objCarrito_ProductoBE.Imagen;
            lnkNombre.PostBackUrl = "/Producto/" + objCarrito_ProductoBE.Id_Producto;
            lnkNombre.Text = objCarrito_ProductoBE.Nombre;
            hdIdProducto.Value = objCarrito_ProductoBE.Id_Producto.ToString();
            lblPrecio.Text = objCarrito_ProductoBE.Precio.ToString();
            lblCantidad.Text = objCarrito_ProductoBE.Cantidad.ToString();
            pnlItemCart.ID = "pnlItemCart" + objCarrito_ProductoBE.Id_Producto;
        }
    }
}