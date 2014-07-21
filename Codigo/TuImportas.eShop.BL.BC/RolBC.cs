using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class RolBC
    {
        RolDALC objRolDALC = new RolDALC();

        public void Insert_Rol(RolBE objRolBE)
        {
            try
            {
                objRolDALC.Insert_Rol(objRolBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Rol(RolBE objRolBE)
        {
            try
            {
                objRolDALC.Update_Rol(objRolBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Rol(RolBE objRolBE)
        {
            try
            {
                objRolDALC.Insert_Update_Rol(objRolBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<RolBE> Select_Rol()
        {
            try
            {
                return objRolDALC.Select_Rol();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public RolBE Get_Rol(Int32 id_rol)
        {
            try
            {
                return objRolDALC.Get_Rol(id_rol);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Rol(Int32 id_rol)
        {
            try
            {
                objRolDALC.Delete_Rol(id_rol);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
