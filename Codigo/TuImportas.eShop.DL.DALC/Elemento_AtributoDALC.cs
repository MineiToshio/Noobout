using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Elemento_AtributoDALC
    {
        public void Insert_Elemento_Atributo(Elemento_AtributoBE objElemento_AtributoBE)
        {
            String cadena;
            String sql = "Elemento_Atributo_Insert";
            SqlParameter[] arrParameters = new SqlParameter[2];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_atributo", objElemento_AtributoBE.Id_Atributo);
                        arrParameters[1] = new SqlParameter("@nombre", objElemento_AtributoBE.Nombre);

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

        public void Update_Elemento_Atributo(Elemento_AtributoBE objElemento_AtributoBE)
        {
            String cadena;
            String sql = "Elemento_Atributo_Update";
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

                        arrParameters[0] = new SqlParameter("@id_atributo", objElemento_AtributoBE.Id_Atributo);
                        arrParameters[1] = new SqlParameter("@id_elemento_atributo", objElemento_AtributoBE.Id_Elemento_Atributo);
                        arrParameters[2] = new SqlParameter("@nombre", objElemento_AtributoBE.Nombre);

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

        public List<Elemento_AtributoBE> Select_Elemento_Atributo()
        {
            String cadena;
            String sql = "Elemento_Atributo_Select";
            Elemento_AtributoBE objElemento_AtributoBE = null;
            List<Elemento_AtributoBE> lstElemento_AtributoBE = null;

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
                                if(lstElemento_AtributoBE == null)
                                    lstElemento_AtributoBE = new List<Elemento_AtributoBE>();

                                objElemento_AtributoBE = new Elemento_AtributoBE();
                                objElemento_AtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objElemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                                objElemento_AtributoBE.Nombre = dr["nombre"].ToString();

                                lstElemento_AtributoBE.Add(objElemento_AtributoBE);
                            }
                        }
                    }
                }

                return lstElemento_AtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Elemento_AtributoBE> Get_Elemento_Atributo_Atributo(int idAtributo)
        {
            String cadena;
            String sql = "Elemento_Atributo_Get_Atributo";
            Elemento_AtributoBE objElemento_AtributoBE = null;
            List<Elemento_AtributoBE> lstElemento_AtributoBE = null;
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

                        arrParameters[0] = new SqlParameter("@id_atributo", idAtributo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstElemento_AtributoBE == null)
                                    lstElemento_AtributoBE = new List<Elemento_AtributoBE>();

                                objElemento_AtributoBE = new Elemento_AtributoBE();
                                objElemento_AtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objElemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                                objElemento_AtributoBE.Nombre = dr["nombre"].ToString();

                                lstElemento_AtributoBE.Add(objElemento_AtributoBE);
                            }
                        }
                    }
                }

                return lstElemento_AtributoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Elemento_AtributoBE Get_Elemento_Atributo(Int32 id_atributo, Int32 id_elemento_atributo)
        {
            String cadena;
            String sql = "Elemento_Atributo_Get";
            SqlParameter[] arrParameters = new SqlParameter[2];
            Elemento_AtributoBE objElemento_AtributoBE = null;

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
                        arrParameters[1] = new SqlParameter("@id_elemento_atributo", id_elemento_atributo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objElemento_AtributoBE = new Elemento_AtributoBE();
                                objElemento_AtributoBE.Id_Atributo = Convert.ToInt32(dr["id_atributo"]);
                                objElemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                                objElemento_AtributoBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objElemento_AtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Elemento_Atributo(Int32 id_elemento_atributo)
        {
            String cadena;
            String sql = "Elemento_Atributo_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_elemento_atributo", id_elemento_atributo);

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
