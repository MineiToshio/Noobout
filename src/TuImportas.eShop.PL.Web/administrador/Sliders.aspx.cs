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
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
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
            try
            {
                if (e.CommandName.Equals("Eliminar"))
                {
                    SliderBC objSliderBC = new SliderBC();

                    String[] arg = e.CommandArgument.ToString().Split(',');

                    objSliderBC.Delete_Slider(Convert.ToInt32(arg[0]));
                    string path = MapPath(".." + PATH_IMG_BACK);
                    File.Delete(path + arg[1]);
                    File.Delete(path + arg[2]);

                    LlenarSlider();
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void btnActualizarOrden_Click(object sender, EventArgs e)
        {
            SliderBC objSliderBC = new SliderBC();
            SliderBE objSliderBE = new SliderBE();

            try
            {
                for (int i = 0; i < gvSliders.Rows.Count; i++)
                {
                    TextBox txtOrden = (TextBox)gvSliders.Rows[i].FindControl("txtOrden");

                    objSliderBE = new SliderBE();
                    objSliderBE.Id_Slider = Convert.ToInt32(gvSliders.DataKeys[i].Value);
                    objSliderBE.Orden = Convert.ToInt32(txtOrden.Text.Trim());

                    objSliderBC.Update_Slider_Orden(objSliderBE);
                }

                //Tools.Alert("El orden se actualizó satisfactoriamente", "Cambiar Orden", GetType(), this);
                LlenarSlider();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}