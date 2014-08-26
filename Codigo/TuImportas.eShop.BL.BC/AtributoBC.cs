using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class AtributoBC
    {
        AtributoDALC objAtributoDALC = new AtributoDALC();

        public int Insert_Atributo(AtributoBE objAtributoBE)
        {
            try
            {
                return objAtributoDALC.Insert_Atributo(objAtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Atributo(AtributoBE objAtributoBE)
        {
            try
            {
                objAtributoDALC.Update_Atributo(objAtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<AtributoBE> Select_Atributo()
        {
            try
            {
                return objAtributoDALC.Select_Atributo();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<AtributoBE> Get_Atributo_No_Producto(Int32 id_producto)
        {
            try
            {
                return objAtributoDALC.Get_Atributo_No_Producto(id_producto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<AtributoBE> Get_Atributo_Producto(Int32 id_producto)
        {
            try
            {
                return objAtributoDALC.Get_Atributo_Producto(id_producto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public AtributoBE Get_Atributo(Int32 id_atributo)
        {
            try
            {
                return objAtributoDALC.Get_Atributo(id_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Atributo(Int32 id_atributo)
        {
            try
            {
                objAtributoDALC.Delete_Atributo(id_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
