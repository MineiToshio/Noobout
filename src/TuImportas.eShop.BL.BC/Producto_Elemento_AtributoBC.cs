using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Producto_Elemento_AtributoBC
    {
        Producto_Elemento_AtributoDALC objProducto_Elemento_AtributoDALC = new Producto_Elemento_AtributoDALC();

        public void Insert_Producto_Elemento_Atributo(Producto_Elemento_AtributoBE objProducto_Elemento_AtributoBE)
        {
            try
            {
                objProducto_Elemento_AtributoDALC.Insert_Producto_Elemento_Atributo(objProducto_Elemento_AtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Producto_Elemento_AtributoBE> Select_Producto_Elemento_Atributo()
        {
            try
            {
                return objProducto_Elemento_AtributoDALC.Select_Producto_Elemento_Atributo();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto_Elemento_Atributo(Int32 id_elemento_atributo, Int32 id_producto)
        {
            try
            {
                objProducto_Elemento_AtributoDALC.Delete_Producto_Elemento_Atributo(id_elemento_atributo, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }


        public void Delete_Producto_Elemento_Atributo_Producto(Int32 id_producto)
        {
            try
            {
                objProducto_Elemento_AtributoDALC.Delete_Producto_Elemento_Atributo_Producto(id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}
