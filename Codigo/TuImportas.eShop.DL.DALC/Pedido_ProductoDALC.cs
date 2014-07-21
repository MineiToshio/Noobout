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
        public void Insert_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            String cadena;
            String sql = "Pedido_Producto_Insert";
            SqlParameter[] arrParameters = new SqlParameter[5];

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
                        arrParameters[4] = new SqlParameter("@color", objPedido_ProductoBE.Color);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        cmd.ExecuteNonQuery();
                    }
                }

            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            String cadena;
            String sql = "Pedido_Producto_Update";
            SqlParameter[] arrParameters = new SqlParameter[6];

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
                        arrParameters[1] = new SqlParameter("@id_direccion_envio", objPedido_ProductoBE.Id_Direccion_Envio);
                        arrParameters[2] = new SqlParameter("@id_direccion_facturacion", objPedido_ProductoBE.Id_Direccion_Facturacion);
                        arrParameters[3] = new SqlParameter("@id_pedido", objPedido_ProductoBE.Id_Pedido);
                        arrParameters[4] = new SqlParameter("@id_producto", objPedido_ProductoBE.Id_Producto);
                        arrParameters[5] = new SqlParameter("@precio", objPedido_ProductoBE.Precio);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Pedido_Producto(Pedido_ProductoBE objPedido_ProductoBE)
        {
            String cadena;
            String sql = "Pedido_Producto_Insert_Update";
            SqlParameter[] arrParameters = new SqlParameter[6];

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
                        arrParameters[1] = new SqlParameter("@id_direccion_envio", objPedido_ProductoBE.Id_Direccion_Envio);
                        arrParameters[2] = new SqlParameter("@id_direccion_facturacion", objPedido_ProductoBE.Id_Direccion_Facturacion);
                        arrParameters[3] = new SqlParameter("@id_pedido", objPedido_ProductoBE.Id_Pedido);
                        arrParameters[4] = new SqlParameter("@id_producto", objPedido_ProductoBE.Id_Producto);
                        arrParameters[5] = new SqlParameter("@precio", objPedido_ProductoBE.Precio);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Pedido_ProductoBE> Select_Pedido_Producto()
        {
            String cadena;
            String sql = "Pedido_Producto_Select";
            Pedido_ProductoBE objPedido_ProductoBE = null;
            List<Pedido_ProductoBE> lstPedido_ProductoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                if(lstPedido_ProductoBE == null)
                                    lstPedido_ProductoBE = new List<Pedido_ProductoBE>();

                                objPedido_ProductoBE = new Pedido_ProductoBE();
                                objPedido_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objPedido_ProductoBE.Id_Direccion_Envio = Convert.ToInt32(dr["id_direccion_envio"]);
                                objPedido_ProductoBE.Id_Direccion_Facturacion = Convert.ToInt32(dr["id_direccion_facturacion"]);
                                objPedido_ProductoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objPedido_ProductoBE.Precio = Convert.ToDecimal(dr["precio"]);

                                lstPedido_ProductoBE.Add(objPedido_ProductoBE);
                            }
                        }
                    }
                }

                return lstPedido_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Pedido_ProductoBE Get_Pedido_Producto(Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_pedido, Int32 id_producto)
        {
            String cadena;
            String sql = "Pedido_Producto_Get";
            SqlParameter[] arrParameters = new SqlParameter[4];
            Pedido_ProductoBE objPedido_ProductoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_direccion_envio", id_direccion_envio);
                        arrParameters[1] = new SqlParameter("@id_direccion_facturacion", id_direccion_facturacion);
                        arrParameters[2] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[3] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objPedido_ProductoBE = new Pedido_ProductoBE();
                                objPedido_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objPedido_ProductoBE.Id_Direccion_Envio = Convert.ToInt32(dr["id_direccion_envio"]);
                                objPedido_ProductoBE.Id_Direccion_Facturacion = Convert.ToInt32(dr["id_direccion_facturacion"]);
                                objPedido_ProductoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objPedido_ProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                            }
                        }
                    }
                }
                return objPedido_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido_Producto(Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_pedido, Int32 id_producto)
        {
            String cadena;
            String sql = "Pedido_Producto_Delete";
            SqlParameter[] arrParameters = new SqlParameter[4];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_direccion_envio", id_direccion_envio);
                        arrParameters[1] = new SqlParameter("@id_direccion_facturacion", id_direccion_facturacion);
                        arrParameters[2] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[3] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
