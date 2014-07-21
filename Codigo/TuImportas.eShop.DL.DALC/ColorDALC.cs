using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class ColorDALC
    {
        public int Insert_Color(ColorBE objColorBE)
        {
            String cadena;
            String sql = "Color_Insert";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objColorBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@nombre", objColorBE.Nombre);

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

        public void Update_Color(ColorBE objColorBE)
        {
            String cadena;
            String sql = "Color_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objColorBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_color", objColorBE.Id_Color);
                        arrParameters[2] = new SqlParameter("@nombre", objColorBE.Nombre);

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

        public int Insert_Update_Color(ColorBE objColorBE)
        {
            String cadena;
            String sql = "Color_Insert_Update";
            int codigo = 0;
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

                        arrParameters[0] = new SqlParameter("@descripcion", objColorBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_color", objColorBE.Id_Color);
                        arrParameters[2] = new SqlParameter("@nombre", objColorBE.Nombre);

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

        public List<ColorBE> Select_Color()
        {
            String cadena;
            String sql = "Color_Select";
            ColorBE objColorBE = null;
            List<ColorBE> lstColorBE = null;

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
                                if(lstColorBE == null)
                                    lstColorBE = new List<ColorBE>();

                                objColorBE = new ColorBE();
                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                lstColorBE.Add(objColorBE);
                            }
                        }
                    }
                }

                return lstColorBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public ColorBE Get_Color(Int32 id_color)
        {
            String cadena;
            String sql = "Color_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            ColorBE objColorBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_color", id_color);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objColorBE = new ColorBE();
                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objColorBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Color(Int32 id_color)
        {
            String cadena;
            String sql = "Color_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_color", id_color);

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
