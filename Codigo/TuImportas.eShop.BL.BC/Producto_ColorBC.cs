using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.DL.DALC;

namespace TuImportas.eShop.BL.BC
{
    public class Producto_ColorBC
    {
        Producto_ColorDALC objProducto_ColorDALC = new Producto_ColorDALC();

        public List<Producto_ColorBE> Select_Producto_Color(String lstCodigos)
        {
            try
            {
                return objProducto_ColorDALC.Select_Producto_Color(lstCodigos);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public void Insert_Producto_Color(Producto_ColorBE objProducto_ColorBE)
        {
            try
            {
                objProducto_ColorDALC.Insert_Producto_Color(objProducto_ColorBE);
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Delete_Producto_Color_xProducto(int idProducto)
        {
            try
            {
                objProducto_ColorDALC.Delete_Producto_Color_xProducto(idProducto);
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
