using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class MailBC
    {
        #region Utils

        /// <summary>Devuelve los datos del servidor de correo.</summary> 
        private SmtpClient Set_Servidor()
        {
            try
            {
                SmtpClient smtpclient = new SmtpClient();
                int servCorreo = Convert.ToInt32(ConfigurationManager.AppSettings["ServidorCorreo"]);

                switch (servCorreo)
                {
                    case (int)ServidorCorreo.GMail:
                        smtpclient.Host = "smtp.gmail.com";
                        smtpclient.Credentials = new System.Net.NetworkCredential("usertestdeveloper@gmail.com", "passDeveloper$876");
                        smtpclient.EnableSsl = true;
                        break;
                    case (int)ServidorCorreo.GoDaddy:
                        smtpclient.Host = "relay-hosting.secureserver.net";
                        smtpclient.Port = 25;
                        smtpclient.EnableSsl = false;
                        break;
                }
                return smtpclient;
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>Asigna la plantilla básica a un correo electrónico.</summary> 
        /// <param name="texto">El texto que va dentro del correo.</param>
        private String Get_Plantilla_Mail(String texto)
        {
            try
            {
                String body = "";
                int servCorreo = Convert.ToInt32(ConfigurationManager.AppSettings["ServidorCorreo"]);

                body =
                    "<html>" +
                        "<body>" +
                            "<center>" +
                                "<img src=\"cid:logo\"/>" +
                                "<br>" +
                                "Se agradece no responder a este buzón ya que es un buzón desatendido." +
                                "<br/><br/>" +
                                //"************************************************************************" +
                                "<hr/><br/>" +
                            "</center>" +
                            texto +
                            "<br/><br/>" +
                            "Atentamente," +
                            "<br/>" +
                            "Administrador " + ConfigurationManager.AppSettings["Empresa"].ToString() +
                        "</body>" +
                    "</html>";

                return body;
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>Asigna la plantilla básica a un correo electrónico.</summary> 
        private String Get_Logo_Path()
        {
            String ruta = Directory.GetParent(System.AppDomain.CurrentDomain.BaseDirectory) + @"/images/logo.png";

            return ruta;
        }

        #endregion

        #region Correos

        public void Olvido_Datos(UsuarioBE objUsuarioBE)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];

                mensaje.Body = "Estimado(a) " + objUsuarioBE.Nombre + ", <br/><br/>Para recuperar su cuenta, deberá crear una nueva contraseña. Para esto, ingrese al siguiente enlace:<br/>http://" + dominio + "/recuperar/" + objUsuarioBE.Usuario + "/" + objUsuarioBE.Token_Recuperacion + "<br/><br/>Este enlace solo funcionará por 24 horas.";

                mensaje.To.Clear();
                mensaje.To.Add(objUsuarioBE.Email);
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Restablecer su contraseña";
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Registro_Usuario(UsuarioBE objUsuarioBE)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];

                mensaje.Body = "Estimado(a) " + objUsuarioBE.Usuario + ", <br/><br/>Muchas gracias por registrarte en noobout.com. Para poder activar su cuenta por favor haga click en el siguiente enlace:<br/><br/><a href=\"http://" + dominio + "/activar/" + objUsuarioBE.Usuario + "/" + objUsuarioBE.Token_Correo + "\">Activar Cuenta</a>";

                mensaje.To.Clear();
                mensaje.To.Add(objUsuarioBE.Email);
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Activar tu cuenta";
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Contacto(MensajeBE objMensajeBE)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";
            String contacto = "";

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];
                contacto = ConfigurationManager.AppSettings["Contacto"];

                mensaje.Body = "Usted ha recibido un mensaje de " + empresa + ":<br/><br/><span style='font-weight:bold;'>Nombre:</span> " + objMensajeBE.Nombre + "<br/><span style='font-weight:bold;'>Apellido:</span> " + objMensajeBE.Apellido + "<br/><span style='font-weight:bold;'>EMail:</span> " + objMensajeBE.Correo + "<br/><span style='font-weight:bold;'>Teléfono:</span> " + objMensajeBE.Telefono + "<br/><span style='font-weight:bold;'>¿Cómo te ayudamos?:</span> " + objMensajeBE.ComoAyudar + "<br/><span style='font-weight:bold;'>Mensaje:</span> " + objMensajeBE.Mensaje;

                mensaje.To.Clear();
                mensaje.To.Add(contacto);
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Mensaje de " + empresa;
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Enviar_Amigo(string[] emails, string nombre, string foto, string descripcion, string producto, string url, decimal precio)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];

                mensaje.Body = nombre + " le ha enviado un correo<br/><br/>¡Mira este producto que encontré en NOOBOUT!<br/><br/><table><tr><td rowspan='3'><img style='width:300px' src='" + foto + "'/></td><td style='font-size:15pt;height:20px;'>" + producto + "</td></tr><tr><td valign='top'>" + descripcion + "</td></tr><tr><td style='text-align:right;font-size:12pt;font-weight:bold;'>S/. " + precio + "</td></tr></table><br/><br/><div style='width:100%;text-align:center;'>Para más información haz <a href='" + url + "'>click aquí</a></div>";

                mensaje.To.Clear();
                foreach(string m in emails)
                    mensaje.To.Add(m.Trim());
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Mira este producto NOOBOUT";
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Confirmar_Compra(UsuarioBE objUsuarioBE, CarritoBE objCarritoBE)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";
            string contacto = "";
            decimal subtotal = 0;

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];
                contacto = ConfigurationManager.AppSettings["Contacto"];

                mensaje.Body = "<span style='font-size:20pt'>Muchas Gracias</span><br/><br/>Su compra ha sido realizada satisfactoriamente.<br/><br/><span style='font-weight:bold;'>Facturado a:</span><br/>";
                
                if (objCarritoBE.Id_Tipo_Recibo == (int)Tipo_Recibo.Boleta)
                {
                    mensaje.Body += objUsuarioBE.Nombre_Completo.ToUpper() + "<br/>";
                }
                else if (objCarritoBE.Id_Tipo_Recibo == (int)Tipo_Recibo.Factura)
                {
                    mensaje.Body += objCarritoBE.Ruc + "<br/>";
                    mensaje.Body += objCarritoBE.Razon_Social.ToUpper() + "<br/>";
                }

                mensaje.Body += objCarritoBE.Direccion_Envio.Direccion.ToUpper() + " " + objCarritoBE.Direccion_Envio.Nombre_Distrito.ToUpper() + "<br/>";
                mensaje.Body += objCarritoBE.Direccion_Envio.Nombre_Provincia.ToUpper() + ", PERÚ<br/><br/>";

                mensaje.Body += "<table style='width:100%'>";
                mensaje.Body += "<tr style='font-weight:bold;text-align:center;'><td>ÍTEM</td><td>CANTIDAD</td><td>PRECIO</td><td>IMPORTE</td></tr>";
                foreach (Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                {
                    mensaje.Body += "<tr><td>" + cp.Nombre + "</td><td style='text-align:center;'>" + cp.Cantidad + "</td><td style='text-align:center;'>S/. " + cp.Precio + "</td><td style='text-align:center;'>S/. " + (cp.Precio * cp.Cantidad) + "</td></tr>";
                    subtotal += cp.Precio * cp.Cantidad;
                }
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>SubTotal:</td><td style='font-weight:bold;text-align:center;'>S/. " + subtotal + "</td></tr>";
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>Envío:</td><td style='font-weight:bold;text-align:center;'>S/. " + objCarritoBE.Precio_Envio + "</td></tr>";
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>Total:</td><td style='font-weight:bold;text-align:center;'>S/. " + (subtotal + objCarritoBE.Precio_Envio) + "</td></tr>";
                mensaje.Body += "</table>";

                mensaje.To.Clear();
                mensaje.To.Add(objUsuarioBE.Email);
                mensaje.Bcc.Add(contacto);
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Su compra ha sido realizada";
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Cambio_Estado_Pedido(PedidoBE objPedidoBE, EstadoPedido estado)
        {
            MailMessage mensaje = new MailMessage();
            String dominio = "";
            String empresa = "";
            string contacto = "";
            decimal subtotal = 0;

            try
            {
                dominio = ConfigurationManager.AppSettings["Dominio"];
                empresa = ConfigurationManager.AppSettings["Empresa"];
                contacto = ConfigurationManager.AppSettings["Contacto"];

                switch(estado)
                { 
                    case EstadoPedido.Pagado:
                        mensaje.Body = "<span style='font-size:20pt'>Muchas Gracias</span><br/><br/>Su pago ha sido realizado satisfactoriamente. Su producto estará llegando en los próximos días.<br/><br/>";
                        break;
                    case EstadoPedido.Expirado:
                        mensaje.Body = "<span style='font-size:20pt'>Lo sentimos</span><br/><br/>El plazo para pagar su pedido ha terminado.<br/><br/>";
                        break;
                    case EstadoPedido.Pedido:
                        mensaje.Body = "<span style='font-size:20pt'>Lo sentimos</span><br/><br/>Sentimos que haya decidido extornar su transacción. Si cambia de parecer, puede volver a realizar el pago con el mismo código de compra.<br/><br/>";
                        break;
                }
                mensaje.Body += "Pedido <b>N° " + objPedidoBE.Id_Pedido + "</b><br/><br/>";
                mensaje.Body += "<table style='width:100%'>";
                mensaje.Body += "<tr style='font-weight:bold;text-align:center;'><td>ÍTEM</td><td>CANTIDAD</td><td>PRECIO</td><td>IMPORTE</td></tr>";
                foreach (Pedido_ProductoBE cp in objPedidoBE.lstPedido_ProductoBE)
                {
                    mensaje.Body += "<tr><td>" + cp.Nombre + "</td><td style='text-align:center;'>" + cp.Cantidad + "</td><td style='text-align:center;'>S/. " + cp.Precio + "</td><td style='text-align:center;'>S/. " + (cp.Precio * cp.Cantidad) + "</td></tr>";
                    subtotal += cp.Precio * cp.Cantidad;
                }
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>SubTotal:</td><td style='font-weight:bold;text-align:center;'>S/. " + subtotal + "</td></tr>";
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>Envío:</td><td style='font-weight:bold;text-align:center;'>S/. " + objPedidoBE.Precio_Envio + "</td></tr>";
                mensaje.Body += "<tr><td colspan='2'></td><td style='text-align:right;'>Total:</td><td style='font-weight:bold;text-align:center;'>S/. " + (subtotal + objPedidoBE.Precio_Envio) + "</td></tr>";
                mensaje.Body += "</table>";

                mensaje.To.Clear();
                mensaje.To.Add(objPedidoBE.Correo_Usuario);
                mensaje.Bcc.Add(contacto);
                MailAddress from = new MailAddress("noreply@" + dominio, empresa);
                mensaje.From = from;

                AlternateView av_Html = AlternateView.CreateAlternateViewFromString(Get_Plantilla_Mail(mensaje.Body), null, "text/html");
                LinkedResource logo = new LinkedResource(Get_Logo_Path(), "image/png");
                logo.ContentId = "logo";
                av_Html.LinkedResources.Add(logo);

                mensaje.Subject = "Su compra ha sido realizada";
                mensaje.Body = "";
                mensaje.AlternateViews.Clear();
                mensaje.AlternateViews.Add(av_Html);

                Set_Servidor().Send(mensaje);

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}
