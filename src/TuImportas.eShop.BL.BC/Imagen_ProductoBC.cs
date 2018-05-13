using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Imagen_ProductoBC
    {
        Imagen_ProductoDALC objImagen_ProductoDALC = new Imagen_ProductoDALC();

        public int Insert_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            try
            {
                return objImagen_ProductoDALC.Insert_Imagen_Producto(objImagen_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            try
            {
                objImagen_ProductoDALC.Update_Imagen_Producto(objImagen_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            try
            {
                return objImagen_ProductoDALC.Insert_Update_Imagen_Producto(objImagen_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Imagen_ProductoBE> Select_Imagen_Producto()
        {
            try
            {
                return objImagen_ProductoDALC.Select_Imagen_Producto();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Imagen_ProductoBE Get_Imagen_Producto(Int32 id_imagen, Int32 id_producto)
        {
            try
            {
                return objImagen_ProductoDALC.Get_Imagen_Producto(id_imagen, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Imagen_Producto(Int32 id_imagen, Int32 id_producto)
        {
            try
            {
                objImagen_ProductoDALC.Delete_Imagen_Producto(id_imagen, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
