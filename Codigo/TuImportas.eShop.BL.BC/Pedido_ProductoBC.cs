using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Pedido_ProductoBC
    {
        Pedido_ProductoDALC objPedido_ProductoDALC = new Pedido_ProductoDALC();

        public void Insert_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            try
            {
                objPedido_ProductoDALC.Insert_Pedido_Producto(objPedido_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            try
            {
                objPedido_ProductoDALC.Update_Pedido_Producto(objPedido_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            try
            {
                objPedido_ProductoDALC.Insert_Update_Pedido_Producto(objPedido_ProductoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Pedido_ProductoBE> Select_Pedido_Producto()
        {
            try
            {
                return objPedido_ProductoDALC.Select_Pedido_Producto();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Pedido_ProductoBE Get_Pedido_Producto(Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_pedido, Int32 id_producto)
        {
            try
            {
                return objPedido_ProductoDALC.Get_Pedido_Producto(id_direccion_envio, id_direccion_facturacion, id_pedido, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido_Producto(Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_pedido, Int32 id_producto)
        {
            try
            {
                objPedido_ProductoDALC.Delete_Pedido_Producto(id_direccion_envio, id_direccion_facturacion, id_pedido, id_producto);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
