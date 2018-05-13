using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class CarritoDALC
    {
        public int Insert_Carrito(CarritoBE objCarritoBE)
        {
            String cadena;
            String sql = "Carrito_Insert";
            SqlParameter[] arrParameters = new SqlParameter[4];
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

                        arrParameters[0] = new SqlParameter("@id_direccion_envio", objCarritoBE.Id_Direccion_Envio);
                        arrParameters[1] = new SqlParameter("@id_direccion_facturacion", objCarritoBE.Id_Direccion_Facturacion);
                        arrParameters[2] = new SqlParameter("@id_usuario", objCarritoBE.Id_Usuario);
                        arrParameters[3] = new SqlParameter("@total", objCarritoBE.Total);

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

        public void Update_Carrito(CarritoBE objCarritoBE)
        {
            String cadena;
            String sql = "Carrito_Update";
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

                        arrParameters[0] = new SqlParameter("@id_carrito", objCarritoBE.Id_Carrito);
                        arrParameters[1] = new SqlParameter("@id_direccion_envio", objCarritoBE.Id_Direccion_Envio);
                        arrParameters[2] = new SqlParameter("@id_direccion_facturacion", objCarritoBE.Id_Direccion_Facturacion);
                        arrParameters[3] = new SqlParameter("@id_usuario", objCarritoBE.Id_Usuario);
                        arrParameters[4] = new SqlParameter("@total", objCarritoBE.Total);

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

        public void Insert_Update_Carrito(CarritoBE objCarritoBE)
        {
            String cadena;
            String sql = "Carrito_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@id_carrito", objCarritoBE.Id_Carrito);
                        arrParameters[1] = new SqlParameter("@id_direccion_envio", objCarritoBE.Id_Direccion_Envio);
                        arrParameters[2] = new SqlParameter("@id_direccion_facturacion", objCarritoBE.Id_Direccion_Facturacion);
                        arrParameters[3] = new SqlParameter("@id_usuario", objCarritoBE.Id_Usuario);
                        arrParameters[4] = new SqlParameter("@total", objCarritoBE.Total);

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

        public List<CarritoBE> Select_Carrito()
        {
            String cadena;
            String sql = "Carrito_Select";
            CarritoBE objCarritoBE = null;
            List<CarritoBE> lstCarritoBE = null;

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
                                if(lstCarritoBE == null)
                                    lstCarritoBE = new List<CarritoBE>();

                                objCarritoBE = new CarritoBE();
                                objCarritoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarritoBE.Id_Direccion_Envio = dr["id_direccion_envio"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_envio"]) : null;
                                objCarritoBE.Id_Direccion_Facturacion = dr["id_direccion_facturacion"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_facturacion"]) : null;
                                objCarritoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objCarritoBE.Total = Convert.ToDecimal(dr["total"]);

                                lstCarritoBE.Add(objCarritoBE);
                            }
                        }
                    }
                }

                return lstCarritoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public CarritoBE Get_Carrito(Int32 id_carrito)
        {
            String cadena;
            String sql = "Carrito_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            CarritoBE objCarritoBE = null;

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

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objCarritoBE = new CarritoBE();
                                objCarritoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarritoBE.Id_Direccion_Envio = dr["id_direccion_envio"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_envio"]) : null;
                                objCarritoBE.Id_Direccion_Facturacion = dr["id_direccion_facturacion"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_facturacion"]) : null;
                                objCarritoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objCarritoBE.Total = Convert.ToDecimal(dr["total"]);
                            }
                        }
                    }
                }
                return objCarritoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito(Int32 id_carrito, Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_usuario)
        {
            String cadena;
            String sql = "Carrito_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_carrito", id_carrito);
                        arrParameters[1] = new SqlParameter("@id_direccion_envio", id_direccion_envio);
                        arrParameters[2] = new SqlParameter("@id_direccion_facturacion", id_direccion_facturacion);
                        arrParameters[3] = new SqlParameter("@id_usuario", id_usuario);

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

        public void Delete_Carrito_Total(Int32 id_usuario)
        {
            String cadena;
            String sql = "Carrito_Delete_Total";
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

                        arrParameters[0] = new SqlParameter("@id_usuario", id_usuario);

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

        public CarritoBE Get_Carrito_Usuario(Int32 id_usuario)
        {
            String cadena;
            String sql = "Carrito_Get_Usuario";
            SqlParameter[] arrParameters = new SqlParameter[1];
            CarritoBE objCarritoBE = null;
            Carrito_ProductoBE objCarrito_ProductoBE = new Carrito_ProductoBE();
            Carrito_Producto_Elemento_AtributoBE objCarrito_Producto_Elemento_AtributoBE = new Carrito_Producto_Elemento_AtributoBE();

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
                                objCarritoBE = new CarritoBE();
                                objCarritoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarritoBE.Id_Direccion_Envio = dr["id_direccion_envio"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_envio"]) : null;
                                objCarritoBE.Id_Direccion_Facturacion = dr["id_direccion_facturacion"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_direccion_facturacion"]) : null;
                                objCarritoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objCarritoBE.Total = Convert.ToDecimal(dr["total"]);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCarrito_ProductoBE = new Carrito_ProductoBE();
                                objCarrito_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objCarrito_ProductoBE.Id_Carrito = Convert.ToInt32(dr["id_carrito"]);
                                objCarrito_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objCarrito_ProductoBE.Nombre = dr["nombre_producto"].ToString();
                                objCarrito_ProductoBE.Imagen = dr["nombre_imagen"].ToString();
                                objCarrito_ProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objCarrito_ProductoBE.Id_Color = dr["id_color"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_color"]) : null;
                                objCarrito_ProductoBE.Id_Carrito_Producto = Convert.ToInt32(dr["id_carrito_producto"]);

                                objCarritoBE.lstCarrito_ProductoBE.Add(objCarrito_ProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCarrito_Producto_Elemento_AtributoBE = new Carrito_Producto_Elemento_AtributoBE();
                                objCarrito_Producto_Elemento_AtributoBE.Id_Carrito_Producto = Convert.ToInt32(dr["id_carrito_producto"]);
                                objCarrito_Producto_Elemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                                objCarrito_Producto_Elemento_AtributoBE.Elemento = dr["elemento"].ToString();
                                objCarrito_Producto_Elemento_AtributoBE.Atributo = dr["atributo"].ToString();

                                foreach (Carrito_ProductoBE cp in objCarritoBE.lstCarrito_ProductoBE)
                                {
                                    if (cp.Id_Carrito_Producto == objCarrito_Producto_Elemento_AtributoBE.Id_Carrito_Producto)
                                    {
                                        cp.lstCarrito_Producto_Elemento_AtributoBE.Add(objCarrito_Producto_Elemento_AtributoBE);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
                return objCarritoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
