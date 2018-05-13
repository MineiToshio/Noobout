using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Producto_Elemento_AtributoDALC
    {
        public void Insert_Producto_Elemento_Atributo(Producto_Elemento_AtributoBE objProducto_Elemento_AtributoBE)
        {
            String cadena;
            String sql = "Producto_Elemento_Atributo_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_elemento_atributo", objProducto_Elemento_AtributoBE.Id_Elemento_Atributo);
                        arrParameters[1] = new SqlParameter("@id_producto", objProducto_Elemento_AtributoBE.Id_Producto);

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

        public List<Producto_Elemento_AtributoBE> Select_Producto_Elemento_Atributo()
        {
            String cadena;
            String sql = "Producto_Elemento_Atributo_Select";
            Producto_Elemento_AtributoBE objProducto_Elemento_AtributoBE = null;
            List<Producto_Elemento_AtributoBE> lstProducto_Elemento_AtributoBE = null;

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
                                if(lstProducto_Elemento_AtributoBE == null)
                                    lstProducto_Elemento_AtributoBE = new List<Producto_Elemento_AtributoBE>();

                                objProducto_Elemento_AtributoBE = new Producto_Elemento_AtributoBE();
                                objProducto_Elemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(dr["id_elemento_atributo"]);
                                objProducto_Elemento_AtributoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProducto_Elemento_AtributoBE.Add(objProducto_Elemento_AtributoBE);
                            }
                        }
                    }
                }

                return lstProducto_Elemento_AtributoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto_Elemento_Atributo(Int32 id_elemento_atributo, Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Elemento_Atributo_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_elemento_atributo", id_elemento_atributo);
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

        public void Delete_Producto_Elemento_Atributo_Producto(Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Elemento_Atributo_Delete_Producto";
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
