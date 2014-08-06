using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class SliderDALC
    {
        public int Insert_Slider(SliderBE objSliderBE)
        {
            String cadena;
            String sql = "Slider_Insert";
            SqlParameter[] arrParameters = new SqlParameter[6];
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

                        arrParameters[0] = new SqlParameter("@background", objSliderBE.Background);
                        arrParameters[1] = new SqlParameter("@boton", objSliderBE.Boton);
                        arrParameters[2] = new SqlParameter("@descripcion", objSliderBE.Descripcion);
                        arrParameters[3] = new SqlParameter("@imagen", objSliderBE.Imagen);
                        arrParameters[4] = new SqlParameter("@nombre", objSliderBE.Nombre);
                        arrParameters[5] = new SqlParameter("@url", objSliderBE.Url);

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

        public void Update_Slider(SliderBE objSliderBE)
        {
            String cadena;
            String sql = "Slider_Update";
            SqlParameter[] arrParameters = new SqlParameter[5];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@boton", objSliderBE.Boton);
                        arrParameters[1] = new SqlParameter("@descripcion", objSliderBE.Descripcion);
                        arrParameters[2] = new SqlParameter("@id_slider", objSliderBE.Id_Slider);
                        arrParameters[3] = new SqlParameter("@nombre", objSliderBE.Nombre);
                        arrParameters[4] = new SqlParameter("@url", objSliderBE.Url);

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

        public void Update_Slider_Background(SliderBE objSliderBE)
        {
            String cadena;
            String sql = "Slider_Update_Background";
            SqlParameter[] arrParameters = new SqlParameter[2];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@background", objSliderBE.Background);
                        arrParameters[1] = new SqlParameter("@id_slider", objSliderBE.Id_Slider);

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

        public void Update_Slider_Imagen(SliderBE objSliderBE)
        {
            String cadena;
            String sql = "Slider_Update_Imagen";
            SqlParameter[] arrParameters = new SqlParameter[2];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@imagen", objSliderBE.Imagen);
                        arrParameters[1] = new SqlParameter("@id_slider", objSliderBE.Id_Slider);

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

        public List<SliderBE> Select_Slider()
        {
            String cadena;
            String sql = "Slider_Select";
            SliderBE objSliderBE = null;
            List<SliderBE> lstSliderBE = null;

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
                                if(lstSliderBE == null)
                                    lstSliderBE = new List<SliderBE>();

                                objSliderBE = new SliderBE();
                                objSliderBE.Background = dr["background"].ToString();
                                objSliderBE.Boton = dr["boton"].ToString();
                                objSliderBE.Descripcion = dr["descripcion"].ToString();
                                objSliderBE.Id_Slider = Convert.ToInt32(dr["id_slider"]);
                                objSliderBE.Imagen = dr["imagen"].ToString();
                                objSliderBE.Nombre = dr["nombre"].ToString();
                                objSliderBE.Url = dr["url"].ToString();

                                lstSliderBE.Add(objSliderBE);
                            }
                        }
                    }
                }

                return lstSliderBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public SliderBE Get_Slider(Int32 id_slider)
        {
            String cadena;
            String sql = "Slider_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            SliderBE objSliderBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_slider", id_slider);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objSliderBE = new SliderBE();
                                objSliderBE.Background = dr["background"].ToString();
                                objSliderBE.Boton = dr["boton"].ToString();
                                objSliderBE.Descripcion = dr["descripcion"].ToString();
                                objSliderBE.Id_Slider = Convert.ToInt32(dr["id_slider"]);
                                objSliderBE.Imagen = dr["imagen"].ToString();
                                objSliderBE.Nombre = dr["nombre"].ToString();
                                objSliderBE.Url = dr["url"].ToString();
                            }
                        }
                    }
                }
                return objSliderBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Slider(Int32 id_slider)
        {
            String cadena;
            String sql = "Slider_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_slider", id_slider);

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
