using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Pedido_DireccionDALC
    {
        public void Insert_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            String cadena;
            String sql = "Pedido_Direccion_Insert";
            SqlParameter[] arrParameters = new SqlParameter[7];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@departamento", objPedido_DireccionBE.Departamento);
                        arrParameters[1] = new SqlParameter("@direccion", objPedido_DireccionBE.Direccion);
                        arrParameters[2] = new SqlParameter("@distrito", objPedido_DireccionBE.Distrito);
                        arrParameters[3] = new SqlParameter("@provincia", objPedido_DireccionBE.Provincia);
                        arrParameters[4] = new SqlParameter("@referencia", objPedido_DireccionBE.Referencia);
                        arrParameters[5] = new SqlParameter("@id_pedido", objPedido_DireccionBE.Id_Pedido);
                        arrParameters[6] = new SqlParameter("@id_tipo_direccion", objPedido_DireccionBE.Id_Tipo_Direccion);

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

        public void Update_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            String cadena;
            String sql = "Pedido_Direccion_Update";
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

                        arrParameters[0] = new SqlParameter("@departamento", objPedido_DireccionBE.Departamento);
                        arrParameters[1] = new SqlParameter("@direccion", objPedido_DireccionBE.Direccion);
                        arrParameters[2] = new SqlParameter("@distrito", objPedido_DireccionBE.Distrito);
                        arrParameters[3] = new SqlParameter("@id_pedido_direccion", objPedido_DireccionBE.Id_Pedido_Direccion);
                        arrParameters[4] = new SqlParameter("@provincia", objPedido_DireccionBE.Provincia);
                        arrParameters[5] = new SqlParameter("@referencia", objPedido_DireccionBE.Referencia);

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

        public void Insert_Update_Pedido_Direccion(Pedido_DireccionBE objPedido_DireccionBE)
        {
            String cadena;
            String sql = "Pedido_Direccion_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@departamento", objPedido_DireccionBE.Departamento);
                        arrParameters[1] = new SqlParameter("@direccion", objPedido_DireccionBE.Direccion);
                        arrParameters[2] = new SqlParameter("@distrito", objPedido_DireccionBE.Distrito);
                        arrParameters[3] = new SqlParameter("@id_pedido_direccion", objPedido_DireccionBE.Id_Pedido_Direccion);
                        arrParameters[4] = new SqlParameter("@provincia", objPedido_DireccionBE.Provincia);
                        arrParameters[5] = new SqlParameter("@referencia", objPedido_DireccionBE.Referencia);

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

        public List<Pedido_DireccionBE> Select_Pedido_Direccion()
        {
            String cadena;
            String sql = "Pedido_Direccion_Select";
            Pedido_DireccionBE objPedido_DireccionBE = null;
            List<Pedido_DireccionBE> lstPedido_DireccionBE = null;

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
                                if(lstPedido_DireccionBE == null)
                                    lstPedido_DireccionBE = new List<Pedido_DireccionBE>();

                                objPedido_DireccionBE = new Pedido_DireccionBE();
                                objPedido_DireccionBE.Departamento = dr["departamento"].ToString();
                                objPedido_DireccionBE.Direccion = dr["direccion"].ToString();
                                objPedido_DireccionBE.Distrito = dr["distrito"].ToString();
                                objPedido_DireccionBE.Id_Pedido_Direccion = Convert.ToInt32(dr["id_pedido_direccion"]);
                                objPedido_DireccionBE.Provincia = dr["provincia"].ToString();
                                objPedido_DireccionBE.Referencia = dr["referencia"].ToString();

                                lstPedido_DireccionBE.Add(objPedido_DireccionBE);
                            }
                        }
                    }
                }

                return lstPedido_DireccionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Pedido_DireccionBE Get_Pedido_Direccion(Int32 id_pedido_direccion)
        {
            String cadena;
            String sql = "Pedido_Direccion_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            Pedido_DireccionBE objPedido_DireccionBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_pedido_direccion", id_pedido_direccion);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objPedido_DireccionBE = new Pedido_DireccionBE();
                                objPedido_DireccionBE.Departamento = dr["departamento"].ToString();
                                objPedido_DireccionBE.Direccion = dr["direccion"].ToString();
                                objPedido_DireccionBE.Distrito = dr["distrito"].ToString();
                                objPedido_DireccionBE.Id_Pedido_Direccion = Convert.ToInt32(dr["id_pedido_direccion"]);
                                objPedido_DireccionBE.Provincia = dr["provincia"].ToString();
                                objPedido_DireccionBE.Referencia = dr["referencia"].ToString();
                            }
                        }
                    }
                }
                return objPedido_DireccionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido_Direccion(Int32 id_pedido_direccion)
        {
            String cadena;
            String sql = "Pedido_Direccion_Delete";
            SqlParameter[] arrParameters = new SqlParameter[1];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_pedido_direccion", id_pedido_direccion);

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
