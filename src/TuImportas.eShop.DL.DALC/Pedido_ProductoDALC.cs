using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Pedido_ProductoDALC
    {
        public int Insert_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            String cadena;
            String sql = "Pedido_Producto_Insert";
            SqlParameter[] arrParameters = new SqlParameter[4];
            int codigo = 0;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@cantidad", objPedido_ProductoBE.Cantidad);
                        arrParameters[1] = new SqlParameter("@id_pedido", objPedido_ProductoBE.Id_Pedido);
                        arrParameters[2] = new SqlParameter("@id_producto", objPedido_ProductoBE.Id_Producto);
                        arrParameters[3] = new SqlParameter("@precio", objPedido_ProductoBE.Precio);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        codigo = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }

                return codigo;
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}
