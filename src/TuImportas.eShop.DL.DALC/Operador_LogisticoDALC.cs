using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;
using System.Configuration;

namespace TuImportas.eShop.DL.DALC
{
    public class Operador_LogisticoDALC
    {
        public int Insert_Operador_Logistico(Operador_LogisticoBE objOperador_LogisticoBE)
        {
            String cadena;
            String sql = "Operador_Logistico_Insert";
            SqlParameter[] arrParameters = new SqlParameter[5];
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

                        arrParameters[0] = new SqlParameter("@costo_lima", objOperador_LogisticoBE.Costo_Lima);
                        arrParameters[1] = new SqlParameter("@costo_provincia", objOperador_LogisticoBE.Costo_Provincia);
                        arrParameters[2] = new SqlParameter("@habilitado", objOperador_LogisticoBE.Habilitado);
                        arrParameters[3] = new SqlParameter("@nombre", objOperador_LogisticoBE.Nombre);
                        arrParameters[4] = new SqlParameter("@tiempo_entrega", objOperador_LogisticoBE.Tiempo_Entrega);

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

        public void Update_Operador_Logistico(Operador_LogisticoBE objOperador_LogisticoBE)
        {
            String cadena;
            String sql = "Operador_Logistico_Update";
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

                        arrParameters[0] = new SqlParameter("@costo_lima", objOperador_LogisticoBE.Costo_Lima);
                        arrParameters[1] = new SqlParameter("@costo_provincia", objOperador_LogisticoBE.Costo_Provincia);
                        arrParameters[2] = new SqlParameter("@habilitado", objOperador_LogisticoBE.Habilitado);
                        arrParameters[3] = new SqlParameter("@id_operador", objOperador_LogisticoBE.Id_Operador);
                        arrParameters[4] = new SqlParameter("@nombre", objOperador_LogisticoBE.Nombre);
                        arrParameters[5] = new SqlParameter("@tiempo_entrega", objOperador_LogisticoBE.Tiempo_Entrega);

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

        public void Update_Operador_Activo(int idOperador)
        {
            String cadena;
            String sql = "Operador_Logistico_Update_Activo";
            SqlParameter[] arrParameters = new SqlParameter[1];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@Id_Operador", idOperador);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Operador_LogisticoBE> Select_Operador_Logistico()
        {
            String cadena;
            String sql = "Operador_Logistico_Select";
            Operador_LogisticoBE objOperador_LogisticoBE = null;
            List<Operador_LogisticoBE> lstOperador_LogisticoBE = null;

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
                                if(lstOperador_LogisticoBE == null)
                                    lstOperador_LogisticoBE = new List<Operador_LogisticoBE>();

                                objOperador_LogisticoBE = new Operador_LogisticoBE();
                                objOperador_LogisticoBE.Costo_Lima = Convert.ToDecimal(dr["Costo_Lima"]);
                                objOperador_LogisticoBE.Costo_Provincia = Convert.ToDecimal(dr["Costo_Provincia"]);
                                objOperador_LogisticoBE.Habilitado = Convert.ToBoolean(dr["Habilitado"]);
                                objOperador_LogisticoBE.Id_Operador = Convert.ToInt32(dr["Id_Operador"]);
                                objOperador_LogisticoBE.Nombre = dr["Nombre"].ToString();
                                objOperador_LogisticoBE.Tiempo_Entrega = dr["Tiempo_Entrega"].ToString();
                                objOperador_LogisticoBE.Img_Habilitado = "/images/" + (objOperador_LogisticoBE.Habilitado ? "checkbox_checked.png" : "checkbox_unchecked.png");

                                lstOperador_LogisticoBE.Add(objOperador_LogisticoBE);
                            }
                        }
                    }
                }

                return lstOperador_LogisticoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Operador_LogisticoBE> Select_Operador_Logistico_Habilitado()
        {
            String cadena;
            String sql = "Operador_Logistico_Select_Habilitado";
            Operador_LogisticoBE objOperador_LogisticoBE = null;
            List<Operador_LogisticoBE> lstOperador_LogisticoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstOperador_LogisticoBE == null)
                                    lstOperador_LogisticoBE = new List<Operador_LogisticoBE>();

                                objOperador_LogisticoBE = new Operador_LogisticoBE();
                                objOperador_LogisticoBE.Costo_Lima = Convert.ToDecimal(dr["Costo_Lima"]);
                                objOperador_LogisticoBE.Costo_Provincia = Convert.ToDecimal(dr["Costo_Provincia"]);
                                objOperador_LogisticoBE.Habilitado = Convert.ToBoolean(dr["Habilitado"]);
                                objOperador_LogisticoBE.Id_Operador = Convert.ToInt32(dr["Id_Operador"]);
                                objOperador_LogisticoBE.Nombre = dr["Nombre"].ToString();
                                objOperador_LogisticoBE.Tiempo_Entrega = dr["Tiempo_Entrega"].ToString();
                                objOperador_LogisticoBE.Img_Habilitado = "/images/" + (objOperador_LogisticoBE.Habilitado ? "checkbox_checked.png" : "checkbox_unchecked.png");

                                lstOperador_LogisticoBE.Add(objOperador_LogisticoBE);
                            }
                        }
                    }
                }

                return lstOperador_LogisticoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Operador_LogisticoBE Get_Operador_Logistico(Int32 id_operador)
        {
            String cadena;
            String sql = "Operador_Logistico_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            Operador_LogisticoBE objOperador_LogisticoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_operador", id_operador);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objOperador_LogisticoBE = new Operador_LogisticoBE();
                                objOperador_LogisticoBE.Costo_Lima = Convert.ToDecimal(dr["Costo_Lima"]);
                                objOperador_LogisticoBE.Costo_Provincia = Convert.ToDecimal(dr["Costo_Provincia"]);
                                objOperador_LogisticoBE.Habilitado = Convert.ToBoolean(dr["Habilitado"]);
                                objOperador_LogisticoBE.Id_Operador = Convert.ToInt32(dr["Id_Operador"]);
                                objOperador_LogisticoBE.Nombre = dr["Nombre"].ToString();
                                objOperador_LogisticoBE.Tiempo_Entrega = dr["Tiempo_Entrega"].ToString();
                            }
                        }
                    }
                }
                return objOperador_LogisticoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
