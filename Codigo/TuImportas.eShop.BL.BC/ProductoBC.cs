using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class ProductoBC
    {
        ProductoDALC objProductoDALC = new ProductoDALC();

        public int Insert_Producto(ProductoBE objProductoBE)
        {
            try
            {
                return objProductoDALC.Insert_Producto(objProductoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Insert_Producto_Completo(ProductoBE objProductoBE)
        {
            Producto_ColorBE objProductoColorBE = null;
            Producto_ColorBC objProductoColorBC = new Producto_ColorBC();
            Producto_CategoriaBE objProducto_CategoriaBE = new Producto_CategoriaBE();
            Producto_CategoriaBC objProducto_CategoriaBC = new Producto_CategoriaBC();
            Imagen_ProductoBC objImagen_ProductoBC = new Imagen_ProductoBC();

            try
            {
                objProductoBE.Id_Producto = Insert_Producto(objProductoBE);

                foreach (ColorBE c in objProductoBE.lstColorBE)
                {
                    objProductoColorBE = new Producto_ColorBE();
                    objProductoColorBE.Id_Color = c.Id_Color;
                    objProductoColorBE.Id_Producto = objProductoBE.Id_Producto;
                    objProductoColorBC.Insert_Producto_Color(objProductoColorBE);
                }

                foreach (CategoriaBE c in objProductoBE.lstCategoriaBE)
                {
                    objProducto_CategoriaBE = new Producto_CategoriaBE();
                    objProducto_CategoriaBE.Id_Categoria = c.Id_Categoria;
                    objProducto_CategoriaBE.Id_Producto = objProductoBE.Id_Producto;
                    objProducto_CategoriaBC.Insert_Producto_Categoria(objProducto_CategoriaBE);
                }

                for (int i = 0; i < objProductoBE.lstImagen_ProductoBE.Count; i++)
                {
                    objProductoBE.lstImagen_ProductoBE[i].Id_Producto = objProductoBE.Id_Producto;
                    int id_imagen = objImagen_ProductoBC.Insert_Imagen_Producto(objProductoBE.lstImagen_ProductoBE[i]);
                    objProductoBE.lstImagen_ProductoBE[i].Nombre = id_imagen + objProductoBE.lstImagen_ProductoBE[i].Nombre;
                }

                return objProductoBE.Id_Producto;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Producto(ProductoBE objProductoBE)
        {
            try
            {
                objProductoDALC.Update_Producto(objProductoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Producto_Completo(ProductoBE objProductoBE)
        {
            Producto_ColorBE objProductoColorBE = null;
            Producto_ColorBC objProductoColorBC = new Producto_ColorBC();
            Producto_CategoriaBE objProducto_CategoriaBE = new Producto_CategoriaBE();
            Producto_CategoriaBC objProducto_CategoriaBC = new Producto_CategoriaBC();

            try
            {
                Update_Producto(objProductoBE);

                objProductoColorBC.Delete_Producto_Color_xProducto(objProductoBE.Id_Producto);

                foreach (ColorBE c in objProductoBE.lstColorBE)
                {
                    objProductoColorBE = new Producto_ColorBE();
                    objProductoColorBE.Id_Color = c.Id_Color;
                    objProductoColorBE.Id_Producto = objProductoBE.Id_Producto;
                    objProductoColorBC.Insert_Producto_Color(objProductoColorBE);
                }

                objProducto_CategoriaBC.Delete_Producto_Categoria_xProducto(objProductoBE.Id_Producto);

                foreach (CategoriaBE c in objProductoBE.lstCategoriaBE)
                {
                    objProducto_CategoriaBE = new Producto_CategoriaBE();
                    objProducto_CategoriaBE.Id_Categoria = c.Id_Categoria;
                    objProducto_CategoriaBE.Id_Producto = objProductoBE.Id_Producto;
                    objProducto_CategoriaBC.Insert_Producto_Categoria(objProducto_CategoriaBE);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        public int Insert_Update_Producto(ProductoBE objProductoBE)
        {
            try
            {
                return objProductoDALC.Insert_Update_Producto(objProductoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto()
        {
            try
            {
                return objProductoDALC.Select_Producto();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public ProductoBE Get_Producto(Int32 id_producto)
        {
            try
            {
                return objProductoDALC.Get_Producto(id_producto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Delete_Producto(Int32 id_producto)
        {
            try
            {
                objProductoDALC.Delete_Producto(id_producto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Destacado()
        {
            try
            {
                return objProductoDALC.Select_Producto_Destacado();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Nuevo()
        {
            try
            {
                return objProductoDALC.Select_Producto_Nuevo();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Popular()
        {
            try
            {
                return objProductoDALC.Select_Producto_Popular();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Top_Categoria(int idCategoria, int idProducto)
        {
            try
            {
                return objProductoDALC.Select_Producto_Top_Categoria(idCategoria, idProducto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Get_Producto_Categoria(int idCategoria)
        {
            try
            {
                return objProductoDALC.Get_Producto_Categoria(idCategoria);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Get_Producto_Buscar(string busqueda)
        {
            try
            {
                return objProductoDALC.Get_Producto_Buscar(busqueda);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Producto_Activo(Int32 id_producto)
        {
            try
            {
                objProductoDALC.Update_Producto_Activo(id_producto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Activo()
        {
            try
            {
                return objProductoDALC.Select_Producto_Activo();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
