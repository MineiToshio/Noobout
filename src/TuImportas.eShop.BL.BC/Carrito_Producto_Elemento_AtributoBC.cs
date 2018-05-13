using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Carrito_Producto_Elemento_AtributoBC
    {
        Carrito_Producto_Elemento_AtributoDALC objCarrito_Producto_Elemento_AtributoDALC = new Carrito_Producto_Elemento_AtributoDALC();

        public void Insert_Carrito_Producto_Elemento_Atributo(Carrito_Producto_Elemento_AtributoBE objCarrito_Producto_Elemento_AtributoBE)
        {
            try
            {
                objCarrito_Producto_Elemento_AtributoDALC.Insert_Carrito_Producto_Elemento_Atributo(objCarrito_Producto_Elemento_AtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Carrito_Producto_Elemento_AtributoBE Get_Carrito_Producto_Elemento_Atributo(Int32 id_carrito_producto, Int32 id_elemento_atributo)
        {
            try
            {
                return objCarrito_Producto_Elemento_AtributoDALC.Get_Carrito_Producto_Elemento_Atributo(id_carrito_producto, id_elemento_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Producto_Elemento_Atributo(Int32 id_carrito_producto, Int32 id_elemento_atributo)
        {
            try
            {
                objCarrito_Producto_Elemento_AtributoDALC.Delete_Carrito_Producto_Elemento_Atributo(id_carrito_producto, id_elemento_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
