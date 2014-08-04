using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class PedidoBC
    {
        PedidoDALC objPedidoDALC = new PedidoDALC();

        public int Insert_Pedido(PedidoBE objPedidoBE)
        {
            try
            {
                return objPedidoDALC.Insert_Pedido(objPedidoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Pedido(PedidoBE objPedidoBE)
        {
            try
            {
                objPedidoDALC.Update_Pedido(objPedidoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Pedido_Estado(int idPedido, int estado)
        {
            try
            {
                objPedidoDALC.Update_Pedido_Estado(idPedido, estado);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Pedido_Estado_Cip(string cip, int estado)
        {
            try
            {
                objPedidoDALC.Update_Pedido_Estado_Cip(cip, estado);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Pedido(PedidoBE objPedidoBE)
        {
            try
            {
                objPedidoDALC.Insert_Update_Pedido(objPedidoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<PedidoBE> Select_Pedido()
        {
            try
            {
                return objPedidoDALC.Select_Pedido();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<PedidoBE> Get_Pedido_Buscar(DateTime? fechaCompraInicio, DateTime? fechaCompraFin, string usuario, int? estado)
        {
            try
            {
                return objPedidoDALC.Get_Pedido_Buscar(fechaCompraInicio, fechaCompraFin, usuario, estado);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<PedidoBE> Select_Pedido_Usuario(int idUsuario)
        {
            try
            {
                return objPedidoDALC.Select_Pedido_Usuario(idUsuario);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido(Int32 id_forma_pago, Int32 id_pedido, Int32 id_usuario)
        {
            try
            {
                return objPedidoDALC.Get_Pedido(id_forma_pago, id_pedido, id_usuario);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido(Int32 id_forma_pago, Int32 id_pedido, Int32 id_usuario)
        {
            try
            {
                objPedidoDALC.Delete_Pedido(id_forma_pago, id_pedido, id_usuario);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido_Completo(int idPedido)
        {
            try
            {
                return objPedidoDALC.Get_Pedido_Completo(idPedido);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido_Completo_Cip(string cip)
        {
            try
            {
                return objPedidoDALC.Get_Pedido_Completo_Cip(cip);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Insert_Pedido_Completo(PedidoBE objPedidoBE)
        {
            Pedido_DireccionBC objPedido_DireccionBC = new Pedido_DireccionBC();
            Pedido_ProductoBC objPedido_ProductoBC = new Pedido_ProductoBC();

            try
            {
                int codigo = objPedidoDALC.Insert_Pedido(objPedidoBE);

                objPedidoBE.objDireccionEnvioBE.Id_Pedido = codigo;
                objPedidoBE.objDireccionFacturacionBE.Id_Pedido = codigo;

                objPedido_DireccionBC.Insert_Pedido_Direccion(objPedidoBE.objDireccionEnvioBE);
                objPedido_DireccionBC.Insert_Pedido_Direccion(objPedidoBE.objDireccionFacturacionBE);

                foreach (Pedido_ProductoBE pp in objPedidoBE.lstPedido_ProductoBE)
                {
                    pp.Id_Pedido = codigo;
                    objPedido_ProductoBC.Insert_Pedido_Producto(pp);
                }

                return codigo;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
