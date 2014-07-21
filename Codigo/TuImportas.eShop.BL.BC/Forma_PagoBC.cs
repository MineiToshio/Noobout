using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Forma_PagoBC
    {
        Forma_PagoDALC objForma_PagoDALC = new Forma_PagoDALC();

        public void Insert_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            try
            {
                objForma_PagoDALC.Insert_Forma_Pago(objForma_PagoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            try
            {
                objForma_PagoDALC.Update_Forma_Pago(objForma_PagoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            try
            {
                objForma_PagoDALC.Insert_Update_Forma_Pago(objForma_PagoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Forma_PagoBE> Select_Forma_Pago()
        {
            try
            {
                return objForma_PagoDALC.Select_Forma_Pago();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Forma_PagoBE Get_Forma_Pago(Int32 id_forma_pago)
        {
            try
            {
                return objForma_PagoDALC.Get_Forma_Pago(id_forma_pago);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Forma_Pago(Int32 id_forma_pago)
        {
            try
            {
                objForma_PagoDALC.Delete_Forma_Pago(id_forma_pago);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
