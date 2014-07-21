using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Carrito_ProductoDALC
    {
        public void Insert_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            String cadena;
            String sql = "Carrito_Producto_Insert";
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

                        arrParameters[0] = new SqlParameter("@cantidad", objCarrito_ProductoBE.Cantidad);
                        arrParameters[1] = new SqlParameter("@id_carrito", objCarrito_ProductoBE.Id_Carrito);
                        arrParameters[2] = new SqlParameter("@id_producto", objCarrito_ProductoBE.Id_Producto);

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

        public void Update_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            String cadena;
            String sql = "Carrito_Producto_Update";
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

                        arrParameters[0] = new SqlParameter("@cantidad", objCarrito_ProductoBE.Cantidad);
                        arrParameters[1] = new SqlParameter("@id_carrito", objCarrito_ProductoBE.Id_Carrito);
                        arrParameters[2] = new SqlParameter("@id_producto", objCarrito_ProductoBE.Id_Producto);

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

        public void Insert_Update_Carrito_Producto(Carrito_ProductoBE objCarrito_ProductoBE)
        {
            String cadena;
            String sql = "Carrito_Producto_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@cantidad", objCarrito_ProductoBE.Cantidad);
                        arrParameters[1] = new SqlParameter("@id_carrito", objCarrito_ProductoBE.Id_Carrito);
                        arrParameters[2] = new SqlParameter("@id_producto", objCarrito_ProductoBE.Id_Producto);

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

        public List<Carrito_ProductoBE> Select_Carrito_Producto()
        {
            String cadena;
            String sql = "Carrito_Producto_Select";
            Carrito_ProductoBE objCarrito_ProductoBE = null;
            List<Carrito_ProductoBE> lstCarrito_ProductoBE = null;

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
                                if(lstCarrito_ProductoBE == null)
                                    lstCarrito_ProductoBE = new List<Carrito_ProductoBE>();

                                objCarrito_ProductoBE = new Carrito_ProductoBE();
                                objCarrito_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objCarrito_ProductoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarrito_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstCarrito_ProductoBE.Add(objCarrito_ProductoBE);
                            }
                        }
                    }
                }

                return lstCarrito_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Carrito_ProductoBE Get_Carrito_Producto(Int32 id_carrito, Int32 id_producto)
        {
            String cadena;
            String sql = "Carrito_Producto_Get";
            SqlParameter[] arrParameters = new SqlParameter[2];
            Carrito_ProductoBE objCarrito_ProductoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_carrito", id_carrito);
                        arrParameters[1] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objCarrito_ProductoBE = new Carrito_ProductoBE();
                                objCarrito_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objCarrito_ProductoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarrito_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                            }
                        }
                    }
                }
                return objCarrito_ProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Producto(Int32 id_carrito, Int32 id_producto)
        {
            String cadena;
            String sql = "Carrito_Producto_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_carrito", id_carrito);
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
