using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class PedidoDALC
    {
        public int Insert_Pedido(PedidoBE objPedidoBE)
        {
            String cadena;
            String sql = "Pedido_Insert";
            SqlParameter[] arrParameters = new SqlParameter[11];
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

                        arrParameters[0] = new SqlParameter("@id_forma_pago", objPedidoBE.Id_Forma_Pago);
                        arrParameters[1] = new SqlParameter("@id_usuario", objPedidoBE.Id_Usuario);
                        arrParameters[2] = new SqlParameter("@total", objPedidoBE.Total);
                        arrParameters[3] = new SqlParameter("@precio_envio", objPedidoBE.Precio_Envio);
                        arrParameters[4] = new SqlParameter("@subtotal", objPedidoBE.Subtotal);
                        arrParameters[5] = new SqlParameter("@id_tipo_recibo", objPedidoBE.Id_Tipo_Recibo);
                        arrParameters[6] = new SqlParameter("@razon_social", objPedidoBE.Razon_Social);
                        arrParameters[7] = new SqlParameter("@ruc", objPedidoBE.Ruc);
                        arrParameters[8] = new SqlParameter("@operador_logistico", objPedidoBE.Operador_Logistico);
                        arrParameters[9] = new SqlParameter("@tiempo_entrega", objPedidoBE.Tiempo_Entrega);
                        arrParameters[10] = new SqlParameter("@cip", objPedidoBE.Cip);

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

        public void Update_Pedido(PedidoBE objPedidoBE)
        {
            String cadena;
            String sql = "Pedido_Update";
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

                        arrParameters[0] = new SqlParameter("@fecha_compra", objPedidoBE.Fecha_Compra);
                        arrParameters[1] = new SqlParameter("@id_forma_pago", objPedidoBE.Id_Forma_Pago);
                        arrParameters[2] = new SqlParameter("@id_pedido", objPedidoBE.Id_Pedido);
                        arrParameters[3] = new SqlParameter("@id_usuario", objPedidoBE.Id_Usuario);
                        arrParameters[4] = new SqlParameter("@total", objPedidoBE.Total);

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

        public void Update_Pedido_Estado_Cip(string cip, int estado)
        {
            String cadena;
            String sql = "Pedido_Update_Estado_Cip";
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

                        arrParameters[0] = new SqlParameter("@cip", cip);
                        arrParameters[1] = new SqlParameter("@estado", estado);

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

        public void Update_Pedido_Estado(int idPedido, int estado)
        {
            String cadena;
            String sql = "Pedido_Update_Estado";
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

                        arrParameters[0] = new SqlParameter("@id_pedido", idPedido);
                        arrParameters[1] = new SqlParameter("@estado", estado);

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

        public void Insert_Update_Pedido(PedidoBE objPedidoBE)
        {
            String cadena;
            String sql = "Pedido_Insert_Update";
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

                        arrParameters[0] = new SqlParameter("@fecha_compra", objPedidoBE.Fecha_Compra);
                        arrParameters[1] = new SqlParameter("@id_forma_pago", objPedidoBE.Id_Forma_Pago);
                        arrParameters[2] = new SqlParameter("@id_pedido", objPedidoBE.Id_Pedido);
                        arrParameters[3] = new SqlParameter("@id_usuario", objPedidoBE.Id_Usuario);
                        arrParameters[4] = new SqlParameter("@total", objPedidoBE.Total);

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

        public List<PedidoBE> Select_Pedido()
        {
            String cadena;
            String sql = "Pedido_Select";
            PedidoBE objPedidoBE = null;
            List<PedidoBE> lstPedidoBE = null;

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
                                if(lstPedidoBE == null)
                                    lstPedidoBE = new List<PedidoBE>();

                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                                objPedidoBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                                objPedidoBE.Subtotal = Convert.ToDecimal(dr["subtotal"]);
                                objPedidoBE.Id_Tipo_Recibo = Convert.ToInt32(dr["id_tipo_recibo"]);
                                objPedidoBE.Razon_Social = dr["razon_social"] != DBNull.Value ? dr["razon_social"].ToString() : null;
                                objPedidoBE.Ruc = dr["ruc"] != DBNull.Value ? dr["ruc"].ToString() : null;
                                objPedidoBE.Nombre_Forma_Pago = dr["Nombre_Forma_Pago"].ToString();
                                objPedidoBE.Nombre_Tipo_Recibo = dr["Nombre_Tipo_Recibo"].ToString();
                                objPedidoBE.Nombre_Usuario = dr["Nombre_Usuario"].ToString();
                                objPedidoBE.Estado = Convert.ToInt32(dr["estado"]);

                                switch (objPedidoBE.Estado)
                                {
                                    case (int)EstadoPedido.Pedido: objPedidoBE.Nombre_Estado = "Pedido"; break;
                                    case (int)EstadoPedido.Pagado: objPedidoBE.Nombre_Estado = "Pagado"; break;
                                    case (int)EstadoPedido.Expirado: objPedidoBE.Nombre_Estado = "Expirado"; break;
                                    case (int)EstadoPedido.Entregado: objPedidoBE.Nombre_Estado = "Entregado"; break;
                                }

                                lstPedidoBE.Add(objPedidoBE);
                            }
                        }
                    }
                }

                return lstPedidoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido(Int32 id_forma_pago, Int32 id_pedido, Int32 id_usuario)
        {
            String cadena;
            String sql = "Pedido_Get";
            SqlParameter[] arrParameters = new SqlParameter[3];
            PedidoBE objPedidoBE = null;

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
                        arrParameters[1] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[2] = new SqlParameter("@id_usuario", id_usuario);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                            }
                        }
                    }
                }
                return objPedidoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Pedido(Int32 id_forma_pago, Int32 id_pedido, Int32 id_usuario)
        {
            String cadena;
            String sql = "Pedido_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_forma_pago", id_forma_pago);
                        arrParameters[1] = new SqlParameter("@id_pedido", id_pedido);
                        arrParameters[2] = new SqlParameter("@id_usuario", id_usuario);

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

        public List<PedidoBE> Select_Pedido_Usuario(int idUsuario)
        {
            String cadena;
            String sql = "Pedido_Select_Usuario";
            PedidoBE objPedidoBE = null;
            List<PedidoBE> lstPedidoBE = null;
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

                        arrParameters[0] = new SqlParameter("@id_usuario", idUsuario);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstPedidoBE == null)
                                    lstPedidoBE = new List<PedidoBE>();

                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                                objPedidoBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                                objPedidoBE.Subtotal = Convert.ToDecimal(dr["subtotal"]);
                                objPedidoBE.Id_Tipo_Recibo = Convert.ToInt32(dr["id_tipo_recibo"]);
                                objPedidoBE.Razon_Social = dr["razon_social"] != DBNull.Value ? dr["razon_social"].ToString() : null;
                                objPedidoBE.Ruc = dr["ruc"] != DBNull.Value ? dr["ruc"].ToString() : null;
                                objPedidoBE.Nombre_Forma_Pago = dr["Nombre_Forma_Pago"].ToString();
                                objPedidoBE.Nombre_Tipo_Recibo = dr["Nombre_Tipo_Recibo"].ToString();
                                objPedidoBE.Estado = Convert.ToInt32(dr["estado"]);

                                switch (objPedidoBE.Estado)
                                {
                                    case (int)EstadoPedido.Pedido: objPedidoBE.Nombre_Estado = "Pedido"; break;
                                    case (int)EstadoPedido.Pagado: objPedidoBE.Nombre_Estado = "Pagado"; break;
                                    case (int)EstadoPedido.Expirado: objPedidoBE.Nombre_Estado = "Expirado"; break;
                                    case (int)EstadoPedido.Entregado: objPedidoBE.Nombre_Estado = "Entregado"; break;
                                }

                                lstPedidoBE.Add(objPedidoBE);
                            }
                        }
                    }
                }

                return lstPedidoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido_Completo(int idPedido)
        {
            String cadena;
            String sql = "Pedido_Get_Completo";
            PedidoBE objPedidoBE = null;
            Pedido_DireccionBE objPedido_DireccionBE = null;
            Pedido_ProductoBE objPedido_ProductoBE = null;
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

                        arrParameters[0] = new SqlParameter("@id_pedido", idPedido);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                                objPedidoBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                                objPedidoBE.Subtotal = Convert.ToDecimal(dr["subtotal"]);
                                objPedidoBE.Id_Tipo_Recibo = Convert.ToInt32(dr["id_tipo_recibo"]);
                                objPedidoBE.Razon_Social = dr["razon_social"] != DBNull.Value ? dr["razon_social"].ToString() : null;
                                objPedidoBE.Ruc = dr["ruc"] != DBNull.Value ? dr["ruc"].ToString() : null;
                                objPedidoBE.Nombre_Forma_Pago = dr["Nombre_Forma_Pago"].ToString();
                                objPedidoBE.Nombre_Tipo_Recibo = dr["Nombre_Tipo_Recibo"].ToString();
                                objPedidoBE.Fecha_Texto = objPedidoBE.Fecha_Compra.ToString();
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objPedido_DireccionBE = new Pedido_DireccionBE();
                                objPedido_DireccionBE.Id_Pedido_Direccion = Convert.ToInt32(dr["id_pedido_direccion"]);
                                objPedido_DireccionBE.Departamento = dr["departamento"].ToString();
                                objPedido_DireccionBE.Distrito = dr["distrito"].ToString();
                                objPedido_DireccionBE.Provincia = dr["provincia"].ToString();
                                objPedido_DireccionBE.Referencia = dr["referencia"].ToString();
                                objPedido_DireccionBE.Direccion = dr["direccion"].ToString();
                                objPedido_DireccionBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_DireccionBE.Id_Tipo_Direccion = Convert.ToInt32(dr["id_tipo_direccion"]);
                                objPedido_DireccionBE.Nombre_Tipo_Direccion = dr["Nombre_Tipo_Direccion"].ToString();

                                if (objPedido_DireccionBE.Id_Tipo_Direccion == (int)Tipo_Direccion.Envio)
                                    objPedidoBE.objDireccionEnvioBE = objPedido_DireccionBE;
                                else
                                    objPedidoBE.objDireccionFacturacionBE = objPedido_DireccionBE;
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objPedido_ProductoBE = new Pedido_ProductoBE();
                                objPedido_ProductoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objPedido_ProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objPedido_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objPedido_ProductoBE.Color = dr["color"].ToString();
                                objPedido_ProductoBE.Nombre = dr["nombre"].ToString();
                                objPedido_ProductoBE.Imagen = dr["nombre_imagen"].ToString();

                                objPedidoBE.lstPedido_ProductoBE.Add(objPedido_ProductoBE);
                            }
                        }
                    }
                }

                return objPedidoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public PedidoBE Get_Pedido_Completo_Cip(string cip)
        {
            String cadena;
            String sql = "Pedido_Get_Completo_Cip";
            PedidoBE objPedidoBE = null;
            Pedido_DireccionBE objPedido_DireccionBE = null;
            Pedido_ProductoBE objPedido_ProductoBE = null;
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

                        arrParameters[0] = new SqlParameter("@cip", cip);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                                objPedidoBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                                objPedidoBE.Subtotal = Convert.ToDecimal(dr["subtotal"]);
                                objPedidoBE.Id_Tipo_Recibo = Convert.ToInt32(dr["id_tipo_recibo"]);
                                objPedidoBE.Razon_Social = dr["razon_social"] != DBNull.Value ? dr["razon_social"].ToString() : null;
                                objPedidoBE.Ruc = dr["ruc"] != DBNull.Value ? dr["ruc"].ToString() : null;
                                objPedidoBE.Nombre_Forma_Pago = dr["Nombre_Forma_Pago"].ToString();
                                objPedidoBE.Nombre_Tipo_Recibo = dr["Nombre_Tipo_Recibo"].ToString();
                                objPedidoBE.Fecha_Texto = objPedidoBE.Fecha_Compra.ToString();
                                objPedidoBE.Correo_Usuario = dr["email"].ToString();
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objPedido_DireccionBE = new Pedido_DireccionBE();
                                objPedido_DireccionBE.Id_Pedido_Direccion = Convert.ToInt32(dr["id_pedido_direccion"]);
                                objPedido_DireccionBE.Departamento = dr["departamento"].ToString();
                                objPedido_DireccionBE.Distrito = dr["distrito"].ToString();
                                objPedido_DireccionBE.Provincia = dr["provincia"].ToString();
                                objPedido_DireccionBE.Referencia = dr["referencia"].ToString();
                                objPedido_DireccionBE.Direccion = dr["direccion"].ToString();
                                objPedido_DireccionBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_DireccionBE.Id_Tipo_Direccion = Convert.ToInt32(dr["id_tipo_direccion"]);
                                objPedido_DireccionBE.Nombre_Tipo_Direccion = dr["Nombre_Tipo_Direccion"].ToString();

                                if (objPedido_DireccionBE.Id_Tipo_Direccion == (int)Tipo_Direccion.Envio)
                                    objPedidoBE.objDireccionEnvioBE = objPedido_DireccionBE;
                                else
                                    objPedidoBE.objDireccionFacturacionBE = objPedido_DireccionBE;
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objPedido_ProductoBE = new Pedido_ProductoBE();
                                objPedido_ProductoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedido_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objPedido_ProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objPedido_ProductoBE.Cantidad = Convert.ToInt32(dr["cantidad"]);
                                objPedido_ProductoBE.Color = dr["color"].ToString();
                                objPedido_ProductoBE.Nombre = dr["nombre"].ToString();
                                objPedido_ProductoBE.Imagen = dr["nombre_imagen"].ToString();

                                objPedidoBE.lstPedido_ProductoBE.Add(objPedido_ProductoBE);
                            }
                        }
                    }
                }

                return objPedidoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<PedidoBE> Get_Pedido_Buscar(DateTime? fechaCompraInicio, DateTime? fechaCompraFin, string usuario, int? estado)
        {
            String cadena;
            String sql = "Pedido_Buscar";
            PedidoBE objPedidoBE = null;
            List<PedidoBE> lstPedidoBE = null;
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

                        arrParameters[0] = new SqlParameter("@fecha_compra_inicio", fechaCompraInicio);
                        arrParameters[1] = new SqlParameter("@fecha_compra_fin", fechaCompraFin);
                        arrParameters[2] = new SqlParameter("@usuario", usuario);
                        arrParameters[3] = new SqlParameter("@estado", estado);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstPedidoBE == null)
                                    lstPedidoBE = new List<PedidoBE>();

                                objPedidoBE = new PedidoBE();
                                objPedidoBE.Fecha_Compra = Convert.ToDateTime(dr["fecha_compra"]);
                                objPedidoBE.Id_Forma_Pago = dr["id_forma_pago"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_forma_pago"]) : null;
                                objPedidoBE.Id_Pedido = Convert.ToInt32(dr["id_pedido"]);
                                objPedidoBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objPedidoBE.Total = Convert.ToDecimal(dr["total"]);
                                objPedidoBE.Precio_Envio = Convert.ToDecimal(dr["precio_envio"]);
                                objPedidoBE.Subtotal = Convert.ToDecimal(dr["subtotal"]);
                                objPedidoBE.Id_Tipo_Recibo = Convert.ToInt32(dr["id_tipo_recibo"]);
                                objPedidoBE.Razon_Social = dr["razon_social"] != DBNull.Value ? dr["razon_social"].ToString() : null;
                                objPedidoBE.Ruc = dr["ruc"] != DBNull.Value ? dr["ruc"].ToString() : null;
                                objPedidoBE.Nombre_Forma_Pago = dr["Nombre_Forma_Pago"].ToString();
                                objPedidoBE.Nombre_Tipo_Recibo = dr["Nombre_Tipo_Recibo"].ToString();
                                objPedidoBE.Estado = Convert.ToInt32(dr["estado"]);
                                objPedidoBE.Nombre_Usuario = dr["Nombre_Usuario"].ToString();

                                switch (objPedidoBE.Estado)
                                {
                                    case (int)EstadoPedido.Pedido: objPedidoBE.Nombre_Estado = "Pedido"; break;
                                    case (int)EstadoPedido.Pagado: objPedidoBE.Nombre_Estado = "Pagado"; break;
                                    case (int)EstadoPedido.Expirado: objPedidoBE.Nombre_Estado = "Expirado"; break;
                                    case (int)EstadoPedido.Entregado: objPedidoBE.Nombre_Estado = "Entregado"; break;
                                }

                                lstPedidoBE.Add(objPedidoBE);
                            }
                        }
                    }
                }

                return lstPedidoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
