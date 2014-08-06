using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Sliders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        MostrarSlider();
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarSlider()
        {
            SliderBC objSliderBC = new SliderBC();

            try
            {
                gvSliders.DataSource = objSliderBC.Select_Slider();
                gvSliders.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void gvSliders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int a;
        }
    }
}