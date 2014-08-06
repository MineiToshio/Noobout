using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class SliderBC
    {
        SliderDALC objSliderDALC = new SliderDALC();

        public int Insert_Slider(SliderBE objSliderBE)
        {
            try
            {
                return objSliderDALC.Insert_Slider(objSliderBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Slider(SliderBE objSliderBE)
        {
            try
            {
                objSliderDALC.Update_Slider(objSliderBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Slider_Background(SliderBE objSliderBE)
        {
            try
            {
                objSliderDALC.Update_Slider_Background(objSliderBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Slider_Imagen(SliderBE objSliderBE)
        {
            try
            {
                objSliderDALC.Update_Slider_Imagen(objSliderBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<SliderBE> Select_Slider()
        {
            try
            {
                return objSliderDALC.Select_Slider();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public SliderBE Get_Slider(Int32 id_slider)
        {
            try
            {
                return objSliderDALC.Get_Slider(id_slider);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Slider(Int32 id_slider)
        {
            try
            {
                objSliderDALC.Delete_Slider(id_slider);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
