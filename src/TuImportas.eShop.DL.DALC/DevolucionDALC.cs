using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class DevolucionDALC
    {
        public int Insert_Devolucion(DevolucionBE objDevolucionBE)
        {
            String cadena;
            String sql = "Devolucion_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_pedido", objDevolucionBE.Id_Pedido);
                        arrParameters[1] = new SqlParameter("@id_producto", objDevolucionBE.Id_Producto);
                        arrParameters[2] = new SqlParameter("@motivo", objDevolucionBE.Motivo);

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

        public void Update_Devolucion(DevolucionBE objDevolucionBE)
        {
            String cadena;
            String sql = "Devolucion_Update";
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

                        arrParameters[0] = new SqlParameter("@id_devolucion", objDevolucionBE.Id_Devolucion);
                        arrParameters[1] = new SqlParameter("@id_pedido", objDevolucionBE.Id_Pedido);
                        arrParameters[2] = new SqlParameter("@id_producto", objDevolucionBE.Id_Producto);
                        arrParameters[3] = new SqlParameter("@motivo", objDevolucionBE.Motivo);

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

        public int Insert_Update_Devolucion(DevolucionBE objDevolucionBE)
        {
            String cadena;
            String sql = "Devolucion_Insert_Update";
            int codigo = 0;
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

                        arrParameters[0] = new SqlParameter("@id_devolucion", objDevolucionBE.Id_Devolucion);
                        arrParameters[1] = new SqlParameter("@id_pedido", objDevolucionBE.Id_Pedido);
                        arrParameters[2] = new SqlParameter("@id_producto", objDevolucionBE.Id_Producto);
                        arrParameters[3] = new SqlParameter("@motivo", objDevolucionBE.Motivo);

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

        public List<DevolucionBE> Select_Devolucion()
        {
            String cadena;
            String sql = "Devolucion_Select";
            DevolucionBE objDevolucionBE = null;
            List<DevolucionBE> lstDevolucionBE = null;

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
                                if(lstDevolucionBE == null)
                                    lstDevolucionBE = new List<DevolucionBE>();

                                objDevolucionBE = new DevolucionBE();
                                objDevolucionBE.Id_Devolucion = Convert.ToInt32(dr["id_devolucion"]);
                                objDevolucionBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objDevolucionBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objDevolucionBE.Motivo = dr["motivo"].ToString();

                                lstDevolucionBE.Add(objDevolucionBE);
                            }
                        }
                    }
                }

                return lstDevolucionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public DevolucionBE Get_Devolucion(Int32 id_devolucion, Int32 id_pedido, Int32 id_producto)
        {
            String cadena;
            String sql = "Devolucion_Get";
            SqlParameter[] arrParameters = new SqlParameter[3];
            DevolucionBE objDevolucionBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_devolucion", id_devolucion);
                        arrParameters[1] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[2] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objDevolucionBE = new DevolucionBE();
                                objDevolucionBE.Id_Devolucion = Convert.ToInt32(dr["id_devolucion"]);
                                objDevolucionBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objDevolucionBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objDevolucionBE.Motivo = dr["motivo"].ToString();
                            }
                        }
                    }
                }
                return objDevolucionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Devolucion(Int32 id_devolucion, Int32 id_pedido, Int32 id_producto)
        {
            String cadena;
            String sql = "Devolucion_Delete";
            SqlParameter[] arrParameters = new SqlParameter[3];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_devolucion", id_devolucion);
                        arrParameters[1] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[2] = new SqlParameter("@id_producto", id_producto);

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
