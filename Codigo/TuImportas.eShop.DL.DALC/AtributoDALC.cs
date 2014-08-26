using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class AtributoDALC
    {
        public int Insert_Atributo(AtributoBE objAtributoBE)
        {
            String cadena;
            String sql = "Atributo_Insert";
            SqlParameter[] arrParameters = new SqlParameter[2];
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

                        arrParameters[0] = new SqlParameter("@descripcion", objAtributoBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@nombre", objAtributoBE.Nombre);

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

        public void Update_Atributo(AtributoBE objAtributoBE)
        {
            String cadena;
            String sql = "Atributo_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objAtributoBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_atributo", objAtributoBE.Id_Atributo);
                        arrParameters[2] = new SqlParameter("@nombre", objAtributoBE.Nombre);

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

        public List<AtributoBE> Select_Atributo()
        {
            String cadena;
            String sql = "Atributo_Select";
            AtributoBE objAtributoBE = null;
            List<AtributoBE> lstAtributoBE = null;

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
                                if(lstAtributoBE == null)
                                    lstAtributoBE = new List<AtributoBE>();

                                objAtributoBE = new AtributoBE();
                                objAtributoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objAtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objAtributoBE.Nombre = dr["nombre"].ToString();

                                lstAtributoBE.Add(objAtributoBE);
                            }
                        }
                    }
                }

                return lstAtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<AtributoBE> Get_Atributo_No_Producto(Int32 id_producto)
        {
            String cadena;
            String sql = "Atributo_Get_No_Producto";
            SqlParameter[] arrParameters = new SqlParameter[1];
            AtributoBE objAtributoBE = null;
            List<AtributoBE> lstAtributoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstAtributoBE == null)
                                    lstAtributoBE = new List<AtributoBE>();

                                objAtributoBE = new AtributoBE();
                                objAtributoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objAtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objAtributoBE.Nombre = dr["nombre"].ToString();

                                lstAtributoBE.Add(objAtributoBE);
                            }
                        }
                    }
                }
                return lstAtributoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<AtributoBE> Get_Atributo_Producto(Int32 id_producto)
        {
            String cadena;
            String sql = "Atributo_Get_Producto";
            SqlParameter[] arrParameters = new SqlParameter[1];
            AtributoBE objAtributoBE = null;
            List<AtributoBE> lstAtributoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstAtributoBE == null)
                                    lstAtributoBE = new List<AtributoBE>();

                                objAtributoBE = new AtributoBE();
                                objAtributoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objAtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objAtributoBE.Nombre = dr["nombre"].ToString();

                                lstAtributoBE.Add(objAtributoBE);
                            }
                        }
                    }
                }
                return lstAtributoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public AtributoBE Get_Atributo(Int32 id_atributo)
        {
            String cadena;
            String sql = "Atributo_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            AtributoBE objAtributoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_atributo", id_atributo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objAtributoBE = new AtributoBE();
                                objAtributoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objAtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objAtributoBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objAtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Atributo(Int32 id_atributo)
        {
            String cadena;
            String sql = "Atributo_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_atributo", id_atributo);

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
