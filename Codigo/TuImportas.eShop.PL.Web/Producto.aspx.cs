using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.PL.Web.usercontrol;

namespace TuImportas.eShop.PL.Web
{
    public partial class Producto : SharedServices
    {
        public static string ogTitulo = "";
        public string ogSiteName = "";
        public static string ogUrl = "";
        public static string ogDescripcion = "";
        public static string ogImagen = "";
        public string youtube = "";
        private static decimal precio = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    ViewState["ID_PRODUCTO"] = RouteData.Values["Id_Producto"];
                    LlenarOperadorLogistico();
                }

                CargarProducto();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
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

        private void LlenarOGTags(ProductoBE objProductoBE)
        {
            try
            {
                string dominio = ConfigurationManager.AppSettings["Dominio"];
                string empresa = ConfigurationManager.AppSettings["Empresa"];

                ogTitulo = objProductoBE.Nombre;
                ogSiteName = empresa;
                ogUrl = "http://" + dominio + "/Producto/" + objProductoBE.Id_Producto;
                ogDescripcion = objProductoBE.Descripcion_Corta;
                ogImagen = "http://" + dominio + "/images/productos/" + objProductoBE.lstImagen_ProductoBE[0].Nombre;
                
                precio = objProductoBE.Precio;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CargarProducto()
        {
            ProductoBE objProductoBE = new ProductoBE();
            ProductoBC objProductoBC = new ProductoBC();

            try
            {
                objProductoBE = objProductoBC.Get_Producto(Convert.ToInt32(ViewState["ID_PRODUCTO"]));

                lblDescripcion.Text = objProductoBE.Descripcion;
                lblNombre.Text = objProductoBE.Nombre;
                lblNombreLink.Text = objProductoBE.Nombre;
                lblPrecio.Text = objProductoBE.Precio.ToString();
                lblDetalle.Text = objProductoBE.Detalle;
                lblTecnica.Text = objProductoBE.Caracteristica_Tecnica;
                lblCategoriaLink.Text = "<a href=\"/Categoria/" + objProductoBE.lstCategoriaBE[0].Id_Categoria + "\">" + objProductoBE.lstCategoriaBE[0].Nombre + "</a>";
                youtube = objProductoBE.Youtube;

                int cantidadImagenes = objProductoBE.lstImagen_ProductoBE.Count;

                imgPrincipal.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[0].Nombre;
                imgSecundario2.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[0].Nombre;

                if (cantidadImagenes >= 2)
                    imgSecundario3.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[1].Nombre;
                else
                    imgSecundario3.Visible = false;

                if (cantidadImagenes >= 3)
                    imgSecundario4.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[2].Nombre;
                else
                    imgSecundario4.Visible = false;

                if (cantidadImagenes >= 4)
                    imgSecundario5.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[3].Nombre;
                else
                    imgSecundario5.Visible = false;

                CargarRelacionados(objProductoBE.lstCategoriaBE[0].Id_Categoria, objProductoBE.Id_Producto);

                LlenarOGTags(objProductoBE);
                CargarAtributos(objProductoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void CargarAtributos(ProductoBE objProductoBE)
        {
            DropDownList ddl = new DropDownList();

            try
            {
                //foreach (AtributoBE a in objProductoBE.lstAtributoBE)
                for (int i = objProductoBE.lstAtributoBE.Count - 1; i >= 0; i--)
                {
                    ddl = new DropDownList();
                    ddl.ID = "ddlAtributo" + objProductoBE.lstAtributoBE[i].Id_Atributo;
                    ddl.DataSource = (from ea in objProductoBE.lstElemento_AtributoBE where ea.Id_Atributo == objProductoBE.lstAtributoBE[i].Id_Atributo select ea).ToList();
                    ddl.DataTextField = "Nombre";
                    ddl.DataValueField = "Id_Elemento_Atributo";
                    ddl.DataBind();
                    ddl.Width = 186;
                    ddl.Style.Add("margin-left", "15px");
                    ddl.Style.Add("margin-bottom", "8px");
                    ddl.CssClass = "validate[required]";

                    Tools.DropDownPlaceHolder(ddl, objProductoBE.lstAtributoBE[i].Nombre);

                    pnlAtributos.Controls.AddAt(3, ddl);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CargarRelacionados(int idCategoria, int idProducto)
        {
            ProductoBC objProductoBC = new ProductoBC();
            List<ProductoBE> lstProductoBE = new List<ProductoBE>();
            ucProducto producto;

            try
            {
                lstProductoBE = objProductoBC.Select_Producto_Top_Categoria(idCategoria, idProducto);

                foreach (ProductoBE p in lstProductoBE)
                {
                    producto = (ucProducto)Page.LoadControl("~/usercontrol/ucProducto.ascx");
                    producto.SetParametros(p);

                    pnlRelacionados.Controls.Add(producto);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void lnkAnadir_Click(object sender, EventArgs e)
        {
            try
            {
                string atributos = "";

                foreach (Control control in pnlAtributos.Controls)
                {
                    if (control is DropDownList)
                    {
                        DropDownList ddl = (DropDownList)control;
                        atributos += ddl.Items[0].Text + "," + ddl.SelectedItem.Text + "," + ddl.SelectedValue + "|";
                    }
                }

                if (Tools.AñadirCarrito(Convert.ToInt32(ViewState["ID_PRODUCTO"]), Convert.ToInt32(txtCantidad.Text), atributos))
                {
                    eshop masterPage = (eshop)Page.Master;
                    masterPage.CargarItemsCarrito();
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        [WebMethod]
        public static void EnviarAmigo(string email, string nombre)
        {
            MailBC objMailBC = new MailBC();

            try
            {
                string[] correos = email.Split(';');

                objMailBC.Enviar_Amigo(correos, nombre, ogImagen, ogDescripcion, ogTitulo, ogUrl, precio);
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}