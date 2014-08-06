using System;
using System.Collections.Generic;
using System.IO;
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
        const string PATH_IMG_BACK = "/images/sliders/";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarSlider();
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarSlider()
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
            if (e.CommandName.Equals("Eliminar"))
            {
                SliderBC objSliderBC = new SliderBC();

                String[] arg = e.CommandArgument.ToString().Split(',');

                objSliderBC.Delete_Slider(Convert.ToInt32(arg[0]));
                string path = MapPath(PATH_IMG_BACK);
                File.Delete(path + arg[1]);
                File.Delete(path + arg[2]);

                LlenarSlider();
            }
        }
    }
}