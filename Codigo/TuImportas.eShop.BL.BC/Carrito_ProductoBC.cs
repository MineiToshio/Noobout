using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Carrito_ProductoBC
    {
        Carrito_ProductoDALC objCarrito_ProductoDALC = new Carrito_ProductoDALC();

        public void Insert_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            try
            {
                objCarrito_ProductoDALC.Insert_Carrito_Producto(objCarrito_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            try
            {
                objCarrito_ProductoDALC.Update_Carrito_Producto(objCarrito_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            try
            {
                objCarrito_ProductoDALC.Insert_Update_Carrito_Producto(objCarrito_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Carrito_ProductoBE> Select_Carrito_Producto()
        {
            try
            {
                return objCarrito_ProductoDALC.Select_Carrito_Producto();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Carrito_ProductoBE Get_Carrito_Producto(Int32 id_carrito, Int32 id_producto)
        {
            try
            {
                return objCarrito_ProductoDALC.Get_Carrito_Producto(id_carrito, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Producto(Int32 id_carrito, Int32 id_producto)
        {
            try
            {
                objCarrito_ProductoDALC.Delete_Carrito_Producto(id_carrito, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
