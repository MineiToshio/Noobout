using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Operador_LogisticoBC
    {
        Operador_LogisticoDALC objOperador_LogisticoDALC = new Operador_LogisticoDALC();

        public int Insert_Operador_Logistico(Operador_LogisticoBE objOperador_LogisticoBE)
        {
            try
            {
                return objOperador_LogisticoDALC.Insert_Operador_Logistico(objOperador_LogisticoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Operador_Logistico(Operador_LogisticoBE objOperador_LogisticoBE)
        {
            try
            {
                objOperador_LogisticoDALC.Update_Operador_Logistico(objOperador_LogisticoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Operador_Activo(int idOperador)
        {
            try
            {
                objOperador_LogisticoDALC.Update_Operador_Activo(idOperador);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Operador_LogisticoBE> Select_Operador_Logistico()
        {
            try
            {
                return objOperador_LogisticoDALC.Select_Operador_Logistico();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Operador_LogisticoBE> Select_Operador_Logistico_Habilitado()
        {
            try
            {
                return objOperador_LogisticoDALC.Select_Operador_Logistico_Habilitado();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Operador_LogisticoBE Get_Operador_Logistico(Int32 id_operador)
        {
            try
            {
                return objOperador_LogisticoDALC.Get_Operador_Logistico(id_operador);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
