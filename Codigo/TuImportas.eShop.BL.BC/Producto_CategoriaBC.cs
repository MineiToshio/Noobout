using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Producto_CategoriaBC
    {
        Producto_CategoriaDALC objProducto_CategoriaDALC = new Producto_CategoriaDALC();

        public void Insert_Producto_Categoria(Producto_CategoriaBE objProducto_CategoriaBE)
        {
            try
            {
                objProducto_CategoriaDALC.Insert_Producto_Categoria(objProducto_CategoriaBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Producto_CategoriaBE> Select_Producto_Categoria()
        {
            try
            {
                return objProducto_CategoriaDALC.Select_Producto_Categoria();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Producto_CategoriaBE Get_Producto_Categoria(Int32 id_categoria, Int32 id_producto)
        {
            try
            {
                return objProducto_CategoriaDALC.Get_Producto_Categoria(id_categoria, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto_Categoria(Int32 id_categoria, Int32 id_producto)
        {
            try
            {
                objProducto_CategoriaDALC.Delete_Producto_Categoria(id_categoria, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto_Categoria_xProducto(Int32 id_producto)
        {
            try
            {
                objProducto_CategoriaDALC.Delete_Producto_Categoria_xProducto(id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}
