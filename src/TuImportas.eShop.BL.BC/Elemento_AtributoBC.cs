using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Elemento_AtributoBC
    {
        Elemento_AtributoDALC objElemento_AtributoDALC = new Elemento_AtributoDALC();

        public void Insert_Elemento_Atributo(Elemento_AtributoBE objElemento_AtributoBE)
        {
            try
            {
                objElemento_AtributoDALC.Insert_Elemento_Atributo(objElemento_AtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Elemento_Atributo(Elemento_AtributoBE objElemento_AtributoBE)
        {
            try
            {
                objElemento_AtributoDALC.Update_Elemento_Atributo(objElemento_AtributoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Elemento_AtributoBE> Select_Elemento_Atributo()
        {
            try
            {
                return objElemento_AtributoDALC.Select_Elemento_Atributo();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Elemento_AtributoBE> Get_Elemento_Atributo_Atributo(int idAtributo)
        {
            try
            {
                return objElemento_AtributoDALC.Get_Elemento_Atributo_Atributo(idAtributo);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Elemento_AtributoBE Get_Elemento_Atributo(Int32 id_atributo, Int32 id_elemento_atributo)
        {
            try
            {
                return objElemento_AtributoDALC.Get_Elemento_Atributo(id_atributo, id_elemento_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Elemento_Atributo(Int32 id_elemento_atributo)
        {
            try
            {
                objElemento_AtributoDALC.Delete_Elemento_Atributo(id_elemento_atributo);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
