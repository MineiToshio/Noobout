using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Pedido_ProductoBC
    {
        Pedido_ProductoDALC objPedido_ProductoDALC = new Pedido_ProductoDALC();

        public int Insert_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            try
            {
                return objPedido_ProductoDALC.Insert_Pedido_Producto(objPedido_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}
