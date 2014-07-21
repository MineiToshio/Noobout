using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Producto_ColorDALC
    {
        public List<Producto_ColorBE> Select_Producto_Color(String lstCodigos)
        {
            String cadena;
            String sql = "Color_Select_Producto";
            SqlParameter[] arrParameters = new SqlParameter[1];
            Producto_ColorBE objProducto_ColorBE = null;
            List<Producto_ColorBE> lstProducto_ColorBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@parameter", lstCodigos);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstProducto_ColorBE == null)
                                    lstProducto_ColorBE = new List<Producto_ColorBE>();

                                objProducto_ColorBE = new Producto_ColorBE();
                                objProducto_ColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objProducto_ColorBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProducto_ColorBE.Color = dr["nombre"].ToString();

                                lstProducto_ColorBE.Add(objProducto_ColorBE);
                            }
                        }
                    }
                }
                return lstProducto_ColorBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Insert_Producto_Color(Producto_ColorBE objProducto_ColorBE)
        {
            String cadena;
            String sql = "Producto_Color_Insert";
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

                        arrParameters[0] = new SqlParameter("@id_producto", objProducto_ColorBE.Id_Producto);
                        arrParameters[1] = new SqlParameter("@id_color", objProducto_ColorBE.Id_Color);

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

        public void Delete_Producto_Color_xProducto(int idProducto)
        {
            String cadena;
            String sql = "Producto_Color_Delete_Producto";
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

                        arrParameters[0] = new SqlParameter("@id_producto", idProducto);

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
