using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.DL.DALC;

namespace TuImportas.eShop.BL.BC
{
    public class UbigeoBC
    {
        UbigeoDALC objUbigeoDALC = new UbigeoDALC();

        public List<UbigeoBE> Get_Ubigeo_Distrito(String codDpto, String codProv)
        {
            try
            {
                return objUbigeoDALC.Get_Ubigeo_Distrito(codDpto, codProv);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<UbigeoBE> Get_Ubigeo_Provincia(String codDpto)
        {
            try
            {
                return objUbigeoDALC.Get_Ubigeo_Provincia(codDpto);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<UbigeoBE> Get_Ubigeo_Departamento()
        {
            try
            {
                return objUbigeoDALC.Get_Ubigeo_Departamento();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Ubigeo_Precio(UbigeoBE objUbigeoBE)
        {
            try
            {
                objUbigeoDALC.Update_Ubigeo_Precio(objUbigeoBE);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
