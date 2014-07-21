using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class CategoriaDALC
    {
        public int Insert_Categoria(CategoriaBE objCategoriaBE)
        {
            String cadena;
            String sql = "Categoria_Insert";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objCategoriaBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@nombre", objCategoriaBE.Nombre);
                        arrParameters[2] = new SqlParameter("@id_padre", objCategoriaBE.Id_Padre);

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

        public void Update_Categoria(CategoriaBE objCategoriaBE)
        {
            String cadena;
            String sql = "Categoria_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objCategoriaBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_categoria", objCategoriaBE.Id_Categoria);
                        arrParameters[2] = new SqlParameter("@nombre", objCategoriaBE.Nombre);
                        arrParameters[3] = new SqlParameter("@id_padre", objCategoriaBE.Id_Padre);

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

        public int Insert_Update_Categoria(CategoriaBE objCategoriaBE)
        {
            String cadena;
            String sql = "Categoria_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objCategoriaBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_categoria", objCategoriaBE.Id_Categoria);
                        arrParameters[2] = new SqlParameter("@nombre", objCategoriaBE.Nombre);
                        arrParameters[3] = new SqlParameter("@id_padre", objCategoriaBE.Id_Padre);

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

        public List<CategoriaBE> Select_Categoria()
        {
            String cadena;
            String sql = "Categoria_Select";
            CategoriaBE objCategoriaBE = null;
            List<CategoriaBE> lstCategoriaBE = null;

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
                                if(lstCategoriaBE == null)
                                    lstCategoriaBE = new List<CategoriaBE>();

                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_padre"]) : null;

                                lstCategoriaBE.Add(objCategoriaBE);
                            }
                        }
                    }
                }

                return lstCategoriaBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public CategoriaBE Get_Categoria(Int32 id_categoria)
        {
            String cadena;
            String sql = "Categoria_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            CategoriaBE objCategoriaBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_categoria", id_categoria);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (int?)Convert.ToInt32(dr["id_padre"]) : null;
                            }
                        }
                    }
                }
                return objCategoriaBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Categoria(Int32 id_categoria)
        {
            String cadena;
            String sql = "Categoria_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_categoria", id_categoria);

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
