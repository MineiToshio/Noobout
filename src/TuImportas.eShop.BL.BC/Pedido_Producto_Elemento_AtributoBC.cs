using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Pedido_Producto_Elemento_AtributoBC
    {
        Pedido_Producto_Elemento_AtributoDALC objPedido_Producto_Elemento_AtributoDALC = new Pedido_Producto_Elemento_AtributoDALC();

        public int Insert_Pedido_Producto_Elemento_Atributo(Pedido_Producto_Elemento_AtributoBE objPedido_Producto_Elemento_AtributoBE)
        {
            try
            {
                return objPedido_Producto_Elemento_AtributoDALC.Insert_Pedido_Producto_Elemento_Atributo(objPedido_Producto_Elemento_AtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
