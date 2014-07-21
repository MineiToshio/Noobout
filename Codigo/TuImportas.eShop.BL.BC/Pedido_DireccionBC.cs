using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Pedido_DireccionBC
    {
        Pedido_DireccionDALC objPedido_DireccionDALC = new Pedido_DireccionDALC();

        public void Insert_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            try
            {
                objPedido_DireccionDALC.Insert_Pedido_Direccion(objPedido_DireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            try
            {
                objPedido_DireccionDALC.Update_Pedido_Direccion(objPedido_DireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            try
            {
                objPedido_DireccionDALC.Insert_Update_Pedido_Direccion(objPedido_DireccionBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Pedido_DireccionBE> Select_Pedido_Direccion()
        {
            try
            {
                return objPedido_DireccionDALC.Select_Pedido_Direccion();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Pedido_DireccionBE Get_Pedido_Direccion(Int32 id_pedido_direccion)
        {
            try
            {
                return objPedido_DireccionDALC.Get_Pedido_Direccion(id_pedido_direccion);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido_Direccion(Int32 id_pedido_direccion)
        {
            try
            {
                objPedido_DireccionDALC.Delete_Pedido_Direccion(id_pedido_direccion);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
