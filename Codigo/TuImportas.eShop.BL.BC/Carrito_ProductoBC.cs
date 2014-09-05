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

        public int Insert_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            try
            {
                return objCarrito_ProductoDALC.Insert_Carrito_Producto(objCarrito_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Carrito_Producto_Completo(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            Carrito_Producto_Elemento_AtributoBC objCarrito_Producto_Elemento_AtributoBC = new Carrito_Producto_Elemento_AtributoBC();

            try
            {
                int id_carrito_producto = objCarrito_ProductoDALC.Insert_Carrito_Producto(objCarrito_ProductoBE);

                foreach (Carrito_Producto_Elemento_AtributoBE cp in objCarrito_ProductoBE.lstCarrito_Producto_Elemento_AtributoBE)
                {
                    cp.Id_Carrito_Producto = id_carrito_producto;
                    objCarrito_Producto_Elemento_AtributoBC.Insert_Carrito_Producto_Elemento_Atributo(cp);
                }

                return id_carrito_producto;
            }
            catch (Exception)
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

        public Carrito_ProductoBE Get_Carrito_Producto(Int32 id_carrito_producto)
        {
            try
            {
                return objCarrito_ProductoDALC.Get_Carrito_Producto(id_carrito_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Producto(Int32 idCarritoProducto)
        {
            try
            {
                objCarrito_ProductoDALC.Delete_Carrito_Producto(idCarritoProducto);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
