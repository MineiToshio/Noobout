using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class DevolucionBC
    {
        DevolucionDALC objDevolucionDALC = new DevolucionDALC();

        public int Insert_Devolucion(DevolucionBE objDevolucionBE)
        {
            try
            {
                return objDevolucionDALC.Insert_Devolucion(objDevolucionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Devolucion(DevolucionBE objDevolucionBE)
        {
            try
            {
                objDevolucionDALC.Update_Devolucion(objDevolucionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Devolucion(DevolucionBE objDevolucionBE)
        {
            try
            {
                return objDevolucionDALC.Insert_Update_Devolucion(objDevolucionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<DevolucionBE> Select_Devolucion()
        {
            try
            {
                return objDevolucionDALC.Select_Devolucion();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public DevolucionBE Get_Devolucion(Int32 id_devolucion, Int32 id_pedido, Int32 id_producto)
        {
            try
            {
                return objDevolucionDALC.Get_Devolucion(id_devolucion, id_pedido, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Devolucion(Int32 id_devolucion, Int32 id_pedido, Int32 id_producto)
        {
            try
            {
                objDevolucionDALC.Delete_Devolucion(id_devolucion, id_pedido, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
