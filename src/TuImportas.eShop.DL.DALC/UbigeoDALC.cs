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
    public class UbigeoDALC
    {
        public List<UbigeoBE> Get_Ubigeo_Distrito(String codDpto, String codProv)
        {
            String cadena;
            String sql = "Ubigeo_Get_Distrito";
            SqlParameter[] arrParameters = new SqlParameter[2];
            UbigeoBE objUbigeoBE = null;
            List<UbigeoBE> lstUbigeoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@coddpto", codDpto);
                        arrParameters[1] = new SqlParameter("@codprov", codProv);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstUbigeoBE == null)
                                    lstUbigeoBE = new List<UbigeoBE>();

                                objUbigeoBE = new UbigeoBE();
                                objUbigeoBE.CodDist = dr["coddist"].ToString();
                                objUbigeoBE.CodDpto = dr["coddpto"].ToString();
                                objUbigeoBE.CodProv = dr["codprov"].ToString();
                                objUbigeoBE.Nombre = dr["nombre"].ToString();
                                objUbigeoBE.Precio = Convert.ToDecimal(dr["precio"]);

                                lstUbigeoBE.Add(objUbigeoBE);
                            }
                        }
                    }
                }
                return lstUbigeoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<UbigeoBE> Get_Ubigeo_Provincia(String codDpto)
        {
            String cadena;
            String sql = "Ubigeo_Get_Provincia";
            SqlParameter[] arrParameters = new SqlParameter[1];
            UbigeoBE objUbigeoBE = null;
            List<UbigeoBE> lstUbigeoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@coddpto", codDpto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstUbigeoBE == null)
                                    lstUbigeoBE = new List<UbigeoBE>();

                                objUbigeoBE = new UbigeoBE();
                                objUbigeoBE.CodDist = dr["coddist"].ToString();
                                objUbigeoBE.CodDpto = dr["coddpto"].ToString();
                                objUbigeoBE.CodProv = dr["codprov"].ToString();
                                objUbigeoBE.Nombre = dr["nombre"].ToString();

                                lstUbigeoBE.Add(objUbigeoBE);
                            }
                        }
                    }
                }
                return lstUbigeoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<UbigeoBE> Get_Ubigeo_Departamento()
        {
            String cadena;
            String sql = "Ubigeo_Select_Departamento";
            UbigeoBE objUbigeoBE = null;
            List<UbigeoBE> lstUbigeoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstUbigeoBE == null)
                                    lstUbigeoBE = new List<UbigeoBE>();

                                objUbigeoBE = new UbigeoBE();
                                objUbigeoBE.CodDist = dr["coddist"].ToString();
                                objUbigeoBE.CodDpto = dr["coddpto"].ToString();
                                objUbigeoBE.CodProv = dr["codprov"].ToString();
                                objUbigeoBE.Nombre = dr["nombre"].ToString();

                                lstUbigeoBE.Add(objUbigeoBE);
                            }
                        }
                    }
                }
                return lstUbigeoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Ubigeo_Precio(UbigeoBE objUbigeoBE)
        {
            String cadena;
            String sql = "Ubigeo_Update_Precio";
            SqlParameter[] arrParameters = new SqlParameter[4];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@coddpto", objUbigeoBE.CodDpto);
                        arrParameters[1] = new SqlParameter("@codprov", objUbigeoBE.CodProv);
                        arrParameters[2] = new SqlParameter("@coddist", objUbigeoBE.CodDist);
                        arrParameters[3] = new SqlParameter("@precio", objUbigeoBE.Nombre);

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
