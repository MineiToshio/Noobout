using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Pedido_Producto_Elemento_AtributoDALC
    {
        public int Insert_Pedido_Producto_Elemento_Atributo(Pedido_Producto_Elemento_AtributoBE objPedido_Producto_Elemento_AtributoBE)
        {
            String cadena;
            String sql = "Pedido_Producto_Elemento_Atributo_Insert";
            SqlParameter[] arrParameters = new SqlParameter[3];
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

                        arrParameters[0] = new SqlParameter("@atributo", objPedido_Producto_Elemento_AtributoBE.Atributo);
                        arrParameters[1] = new SqlParameter("@element", objPedido_Producto_Elemento_AtributoBE.Element);
                        arrParameters[2] = new SqlParameter("@id_pedido_producto", objPedido_Producto_Elemento_AtributoBE.Id_Pedido_Producto);

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
