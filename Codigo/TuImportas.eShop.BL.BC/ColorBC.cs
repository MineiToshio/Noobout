using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class ColorBC
    {
        ColorDALC objColorDALC = new ColorDALC();

        public int Insert_Color(ColorBE objColorBE)
        {
            try
            {
                return objColorDALC.Insert_Color(objColorBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Color(ColorBE objColorBE)
        {
            try
            {
                objColorDALC.Update_Color(objColorBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Color(ColorBE objColorBE)
        {
            try
            {
                return objColorDALC.Insert_Update_Color(objColorBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<ColorBE> Select_Color()
        {
            try
            {
                return objColorDALC.Select_Color();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public ColorBE Get_Color(Int32 id_color)
        {
            try
            {
                return objColorDALC.Get_Color(id_color);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Color(Int32 id_color)
        {
            try
            {
                objColorDALC.Delete_Color(id_color);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
