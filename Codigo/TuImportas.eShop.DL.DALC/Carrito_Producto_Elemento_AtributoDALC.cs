using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Carrito_Producto_Elemento_AtributoDALC
    {
        public void Insert_Carrito_Producto_Elemento_Atributo(Carrito_Producto_Elemento_AtributoBE objCarrito_Producto_Elemento_AtributoBE)
        {
            String cadena;
            String sql = "Carrito_Producto_Elemento_Atributo_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_carrito_producto", objCarrito_Producto_Elemento_AtributoBE.Id_Carrito_Producto);
                        arrParameters[1] = new SqlParameter("@id_elemento_atributo", objCarrito_Producto_Elemento_AtributoBE.Id_Elemento_Atributo);

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

        public Carrito_Producto_Elemento_AtributoBE Get_Carrito_Producto_Elemento_Atributo(Int32 id_carrito_producto, Int32 id_elemento_atributo)
        {
            String cadena;
            String sql = "Carrito_Producto_Elemento_Atributo_Get";
            SqlParameter[] arrParameters = new SqlParameter[2];
            Carrito_Producto_Elemento_AtributoBE objCarrito_Producto_Elemento_AtributoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_carrito_producto", id_carrito_producto);
                        arrParameters[1] = new SqlParameter("@id_elemento_atributo", id_elemento_atributo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objCarrito_Producto_Elemento_AtributoBE = new Carrito_Producto_Elemento_AtributoBE();
                                objCarrito_Producto_Elemento_AtributoBE.Id_Carrito_Producto = Convert.ToInt32(dr["id_carrito_producto"]);
                                objCarrito_Producto_Elemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                            }
                        }
                    }
                }
                return objCarrito_Producto_Elemento_AtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Producto_Elemento_Atributo(Int32 id_carrito_producto, Int32 id_elemento_atributo)
        {
            String cadena;
            String sql = "Carrito_Producto_Elemento_Atributo_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_carrito_producto", id_carrito_producto);
                        arrParameters[1] = new SqlParameter("@id_elemento_atributo", id_elemento_atributo);

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
