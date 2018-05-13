using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class DireccionBC
    {
        DireccionDALC objDireccionDALC = new DireccionDALC();

        public int Insert_Direccion(DireccionBE objDireccionBE)
        {
            try
            {
                return objDireccionDALC.Insert_Direccion(objDireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Update_Direccion(DireccionBE objDireccionBE)
        {
            try
            {
                return objDireccionDALC.Update_Direccion(objDireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Direccion(DireccionBE objDireccionBE)
        {
            try
            {
                objDireccionDALC.Insert_Update_Direccion(objDireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<DireccionBE> Select_Direccion()
        {
            try
            {
                return objDireccionDALC.Select_Direccion();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public DireccionBE Get_Direccion(Int32 id_direccion)
        {
            try
            {
                return objDireccionDALC.Get_Direccion(id_direccion);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Direccion(Int32 id_direccion)
        {
            try
            {
                objDireccionDALC.Delete_Direccion(id_direccion);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<DireccionBE> Select_Direccion_Usuario(Int32 id_usuario)
        {
            try
            {
                return objDireccionDALC.Select_Direccion_Usuario(id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
