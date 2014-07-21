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
    public partial class Comprar_Paso2 : SharedServices
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
                        LlenarDirecciones();
                        LlenarOperadorLogistico();
                        TraerDatosOperadorLogistico();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void TraerDatosOperadorLogistico()
        {
            try
            {
                CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                if (objCarritoBE.Id_Operador != null)
                    hdIdOperador.Value = objCarritoBE.Id_Operador.ToString();
            }
            catch (Exception)
            {
                throw;
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
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarOperadorLogistico()
        {
            Operador_LogisticoBC objOperador_LogisticoBC = new Operador_LogisticoBC();
            List<Operador_LogisticoBE> lstOperadorLogisticoBE = new List<Operador_LogisticoBE>();
            Label lblOperador = new Label();

            try
            {
                lstOperadorLogisticoBE = objOperador_LogisticoBC.Select_Operador_Logistico_Habilitado();

                if (lstOperadorLogisticoBE != null)
                {
                    foreach (Operador_LogisticoBE w in lstOperadorLogisticoBE)
                    {
                        lblOperador.Text += GetOperadorItem(w);
                    }
                }
                else
                {
                    lblOperador.Text = "<tr><td class=\"price\" colspan='4'>NO HAY OPERADORES LOGÍTICOS DISPONIBLES</td></tr>";
                }

                bodyOperadorLogistico.Controls.Add(lblOperador);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private string GetOperadorItem(Operador_LogisticoBE objOperador_LogisticoBE)
        {
            String wishitem = "";

            try
            {
                wishitem += "<tr>";
                wishitem += "<td class=\"price\" style=\"width:40px;\"><span class=\"btn btn-danger circle pull-left\" onclick=\"SeleccionarOperador(" + objOperador_LogisticoBE.Id_Operador + ");\"><i class=\"icon-chevron\" name=\"checkOperador\" id=\"check" + objOperador_LogisticoBE.Id_Operador + "\"></i></span></td>";
                wishitem += "<td class=\"price\">" + objOperador_LogisticoBE.Nombre + "</td>";
                wishitem += "<td class=\"price\">S/. " + objOperador_LogisticoBE.Costo_Lima + "</td>";
                wishitem += "<td class=\"price\">S/. " + objOperador_LogisticoBE.Costo_Provincia + "</td>";
                wishitem += "<td class=\"price\">" + objOperador_LogisticoBE.Tiempo_Entrega + "</td>";
                wishitem += "</tr>";

                return wishitem;
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void LlenarDirecciones()
        {
            DireccionBC objDireccionBC = new DireccionBC();

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                List<DireccionBE> lstDireccionBE = objDireccionBC.Select_Direccion_Usuario(objUsuarioBE.Id_Usuario);

                ddlDireccionEnvio.DataSource = lstDireccionBE;
                ddlDireccionEnvio.DataTextField = "Nombre";
                ddlDireccionEnvio.DataValueField = "Id_Direccion";
                ddlDireccionEnvio.DataBind();
                ddlDireccionEnvio.Items.Insert(0, new ListItem("Dirección de Envío", "-1"));
                ddlDireccionEnvio.Items[0].Attributes.Add("disabled", "disabled");
                ddlDireccionEnvio.Items[0].Attributes.Add("selected", "selected");
                ddlDireccionEnvio.Items[0].Attributes.Add("style", "display:none;");

                ddlDireccionFacturacion.DataSource = lstDireccionBE;
                ddlDireccionFacturacion.DataTextField = "Nombre";
                ddlDireccionFacturacion.DataValueField = "Id_Direccion";
                ddlDireccionFacturacion.DataBind();
                ddlDireccionFacturacion.Items.Insert(0, new ListItem("Dirección de Facturación", "-1"));
                ddlDireccionFacturacion.Items[0].Attributes.Add("disabled", "disabled");
                ddlDireccionFacturacion.Items[0].Attributes.Add("selected", "selected");
                ddlDireccionFacturacion.Items[0].Attributes.Add("style", "display:none;");

                TraerDatosDirecciones();
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void TraerDatosDirecciones()
        {
            try
            {
                CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                if (objCarritoBE.Id_Direccion_Envio != null)
                    ddlDireccionEnvio.SelectedValue = objCarritoBE.Id_Direccion_Envio.ToString(); ;
                if (objCarritoBE.Id_Direccion_Facturacion != null)
                    ddlDireccionFacturacion.SelectedValue = objCarritoBE.Id_Direccion_Facturacion.ToString();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        [WebMethod]
        public static DireccionBE DatosDireccion(int idDireccion, int tipoDireccion)
        {
            try
            {
                DireccionBC objDireccionBC = new DireccionBC();

                DireccionBE objDireccionBE = objDireccionBC.Get_Direccion(idDireccion);

                CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

                if (tipoDireccion == 1) //Envio
                {
                    //objCarritoBE.Precio_Envio = objDireccionBE.Precio_Envio;
                    objCarritoBE.Direccion_Envio = objDireccionBE;
                }
                else
                {
                    objCarritoBE.Direccion_Facturacion = objDireccionBE;
                }

                
                HttpContext.Current.Session["CARRITO"] = objCarritoBE;

                return objDireccionBE;
            }
            catch (Exception ex)
            {
                LogFile.EscribirLog(ex);
                throw;
            }
        }

        protected void lnkContinuar_Click(object sender, EventArgs e)
        {
            Operador_LogisticoBC objOperador_LogisticoBC = new Operador_LogisticoBC();
            Operador_LogisticoBE objOperador_LogisticoBE = new Operador_LogisticoBE();

            try
            {
                if (Tools.EstaLogueado())
                {
                    CarritoBE objCarritoBE = (CarritoBE)Session["CARRITO"];

                    objCarritoBE.Id_Direccion_Envio = Convert.ToInt32(ddlDireccionEnvio.SelectedValue);
                    objCarritoBE.Id_Direccion_Facturacion = Convert.ToInt32(ddlDireccionFacturacion.SelectedValue);

                    objCarritoBE.Id_Operador = Convert.ToInt32(hdIdOperador.Value);

                    objOperador_LogisticoBE = objOperador_LogisticoBC.Get_Operador_Logistico((int)objCarritoBE.Id_Operador);

                    objCarritoBE.Tiempo_Entrega = objOperador_LogisticoBE.Tiempo_Entrega;
                    objCarritoBE.Nombre_Operador_Logistico = objOperador_LogisticoBE.Nombre;
                    if (objCarritoBE.Direccion_Envio.Id_Departamento == "15")
                        objCarritoBE.Precio_Envio = objOperador_LogisticoBE.Costo_Lima;
                    else
                        objCarritoBE.Precio_Envio = objOperador_LogisticoBE.Costo_Provincia;

                    objCarritoBE.PasosCarrito = EtapaCompra.Compra2;

                    Session["CARRITO"] = objCarritoBE;

                    Response.Redirect("/Comprar3");
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}