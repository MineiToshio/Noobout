using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Imagen_ProductoDALC
    {
        public int Insert_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            String cadena;
            String sql = "Imagen_Producto_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_producto", objImagen_ProductoBE.Id_Producto);
                        arrParameters[1] = new SqlParameter("@nombre", objImagen_ProductoBE.Nombre);
                        arrParameters[2] = new SqlParameter("@mostrar_primero", objImagen_ProductoBE.Mostrar_Primero);

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

        public void Update_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            String cadena;
            String sql = "Imagen_Producto_Update";
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

                        arrParameters[0] = new SqlParameter("@id_imagen", objImagen_ProductoBE.Id_Imagen);
                        arrParameters[1] = new SqlParameter("@id_producto", objImagen_ProductoBE.Id_Producto);
                        arrParameters[2] = new SqlParameter("@nombre", objImagen_ProductoBE.Nombre);
                        arrParameters[3] = new SqlParameter("@mostrar_primero", objImagen_ProductoBE.Mostrar_Primero);

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

        public int Insert_Update_Imagen_Producto(Imagen_ProductoBE objImagen_ProductoBE)
        {
            String cadena;
            String sql = "Imagen_Producto_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@id_imagen", objImagen_ProductoBE.Id_Imagen);
                        arrParameters[1] = new SqlParameter("@id_producto", objImagen_ProductoBE.Id_Producto);
                        arrParameters[2] = new SqlParameter("@nombre", objImagen_ProductoBE.Nombre);

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

        public List<Imagen_ProductoBE> Select_Imagen_Producto()
        {
            String cadena;
            String sql = "Imagen_Producto_Select";
            Imagen_ProductoBE objImagen_ProductoBE = null;
            List<Imagen_ProductoBE> lstImagen_ProductoBE = null;

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
                                if(lstImagen_ProductoBE == null)
                                    lstImagen_ProductoBE = new List<Imagen_ProductoBE>();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre"].ToString();

                                lstImagen_ProductoBE.Add(objImagen_ProductoBE);
                            }
                        }
                    }
                }

                return lstImagen_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Imagen_ProductoBE Get_Imagen_Producto(Int32 id_imagen, Int32 id_producto)
        {
            String cadena;
            String sql = "Imagen_Producto_Get";
            SqlParameter[] arrParameters = new SqlParameter[2];
            Imagen_ProductoBE objImagen_ProductoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_imagen", id_imagen);
                        arrParameters[1] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objImagen_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Imagen_Producto(Int32 id_imagen, Int32 id_producto)
        {
            String cadena;
            String sql = "Imagen_Producto_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_imagen", id_imagen);
                        arrParameters[1] = new SqlParameter("@id_producto", id_producto);

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
