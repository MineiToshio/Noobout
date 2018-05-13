using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class CategoriaBC
    {
        CategoriaDALC objCategoriaDALC = new CategoriaDALC();

        public int Insert_Categoria(CategoriaBE objCategoriaBE)
        {
            try
            {
                return objCategoriaDALC.Insert_Categoria(objCategoriaBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Categoria(CategoriaBE objCategoriaBE)
        {
            try
            {
                objCategoriaDALC.Update_Categoria(objCategoriaBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Categoria(CategoriaBE objCategoriaBE)
        {
            try
            {
                return objCategoriaDALC.Insert_Update_Categoria(objCategoriaBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<CategoriaBE> Select_Categoria()
        {
            try
            {
                return objCategoriaDALC.Select_Categoria();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public CategoriaBE Get_Categoria(Int32 id_categoria)
        {
            try
            {
                return objCategoriaDALC.Get_Categoria(id_categoria);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Categoria(Int32 id_categoria)
        {
            try
            {
                objCategoriaDALC.Delete_Categoria(id_categoria);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
