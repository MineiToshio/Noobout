using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.PL.Web.usercontrol;

namespace TuImportas.eShop.PL.Web
{
    public partial class Tienda : SharedServices
    {
        public int idCategoria = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (!Page.IsPostBack)
                //{
                    if (RouteData.Values["Id_Categoria"] != null)
                    {
                        ViewState["ID_CATEGORIA"] = RouteData.Values["Id_Categoria"];
                        idCategoria = Convert.ToInt32(ViewState["ID_CATEGORIA"]);
                        pnlContenedorCategoria.Visible = false;
                        CargarProductos(Convert.ToInt32(ViewState["ID_CATEGORIA"]));

                        CategoriaBE objCategoriaBE = new CategoriaBC().Get_Categoria(Convert.ToInt32(ViewState["ID_CATEGORIA"]));

                        lblBusqueda.Text = "<span class=\"light\">Categoría: </span> &quot;" + objCategoriaBE.Nombre + "&quot;";
                    }
                    else
                    {
                        if (RouteData.Values["Busqueda_String"] != null)
                        {
                            string busqueda = RouteData.Values["Busqueda_String"].ToString();
                            Buscar(busqueda);

                            lblBusqueda.Text = "<span class=\"light\">Resultado: </span> &quot;" + busqueda + "&quot;";
                        }
                        else
                        { 
                            CargarProductos();
                        }

                        CargarFiltroCategorias(); 
                        pnlContenedorCategoria.Visible = true;
                        
                    }

                    CargarFiltroColores(); 
                //}
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void Buscar(string cadena)
        {
            ProductoBC objProductoBC = new ProductoBC();
            List<ProductoBE> lstProductoBE = new List<ProductoBE>();

            try
            {
                lstProductoBE = objProductoBC.Get_Producto_Buscar(cadena, true);

                MostrarProductos(lstProductoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void CargarFiltroColores()
        {
            ColorBC objColorBC = new ColorBC();
            List<ColorBE> lstColorBE = new List<ColorBE>();
            LinkButton lnk = new LinkButton();
            Label lbl = new Label();

            try
            {
                lstColorBE = objColorBC.Select_Color();

                foreach (ColorBE c in lstColorBE)
                {
                    lnk = new LinkButton();
                    lbl = new Label();
                    lnk.Attributes.Add("data-target", c.Nombre);
                    lnk.Attributes.Add("data-type", "color");
                    lnk.Attributes.Add("href", "#");
                    lnk.CssClass = "selectable detailed";

                    lbl.Text = "<i class=\"box\"></i> " + c.Nombre;

                    lnk.Controls.Add(lbl);
                    pnlColor.Controls.Add(lnk);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void CargarFiltroCategorias()
        {
            CategoriaBC objCategoriaBC = new CategoriaBC();
            List<CategoriaBE> lstCategoriaBE = new List<CategoriaBE>();
            LinkButton lnk = new LinkButton();
            Label lbl = new Label();

            try
            {
                lstCategoriaBE = objCategoriaBC.Select_Categoria();

                foreach (CategoriaBE c in lstCategoriaBE)
                {
                    lnk = new LinkButton();
                    lbl = new Label();
                    lnk.Attributes.Add("data-target", ".filter--" + c.Id_Categoria.ToString());
                    lnk.Attributes.Add("href", "#");
                    lnk.CssClass = "selectable";

                    lbl.Text = "<i class=\"box\"></i> " + c.Nombre;

                    lnk.Controls.Add(lbl);
                    pnlCategoria.Controls.Add(lnk);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private void CargarProductos(int idCategoria = 0)
        {
            ProductoBC objProductoBC = new ProductoBC();
            List<ProductoBE> lstProductoBE = new List<ProductoBE>();

            try
            {
                if(idCategoria == 0)
                    lstProductoBE = objProductoBC.Select_Producto_Activo();
                else
                    lstProductoBE = objProductoBC.Get_Producto_Categoria(idCategoria);

                MostrarProductos(lstProductoBE);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarProductos(List<ProductoBE> lstProductoBE)
        {
            ucProductoFiltro productoFiltro = new ucProductoFiltro();

            try
            {
                if (lstProductoBE != null)
                {
                    foreach (ProductoBE p in lstProductoBE)
                    {
                        productoFiltro = (ucProductoFiltro)Page.LoadControl("~/usercontrol/ucProductoFiltro.ascx");
                        productoFiltro.SetParametros(p);

                        isotopeContainer.Controls.Add(productoFiltro);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //[WebMethod]
        //public static string AgregarCarrito(int id_producto)
        //{
        //    if (Tools.AñadirCarrito(id_producto, 1, null))
        //    {
        //        //Page page = new Page();
        //        //eshop masterPage = (eshop)page.Master;
        //        //masterPage.CargarItemsCarrito();

        //        //using (Page page = new Page())
        //        //{
        //            //ucCarrito userControl = (ucCarrito)page.LoadControl("~/usercontrol/ucCarrito.ascx");

        //            CarritoBE objCarritoBE = (CarritoBE)HttpContext.Current.Session["CARRITO"];

        //            //userControl.SetParametros(objCarritoBE.lstCarrito_ProductoBE[objCarritoBE.lstCarrito_ProductoBE.Count - 1]);

        //            //page.Controls.Add(userControl);
        //            //using (StringWriter writer = new StringWriter())
        //            //{
        //                //page.Controls.Add(userControl);
        //                //HttpContext.Current.Server.Execute(page, writer, true);
        //                //return writer.ToString();

        //                //HtmlTextWriter myWriter = new HtmlTextWriter(writer);
        //                //userControl.RenderControl(myWriter);
        //                //return writer.ToString();

        //            //}


        //        //}

        //            return Tools.HtmlCarrito(objCarritoBE.lstCarrito_ProductoBE[objCarritoBE.lstCarrito_ProductoBE.Count - 1]);
        //    }
        //    else
        //        return "";
        //}
    }
}