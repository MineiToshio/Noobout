using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web
{
    public partial class Comprar_Paso3 : SharedServices
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
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        [WebMethod]
        public static void Continuar(CarritoBE objCarritoAuxBE)
        {
            try
            {
                if (Tools.EstaLogueado())
                {
                    CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                    objCarritoBE.Id_Forma_Pago = objCarritoAuxBE.Id_Forma_Pago;
                    objCarritoBE.Id_Tipo_Recibo = objCarritoAuxBE.Id_Tipo_Recibo;

                    if (objCarritoBE.Id_Tipo_Recibo == (int)Tipo_Recibo.Factura)
                    {
                        objCarritoBE.Razon_Social = objCarritoAuxBE.Razon_Social;
                        objCarritoBE.Ruc = objCarritoAuxBE.Ruc;
                    }
                    else
                    {
                        objCarritoBE.Razon_Social = null;
                        objCarritoBE.Ruc = null;
                    }

                    objCarritoBE.PasosCarrito = EtapaCompra.Compra3;

                    HttpContext.Current.Session["CARRITO"] = objCarritoBE;
                }
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        [WebMethod]
        public static CarritoBE GetMetodoPago()
        {
            try
            {
                CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                return objCarritoBE;

            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }
    }
}