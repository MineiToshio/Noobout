using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class RolDALC
    {
        public void Insert_Rol(RolBE objRolBE)
        {
            String cadena;
            String sql = "Rol_Insert";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objRolBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_rol", objRolBE.Id_Rol);
                        arrParameters[2] = new SqlParameter("@nombre", objRolBE.Nombre);

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

        public void Update_Rol(RolBE objRolBE)
        {
            String cadena;
            String sql = "Rol_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objRolBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_rol", objRolBE.Id_Rol);
                        arrParameters[2] = new SqlParameter("@nombre", objRolBE.Nombre);

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

        public void Insert_Update_Rol(RolBE objRolBE)
        {
            String cadena;
            String sql = "Rol_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objRolBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_rol", objRolBE.Id_Rol);
                        arrParameters[2] = new SqlParameter("@nombre", objRolBE.Nombre);

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

        public List<RolBE> Select_Rol()
        {
            String cadena;
            String sql = "Rol_Select";
            RolBE objRolBE = null;
            List<RolBE> lstRolBE = null;

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
                                if(lstRolBE == null)
                                    lstRolBE = new List<RolBE>();

                                objRolBE = new RolBE();
                                objRolBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objRolBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objRolBE.Nombre = dr["nombre"].ToString();

                                lstRolBE.Add(objRolBE);
                            }
                        }
                    }
                }

                return lstRolBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public RolBE Get_Rol(Int32 id_rol)
        {
            String cadena;
            String sql = "Rol_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            RolBE objRolBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_rol", id_rol);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objRolBE = new RolBE();
                                objRolBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objRolBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objRolBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objRolBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Rol(Int32 id_rol)
        {
            String cadena;
            String sql = "Rol_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_rol", id_rol);

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
