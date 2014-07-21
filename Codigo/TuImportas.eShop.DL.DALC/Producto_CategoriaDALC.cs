using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Producto_CategoriaDALC
    {
        public void Insert_Producto_Categoria(Producto_CategoriaBE objProducto_CategoriaBE)
        {
            String cadena;
            String sql = "Producto_Categoria_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_categoria", objProducto_CategoriaBE.Id_Categoria);
                        arrParameters[1] = new SqlParameter("@id_producto", objProducto_CategoriaBE.Id_Producto);

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

        public List<Producto_CategoriaBE> Select_Producto_Categoria()
        {
            String cadena;
            String sql = "Producto_Categoria_Select";
            Producto_CategoriaBE objProducto_CategoriaBE = null;
            List<Producto_CategoriaBE> lstProducto_CategoriaBE = null;

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
                                if(lstProducto_CategoriaBE == null)
                                    lstProducto_CategoriaBE = new List<Producto_CategoriaBE>();

                                objProducto_CategoriaBE = new Producto_CategoriaBE();
                                objProducto_CategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objProducto_CategoriaBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProducto_CategoriaBE.Add(objProducto_CategoriaBE);
                            }
                        }
                    }
                }

                return lstProducto_CategoriaBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Producto_CategoriaBE Get_Producto_Categoria(Int32 id_categoria, Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Categoria_Get";
            SqlParameter[] arrParameters = new SqlParameter[2];
            Producto_CategoriaBE objProducto_CategoriaBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_categoria", id_categoria);
                        arrParameters[1] = new SqlParameter("@id_producto", id_producto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objProducto_CategoriaBE = new Producto_CategoriaBE();
                                objProducto_CategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objProducto_CategoriaBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                            }
                        }
                    }
                }
                return objProducto_CategoriaBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto_Categoria(Int32 id_categoria, Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Categoria_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_categoria", id_categoria);
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

        public void Delete_Producto_Categoria_xProducto(Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Categoria_Delete_Producto";
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

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);

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
