using System;
using System.Configuration;

namespace TuImportas.eShop.DL.DALC
{
    public class Tool
    {
        public static String GetCadenaConexion()
        {
            return ConfigurationManager.ConnectionStrings["CSIMPORTAS"].ToString();
        }
    }
}
