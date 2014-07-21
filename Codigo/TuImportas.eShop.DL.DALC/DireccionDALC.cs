using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class DireccionDALC
    {
        public int Insert_Direccion(DireccionBE objDireccionBE)
        {
            String cadena;
            String sql = "Direccion_Insert";
            SqlParameter[] arrParameters = new SqlParameter[7];
            int codigo = 0; ;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@direccion", objDireccionBE.Direccion);
                        arrParameters[1] = new SqlParameter("@id_departamento", objDireccionBE.Id_Departamento);
                        arrParameters[2] = new SqlParameter("@id_distrito", objDireccionBE.Id_Distrito);
                        arrParameters[3] = new SqlParameter("@id_provincia", objDireccionBE.Id_Provincia);
                        arrParameters[4] = new SqlParameter("@id_usuario", objDireccionBE.Id_Usuario);
                        arrParameters[5] = new SqlParameter("@nombre", objDireccionBE.Nombre);
                        arrParameters[6] = new SqlParameter("@referencia", objDireccionBE.Referencia);

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

        public int Update_Direccion(DireccionBE objDireccionBE)
        {
            String cadena;
            String sql = "Direccion_Update";
            SqlParameter[] arrParameters = new SqlParameter[8];
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

                        arrParameters[0] = new SqlParameter("@direccion", objDireccionBE.Direccion);
                        arrParameters[1] = new SqlParameter("@id_departamento", objDireccionBE.Id_Departamento);
                        arrParameters[2] = new SqlParameter("@id_direccion", objDireccionBE.Id_Direccion);
                        arrParameters[3] = new SqlParameter("@id_distrito", objDireccionBE.Id_Distrito);
                        arrParameters[4] = new SqlParameter("@id_provincia", objDireccionBE.Id_Provincia);
                        arrParameters[5] = new SqlParameter("@id_usuario", objDireccionBE.Id_Usuario);
                        arrParameters[6] = new SqlParameter("@nombre", objDireccionBE.Nombre);
                        arrParameters[7] = new SqlParameter("@referencia", objDireccionBE.Referencia);

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

        public void Insert_Update_Direccion(DireccionBE objDireccionBE)
        {
            String cadena;
            String sql = "Direccion_Insert_Update";
            SqlParameter[] arrParameters = new SqlParameter[8];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@direccion", objDireccionBE.Direccion);
                        arrParameters[1] = new SqlParameter("@id_departamento", objDireccionBE.Id_Departamento);
                        arrParameters[2] = new SqlParameter("@id_direccion", objDireccionBE.Id_Direccion);
                        arrParameters[3] = new SqlParameter("@id_distrito", objDireccionBE.Id_Distrito);
                        arrParameters[4] = new SqlParameter("@id_provincia", objDireccionBE.Id_Provincia);
                        arrParameters[5] = new SqlParameter("@id_usuario", objDireccionBE.Id_Usuario);
                        arrParameters[6] = new SqlParameter("@nombre", objDireccionBE.Nombre);
                        arrParameters[7] = new SqlParameter("@referencia", objDireccionBE.Referencia);

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

        public List<DireccionBE> Select_Direccion()
        {
            String cadena;
            String sql = "Direccion_Select";
            DireccionBE objDireccionBE = null;
            List<DireccionBE> lstDireccionBE = null;

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
                                if(lstDireccionBE == null)
                                    lstDireccionBE = new List<DireccionBE>();

                                objDireccionBE = new DireccionBE();
                                objDireccionBE.Direccion = dr["direccion"].ToString();
                                objDireccionBE.Id_Departamento = dr["id_departamento"].ToString();
                                objDireccionBE.Id_Direccion = Convert.ToInt32(dr["id_direccion"]);
                                objDireccionBE.Id_Distrito = dr["id_distrito"].ToString();
                                objDireccionBE.Id_Provincia = dr["id_provincia"].ToString();
                                objDireccionBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objDireccionBE.Nombre = dr["nombre"].ToString();
                                objDireccionBE.Referencia = dr["referencia"].ToString();

                                lstDireccionBE.Add(objDireccionBE);
                            }
                        }
                    }
                }

                return lstDireccionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public DireccionBE Get_Direccion(Int32 id_direccion)
        {
            String cadena;
            String sql = "Direccion_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            DireccionBE objDireccionBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_direccion", id_direccion);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objDireccionBE = new DireccionBE();
                                objDireccionBE.Direccion = dr["direccion"].ToString();
                                objDireccionBE.Id_Departamento = dr["id_departamento"].ToString();
                                objDireccionBE.Id_Direccion = Convert.ToInt32(dr["id_direccion"]);
                                objDireccionBE.Id_Distrito = dr["id_distrito"].ToString();
                                objDireccionBE.Id_Provincia = dr["id_provincia"].ToString();
                                objDireccionBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objDireccionBE.Nombre = dr["nombre"].ToString();
                                objDireccionBE.Referencia = dr["referencia"].ToString();
                                objDireccionBE.Nombre_Departamento = dr["nombre_departamento"].ToString();
                                objDireccionBE.Nombre_Provincia = dr["nombre_provincia"].ToString();
                                objDireccionBE.Nombre_Distrito = dr["nombre_distrito"].ToString();
                                objDireccionBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                            }
                        }
                    }
                }
                return objDireccionBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Direccion(Int32 id_direccion)
        {
            String cadena;
            String sql = "Direccion_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_direccion", id_direccion);

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

        public List<DireccionBE> Select_Direccion_Usuario(Int32 id_usuario)
        {
            String cadena;
            String sql = "Direccion_Select_Usuario";
            SqlParameter[] arrParameters = new SqlParameter[1];
            DireccionBE objDireccionBE = null;
            List<DireccionBE> lstDireccionBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_usuario", id_usuario);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstDireccionBE == null)
                                    lstDireccionBE = new List<DireccionBE>();

                                objDireccionBE = new DireccionBE();
                                objDireccionBE.Direccion = dr["direccion"].ToString();
                                objDireccionBE.Id_Departamento = dr["id_departamento"].ToString();
                                objDireccionBE.Id_Direccion = Convert.ToInt32(dr["id_direccion"]);
                                objDireccionBE.Id_Distrito = dr["id_distrito"].ToString();
                                objDireccionBE.Id_Provincia = dr["id_provincia"].ToString();
                                objDireccionBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objDireccionBE.Nombre = dr["nombre"].ToString();
                                objDireccionBE.Referencia = dr["referencia"].ToString();
                                objDireccionBE.Nombre_Departamento = dr["nombre_departamento"].ToString();
                                objDireccionBE.Nombre_Provincia = dr["nombre_provincia"].ToString();
                                objDireccionBE.Nombre_Distrito = dr["nombre_distrito"].ToString();

                                lstDireccionBE.Add(objDireccionBE);
                            }
                        }
                    }
                }
                return lstDireccionBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
