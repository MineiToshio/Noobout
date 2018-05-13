using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace TuImportas.eShop.PL.Web
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Register_Routes(RouteTable.Routes);
            ValidationSettings.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
        private void Register_Routes(RouteCollection routes)
        {
            routes.MapPageRoute("Inicio", "Inicio", "~/Inicio.aspx");
            routes.MapPageRoute("Producto", "Producto/{Id_Producto}", "~/Producto.aspx");
            routes.MapPageRoute("Categoria", "Categoria/{Id_Categoria}", "~/Tienda.aspx");
            routes.MapPageRoute("Buscar", "Buscar/{Busqueda_String}", "~/Tienda.aspx");
            routes.MapPageRoute("Contacto", "Contacto", "~/Contacto.aspx");
            routes.MapPageRoute("Acerca", "Acerca", "~/Acerca.aspx");
            routes.MapPageRoute("Tienda", "Tienda", "~/Tienda.aspx");
            routes.MapPageRoute("Cuenta", "Cuenta", "~/Cuenta.aspx");
            routes.MapPageRoute("CuentaMenu", "Cuenta/{Id_Menu}", "~/Cuenta.aspx");
            routes.MapPageRoute("Activar", "Activar/{Usuario}/{TokenCorreo}", "~/Activar.aspx");
            routes.MapPageRoute("Comprar", "Comprar", "~/Comprar-Paso1.aspx");
            routes.MapPageRoute("Comprar2", "Comprar2", "~/Comprar-Paso2.aspx");
            routes.MapPageRoute("Comprar3", "Comprar3", "~/Comprar-Paso3.aspx");
            routes.MapPageRoute("Comprar4", "Comprar4", "~/Comprar-Paso4.aspx");
            routes.MapPageRoute("Recuperar", "Recuperar/{Usuario}/{TokenRecuperar}", "~/RecuperarPass.aspx");
            routes.MapPageRoute("Admin", "Admin", "~/administrador/Inicio.aspx");
            routes.MapPageRoute("LoginA", "LoginA", "~/administrador/Login.aspx");
            routes.MapPageRoute("404", "404", "~/error/404.aspx");
            routes.MapPageRoute("Nosotros", "Nosotros", "~/Nosotros.aspx");
            routes.MapPageRoute("Mision", "Mision", "~/Mision.aspx");
            routes.MapPageRoute("Vision", "Vision", "~/Vision.aspx");
            routes.MapPageRoute("Faq", "Faq", "~/Faq.aspx");
            routes.MapPageRoute("Valores", "Valores", "~/Valores.aspx");
            routes.MapPageRoute("Terminos", "Terminos", "~/Terminos.aspx");
            routes.MapPageRoute("ComoComprar", "ComoComprar", "~/ComoComprar.aspx");
            routes.MapPageRoute("PagoEfectivo", "PagoEfectivo", "~/PagoEfectivo.aspx");
        }
    }
}