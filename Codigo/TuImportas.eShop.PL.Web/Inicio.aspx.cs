using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.PL.Web.usercontrol;

namespace TuImportas.eShop.PL.Web
{
    public partial class Inicio : SharedServices
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //if (!Page.IsPostBack)
                //{
                    CargarProducto();
                    CargarBotones();
                //}
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void CargarBotones()
        {
            Boton_InicioBC objBoton_InicioBC = new Boton_InicioBC();
            List<Boton_InicioBE> lstBoton_InicioBE = new List<Boton_InicioBE>();

            try
            {
                lstBoton_InicioBE = objBoton_InicioBC.Select_Boton_Inicio();

                lnkBotonInicio1.HRef = lstBoton_InicioBE[0].Url;
                lblBotonInicio1.Text = lstBoton_InicioBE[0].Nombre;
                lblBotonInicioDesc1.Text = lstBoton_InicioBE[0].Descripcion;

                lnkBotonInicio2.HRef = lstBoton_InicioBE[1].Url;
                lblBotonInicio2.Text = lstBoton_InicioBE[1].Nombre;
                lblBotonInicioDesc2.Text = lstBoton_InicioBE[1].Descripcion;

                lnkBotonInicio3.HRef = lstBoton_InicioBE[2].Url;
                lblBotonInicio3.Text = lstBoton_InicioBE[2].Nombre;
                lblBotonInicioDesc3.Text = lstBoton_InicioBE[2].Descripcion;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CargarProducto()
        {
            try
            {
                CargarDestacados();
                CargarNuevos(CasillaProducto.Nuevo);
                CargarNuevos(CasillaProducto.Popular);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CargarDestacados()
        {
            ProductoBC objProductoBC = new ProductoBC();
            List<ProductoBE> lstProductoBE = new List<ProductoBE>();
            ucProductoDestacado productoDestacado;
            Panel pnlSlide = new Panel();
            Panel pnlRow = new Panel();
            int row = 0;
            int contador = 0;

            try
            {
                lstProductoBE = objProductoBC.Select_Producto_Destacado();

                foreach (ProductoBE p in lstProductoBE)
                {

                    if (row == 0)
                    { 
                        pnlSlide = SlideDestacado();
                        pnlRow = Row();
                    }

                    productoDestacado = (ucProductoDestacado)Page.LoadControl("~/usercontrol/ucProductoDestacado.ascx");
                    productoDestacado.SetParametros(p);

                    pnlRow.Controls.Add(productoDestacado);

                    if (row == 2 || contador == lstProductoBE.Count - 1)
                    {
                        pnlSlide.Controls.Add(pnlRow);
                        pnlDestacados.Controls.Add(pnlSlide);
                        row = 0;
                    }
                    else
                        row++;

                    contador++;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void CargarNuevos(CasillaProducto casilla)
        {
            ProductoBC objProductoBC = new ProductoBC();
            List<ProductoBE> lstProductoBE = new List<ProductoBE>();
            ucProducto producto;

            try
            {
                switch (casilla)
                {
                    case CasillaProducto.Nuevo: 
                        lstProductoBE = objProductoBC.Select_Producto_Nuevo();
                        break;
                    case CasillaProducto.Popular:
                        lstProductoBE = objProductoBC.Select_Producto_Popular();
                        break;
                }

                foreach (ProductoBE p in lstProductoBE)
                {
                    producto = (ucProducto)Page.LoadControl("~/usercontrol/ucProducto.ascx");
                    producto.SetParametros(p);

                    switch (casilla)
                    {
                        case CasillaProducto.Nuevo:
                            pnlNuevos.Controls.Add(producto);
                            break;
                        case CasillaProducto.Popular:
                            pnlPopulares.Controls.Add(producto);
                            break;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        private Panel SlideDestacado()
        {
            Panel pnlSlide = new Panel();
            pnlSlide.CssClass = "slide";
            return pnlSlide;
        }

        private Panel Row()
        {
            Panel pnlSlide = new Panel();
            pnlSlide.CssClass = "row";
            return pnlSlide;
        }
    }
}