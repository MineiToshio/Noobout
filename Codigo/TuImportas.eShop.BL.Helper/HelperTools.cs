using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuImportas.eShop.BL.Helper
{
    public class HelperTools
    {
        

        public static DateTime GetDate()
        {
            string zoneId = "SA Pacific Standard Time";
            TimeZoneInfo tzi = TimeZoneInfo.FindSystemTimeZoneById(zoneId);
            DateTime now = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, tzi);

            return now;
        }

        public static bool EsImagen(String ext)
        {
            try
            {
                if (ext.ToLower().Equals(".png") || ext.ToLower().Equals(".jpg") || ext.ToLower().Equals(".gif") || ext.ToLower().Equals(".jpeg") || ext.ToLower().Equals(".bmp"))
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
