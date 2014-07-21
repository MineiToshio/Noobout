using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class Forma_PagoDALC
    {
        public void Insert_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            String cadena;
            String sql = "Forma_Pago_Insert";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objForma_PagoBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_forma_pago", objForma_PagoBE.Id_Forma_Pago);
                        arrParameters[2] = new SqlParameter("@nombre", objForma_PagoBE.Nombre);

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

        public void Update_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            String cadena;
            String sql = "Forma_Pago_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objForma_PagoBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_forma_pago", objForma_PagoBE.Id_Forma_Pago);
                        arrParameters[2] = new SqlParameter("@nombre", objForma_PagoBE.Nombre);

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

        public void Insert_Update_Forma_Pago(Forma_PagoBE objForma_PagoBE)
        {
            String cadena;
            String sql = "Forma_Pago_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@descripcion", objForma_PagoBE.Descripcion);
                        arrParameters[1] = new SqlParameter("@id_forma_pago", objForma_PagoBE.Id_Forma_Pago);
                        arrParameters[2] = new SqlParameter("@nombre", objForma_PagoBE.Nombre);

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

        public List<Forma_PagoBE> Select_Forma_Pago()
        {
            String cadena;
            String sql = "Forma_Pago_Select";
            Forma_PagoBE objForma_PagoBE = null;
            List<Forma_PagoBE> lstForma_PagoBE = null;

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
                                if(lstForma_PagoBE == null)
                                    lstForma_PagoBE = new List<Forma_PagoBE>();

                                objForma_PagoBE = new Forma_PagoBE();
                                objForma_PagoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objForma_PagoBE.Id_Forma_Pago = Convert.ToInt32(dr["id_forma_pago"]);
                                objForma_PagoBE.Nombre = dr["nombre"].ToString();

                                lstForma_PagoBE.Add(objForma_PagoBE);
                            }
                        }
                    }
                }

                return lstForma_PagoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Forma_PagoBE Get_Forma_Pago(Int32 id_forma_pago)
        {
            String cadena;
            String sql = "Forma_Pago_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            Forma_PagoBE objForma_PagoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_forma_pago", id_forma_pago);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objForma_PagoBE = new Forma_PagoBE();
                                objForma_PagoBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objForma_PagoBE.Id_Forma_Pago = Convert.ToInt32(dr["id_forma_pago"]);
                                objForma_PagoBE.Nombre = dr["nombre"].ToString();
                            }
                        }
                    }
                }
                return objForma_PagoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Forma_Pago(Int32 id_forma_pago)
        {
            String cadena;
            String sql = "Forma_Pago_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_forma_pago", id_forma_pago);

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
