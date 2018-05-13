using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class WhishlistDALC
    {
        public int Insert_Whishlist(WhishlistBE objWhishlistBE)
        {
            String cadena;
            String sql = "Whishlist_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_producto", objWhishlistBE.Id_Producto);
                        arrParameters[1] = new SqlParameter("@id_usuario", objWhishlistBE.Id_Usuario);

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

        public void Update_Whishlist(WhishlistBE objWhishlistBE)
        {
            String cadena;
            String sql = "Whishlist_Update";
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

                        arrParameters[0] = new SqlParameter("@fecha_creacion", objWhishlistBE.Fecha_Creacion);
                        arrParameters[1] = new SqlParameter("@id_producto", objWhishlistBE.Id_Producto);
                        arrParameters[2] = new SqlParameter("@id_usuario", objWhishlistBE.Id_Usuario);
                        arrParameters[3] = new SqlParameter("@id_whishlist", objWhishlistBE.Id_Whishlist);

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

        public int Insert_Update_Whishlist(WhishlistBE objWhishlistBE)
        {
            String cadena;
            String sql = "Whishlist_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@fecha_creacion", objWhishlistBE.Fecha_Creacion);
                        arrParameters[1] = new SqlParameter("@id_producto", objWhishlistBE.Id_Producto);
                        arrParameters[2] = new SqlParameter("@id_usuario", objWhishlistBE.Id_Usuario);
                        arrParameters[3] = new SqlParameter("@id_whishlist", objWhishlistBE.Id_Whishlist);

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

        public List<WhishlistBE> Select_Whishlist()
        {
            String cadena;
            String sql = "Whishlist_Select";
            WhishlistBE objWhishlistBE = null;
            List<WhishlistBE> lstWhishlistBE = null;

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
                                if(lstWhishlistBE == null)
                                    lstWhishlistBE = new List<WhishlistBE>();

                                objWhishlistBE = new WhishlistBE();
                                objWhishlistBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objWhishlistBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objWhishlistBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objWhishlistBE.Id_Whishlist = Convert.ToInt32(dr["id_whishlist"]);

                                lstWhishlistBE.Add(objWhishlistBE);
                            }
                        }
                    }
                }

                return lstWhishlistBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public WhishlistBE Get_Whishlist(Int32 id_producto, Int32 id_usuario, Int32 id_whishlist)
        {
            String cadena;
            String sql = "Whishlist_Get";
            SqlParameter[] arrParameters = new SqlParameter[3];
            WhishlistBE objWhishlistBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);
                        arrParameters[1] = new SqlParameter("@id_usuario", id_usuario);
                        arrParameters[2] = new SqlParameter("@id_whishlist", id_whishlist);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objWhishlistBE = new WhishlistBE();
                                objWhishlistBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objWhishlistBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objWhishlistBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objWhishlistBE.Id_Whishlist = Convert.ToInt32(dr["id_whishlist"]);
                            }
                        }
                    }
                }
                return objWhishlistBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Whishlist(Int32 id_producto, Int32 id_usuario, Int32 id_whishlist)
        {
            String cadena;
            String sql = "Whishlist_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);
                        arrParameters[1] = new SqlParameter("@id_usuario", id_usuario);
                        arrParameters[2] = new SqlParameter("@id_whishlist", id_whishlist);

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

        public List<WhishlistBE> Get_Whishlist_Usuario(Int32 id_usuario)
        {
            String cadena;
            String sql = "Wishlist_Get_Usuario";
            SqlParameter[] arrParameters = new SqlParameter[1];
            WhishlistBE objWhishlistBE = null;
            List<WhishlistBE> lstWhishlistBE = null;

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
                                if (lstWhishlistBE == null)
                                    lstWhishlistBE = new List<WhishlistBE>();

                                objWhishlistBE = new WhishlistBE();
                                objWhishlistBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objWhishlistBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objWhishlistBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objWhishlistBE.Id_Whishlist = Convert.ToInt32(dr["id_whishlist"]);
                                objWhishlistBE.Nombre_Imagen = dr["nombre_imagen"].ToString();
                                objWhishlistBE.Nombre = dr["nombre"].ToString();
                                objWhishlistBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objWhishlistBE.Descripcion_Corta = dr["descripcion_corta"].ToString();

                                lstWhishlistBE.Add(objWhishlistBE);
                            }
                        }
                    }
                }

                return lstWhishlistBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Delete_Whishlist_Usuario_Producto(Int32 id_producto, Int32 id_usuario)
        {
            String cadena;
            String sql = "Whishlist_Delete_Usuario_Producto";
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

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);
                        arrParameters[1] = new SqlParameter("@id_usuario", id_usuario);

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
    }
}
