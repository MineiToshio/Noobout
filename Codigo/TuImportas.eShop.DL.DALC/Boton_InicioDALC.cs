using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Boton_InicioDALC
    {
        public int Insert_Boton_Inicio(Boton_InicioBE objBoton_InicioBE)
        {
            String cadena;
            String sql = "Boton_Inicio_Insert";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objBoton_InicioBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@nombre", objBoton_InicioBE.Nombre);
                        arrParameters[2] = new SqlParameter("@url", objBoton_InicioBE.Url);

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

        public void Update_Boton_Inicio(Boton_InicioBE objBoton_InicioBE)
        {
            String cadena;
            String sql = "Boton_Inicio_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objBoton_InicioBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_boton_inicio", objBoton_InicioBE.Id_Boton_Inicio);
                        arrParameters[2] = new SqlParameter("@nombre", objBoton_InicioBE.Nombre);
                        arrParameters[3] = new SqlParameter("@url", objBoton_InicioBE.Url);

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

        public List<Boton_InicioBE> Select_Boton_Inicio()
        {
            String cadena;
            String sql = "Boton_Inicio_Select";
            Boton_InicioBE objBoton_InicioBE = null;
            List<Boton_InicioBE> lstBoton_InicioBE = null;

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
                                if(lstBoton_InicioBE == null)
                                    lstBoton_InicioBE = new List<Boton_InicioBE>();

                                objBoton_InicioBE = new Boton_InicioBE();
                                objBoton_InicioBE.Descripcion = dr["descripcion"].ToString();
                                objBoton_InicioBE.Id_Boton_Inicio = Convert.ToInt32(dr["id_boton_inicio"]);
                                objBoton_InicioBE.Nombre = dr["nombre"].ToString();
                                objBoton_InicioBE.Url = dr["url"].ToString();

                                lstBoton_InicioBE.Add(objBoton_InicioBE);
                            }
                        }
                    }
                }

                return lstBoton_InicioBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Boton_InicioBE Get_Boton_Inicio(Int32 id_boton_inicio)
        {
            String cadena;
            String sql = "Boton_Inicio_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            Boton_InicioBE objBoton_InicioBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_boton_inicio", id_boton_inicio);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objBoton_InicioBE = new Boton_InicioBE();
                                objBoton_InicioBE.Descripcion = dr["descripcion"].ToString();
                                objBoton_InicioBE.Id_Boton_Inicio = Convert.ToInt32(dr["id_boton_inicio"]);
                                objBoton_InicioBE.Nombre = dr["nombre"].ToString();
                                objBoton_InicioBE.Url = dr["url"].ToString();
                            }
                        }
                    }
                }
                return objBoton_InicioBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
