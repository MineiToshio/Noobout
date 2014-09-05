using SPE.Api.Proxys;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web
{
	public partial class PagoEfectivo : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				GenerarCip();
				Tools.Comprar();
			}
		}

		private string GenerarRandom()
		{
			int value;
			Random randNumber = new Random(DateTime.Now.Millisecond);
			value = randNumber.Next(0, 99999999);

			return value.ToString("D8");
		}

		private void GenerarCip()
		{ 
			try
			{
				BEWSGenCIPRequestMod1 request = new BEWSGenCIPRequestMod1();
				string pathPublicKeyContraparte = ConfigurationManager.AppSettings["pathPublicKeyContraparte"];
				string pathPrivateKey = ConfigurationManager.AppSettings["pathPrivateKey"];
				string CodServicio = ConfigurationManager.AppSettings["cCodServicio"];

				request.CodServ = CodServicio;
				request.Xml = GenerarXML();

				SPE.Api.PagoEfectivo.PrivatePath = pathPrivateKey;
				SPE.Api.PagoEfectivo.PublicPathContraparte = pathPublicKeyContraparte;

				BEWSGenCIPResponseMod1 response = SPE.Api.PagoEfectivo.GenerarCIPMod1(request);

				if (response != null)
				{
					XmlDocument xml = new XmlDocument();
					xml.InnerXml = response.Xml;
					XmlNode element = xml.SelectSingleNode("ConfirSolPago");
					XmlNode elementchild = element.SelectSingleNode("CIP");
					XmlNode elementchildCIP = elementchild.SelectSingleNode("NumeroOrdenPago");
					string strCIP = elementchildCIP.InnerText;
					XmlNode elementchildtoken = element.SelectSingleNode("Token");
					string UrlRedirect = ConfigurationManager.AppSettings["UrlSPE"] + "/GenPagoIF.aspx?Token=" + elementchildtoken.InnerText;
					ltlUrl.Text = ltlUrl.Text + "<iframe style='width:100%;height:1285px;' src=" + UrlRedirect + "></iframe>";

					CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];
					objCarritoBE.Cip = elementchildCIP.InnerText;
					Session["CARRITO"] = objCarritoBE;
				}
			}
			catch (Exception)
			{
				throw;
			}
		}

		private string GenerarXML() 
		{ 
			string xml = "";
			string moneda = ConfigurationManager.AppSettings["cCodMoneda"];
			string codServicio = ConfigurationManager.AppSettings["cCodServicio"];
			string contacto = ConfigurationManager.AppSettings["Contacto"];
			UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];
			CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];
			string codTransaccion = GenerarRandom();
			DateTime fechaExpiracion = DateTime.Now.AddDays(5);

			xml += "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
			xml += "<SolPago>";
			xml += "  <IdMoneda>" + moneda + "</IdMoneda>";
			xml += "  <Total>" + objCarritoBE.Total + "</Total>";
			xml += "  <MetodosPago>1,2</MetodosPago>";
			xml += "  <CodServicio>" + codServicio + "</CodServicio>";
			xml += "  <Codtransaccion>" + codTransaccion + "</Codtransaccion>";
			xml += "  <EmailComercio>" + contacto + "</EmailComercio>";
			xml += "  <FechaAExpirar>" + fechaExpiracion.Day + "/" + fechaExpiracion.Month + "/" + fechaExpiracion.Year + " " + fechaExpiracion.Hour + ":" + fechaExpiracion.Minute + ":" + fechaExpiracion.Second + "</FechaAExpirar>";
			xml += "  <UsuarioId>" + objUsuarioBE.Id_Usuario + "</UsuarioId>";
			xml += "  <DataAdicional />";
			xml += "  <UsuarioNombre>" + objUsuarioBE.Nombre + "</UsuarioNombre>";
			xml += "  <UsuarioApellidos>" + objUsuarioBE.Apellido_Paterno + "</UsuarioApellidos>";
			xml += "  <UsuarioLocalidad>" + objCarritoBE.Direccion_Envio.Nombre_Distrito + "</UsuarioLocalidad>";
			xml += "  <UsuarioProvincia>" + objCarritoBE.Direccion_Envio.Id_Provincia + "</UsuarioProvincia>";
			xml += "  <UsuarioPais>PERU</UsuarioPais>";
			xml += "  <UsuarioAlias>" + objUsuarioBE.Usuario + "</UsuarioAlias>";
			xml += "  <UsuarioTipoDoc>DNI</UsuarioTipoDoc>";
			xml += "  <UsuarioNumeroDoc>" + objUsuarioBE.Dni + "</UsuarioNumeroDoc>";
			xml += "  <UsuarioEmail>" + objUsuarioBE.Email + "</UsuarioEmail>";
			xml += "  <ConceptoPago>Orden " + codTransaccion + "</ConceptoPago>";
			xml += "  <Detalles>";
			xml += "    <Detalle>";
			xml += "      <ConceptoPago>Orden " + codTransaccion + "</ConceptoPago>";
			xml += "      <Importe>" + objCarritoBE.Total + "</Importe>";
			xml += "    </Detalle>";
			xml += "  </Detalles>";
			xml += "</SolPago>";

			return xml;
		}
	}
}