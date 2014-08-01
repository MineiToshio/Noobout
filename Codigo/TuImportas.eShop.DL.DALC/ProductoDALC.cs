using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class ProductoDALC
    {
        public int Insert_Producto(ProductoBE objProductoBE)
        {
            String cadena;
            String sql = "Producto_Insert";
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

                        arrParameters[0] = new SqlParameter("@destacado", objProductoBE.Destacado);
                        arrParameters[1] = new SqlParameter("@descripcion", objProductoBE.Descripcion);
                        arrParameters[2] = new SqlParameter("@descuento", objProductoBE.Descuento);
                        arrParameters[3] = new SqlParameter("@detalle", objProductoBE.Detalle);
                        arrParameters[4] = new SqlParameter("@id_usuario_creacion", objProductoBE.Id_Usuario_Creacion);
                        arrParameters[5] = new SqlParameter("@id_usuario_modificacion", objProductoBE.Id_Usuario_Modificacion);
                        arrParameters[6] = new SqlParameter("@nombre", objProductoBE.Nombre);
                        arrParameters[7] = new SqlParameter("@precio", objProductoBE.Precio);
                        arrParameters[8] = new SqlParameter("@descripcion_corta", objProductoBE.Descripcion_Corta);
                        arrParameters[9] = new SqlParameter("@caracteristica_tecnica", objProductoBE.Caracteristica_Tecnica);
                        arrParameters[10] = new SqlParameter("@youtube", objProductoBE.Youtube);

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

        public void Update_Producto(ProductoBE objProductoBE)
        {
            String cadena;
            String sql = "Producto_Update";
            SqlParameter[] arrParameters = new SqlParameter[11];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@destacado", objProductoBE.Destacado);
                        arrParameters[1] = new SqlParameter("@descripcion", objProductoBE.Descripcion);
                        arrParameters[2] = new SqlParameter("@descuento", objProductoBE.Descuento);
                        arrParameters[3] = new SqlParameter("@detalle", objProductoBE.Detalle);
                        arrParameters[4] = new SqlParameter("@id_usuario_modificacion", objProductoBE.Id_Usuario_Creacion);
                        arrParameters[5] = new SqlParameter("@nombre", objProductoBE.Nombre);
                        arrParameters[6] = new SqlParameter("@precio", objProductoBE.Precio);
                        arrParameters[7] = new SqlParameter("@descripcion_corta", objProductoBE.Descripcion_Corta);
                        arrParameters[8] = new SqlParameter("@caracteristica_tecnica", objProductoBE.Caracteristica_Tecnica);
                        arrParameters[9] = new SqlParameter("@youtube", objProductoBE.Youtube);
                        arrParameters[10] = new SqlParameter("@id_producto", objProductoBE.Id_Producto);

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

        public int Insert_Update_Producto(ProductoBE objProductoBE)
        {
            String cadena;
            String sql = "Producto_Insert_Update";
            int codigo = 0;
            SqlParameter[] arrParameters = new SqlParameter[11];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@activo", objProductoBE.Activo);
                        arrParameters[1] = new SqlParameter("@descripcion", objProductoBE.Descripcion);
                        arrParameters[2] = new SqlParameter("@descuento", objProductoBE.Descuento);
                        arrParameters[3] = new SqlParameter("@detalle", objProductoBE.Detalle);
                        arrParameters[4] = new SqlParameter("@fecha_creacion", objProductoBE.Fecha_Creacion);
                        arrParameters[5] = new SqlParameter("@fecha_modificacion", objProductoBE.Fecha_Modificacion);
                        arrParameters[6] = new SqlParameter("@id_producto", objProductoBE.Id_Producto);
                        arrParameters[7] = new SqlParameter("@id_usuario_creacion", objProductoBE.Id_Usuario_Creacion);
                        arrParameters[8] = new SqlParameter("@id_usuario_modificacion", objProductoBE.Id_Usuario_Modificacion);
                        arrParameters[9] = new SqlParameter("@nombre", objProductoBE.Nombre);
                        arrParameters[10] = new SqlParameter("@precio", objProductoBE.Precio);

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

        public List<ProductoBE> Select_Producto()
        {
            String cadena;
            String sql = "Producto_Select";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;
            ColorBE objColorBE = null;
            CategoriaBE objCategoriaBE = null;

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
                                if(lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();
                                objProductoBE.Img_Habilitado = "/images/" + (objProductoBE.Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                                objProductoBE.Ruta_Img_Principal = "/images/productos/" + dr["nombre_imagen"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objColorBE = new ColorBE();

                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                //objProductoBE = new ProductoBE();
                                //objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstColorBE.Add(objColorBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (int?)Convert.ToInt32(dr["id_padre"]) : null;

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstCategoriaBE.Add(objCategoriaBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public ProductoBE Get_Producto(Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            ProductoBE objProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;
            CategoriaBE objCategoriaBE = null;
            ColorBE objColorBE = null;

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

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();
                                objProductoBE.Escoger_Color = Convert.ToBoolean(dr["escoger_color"]);
                                objProductoBE.Caracteristica_Tecnica = dr["caracteristica_tecnica"].ToString();
                                objProductoBE.Youtube = dr["youtube"] != DBNull.Value ? dr["youtube"].ToString() : null;
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (Int32?)Convert.ToInt32(dr["id_padre"]) : null;

                                objProductoBE.lstCategoriaBE.Add(objCategoriaBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objColorBE = new ColorBE();
                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                objProductoBE.lstColorBE.Add(objColorBE);
                            }
                        }
                    }
                }
                return objProductoBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Producto(Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_producto", id_producto);

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

        public List<ProductoBE> Select_Producto_Destacado()
        {
            String cadena;
            String sql = "Producto_Select_Destacado";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;

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
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Nuevo()
        {
            String cadena;
            String sql = "Producto_Select_Nuevos";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;

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
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Popular()
        {
            String cadena;
            String sql = "Producto_Select_Populares";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;

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
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Select_Producto_Top_Categoria(int idCategoria, int idProducto)
        {
            String cadena;
            String sql = "Producto_Select_Top_Categoria";
            SqlParameter[] arrParameters = new SqlParameter[2];
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_categoria", idCategoria);
                        arrParameters[1] = new SqlParameter("@id_producto", idProducto);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Get_Producto_Categoria(int idCategoria)
        {
            String cadena;
            String sql = "Producto_Get_Categoria";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;
            ColorBE objColorBE = null;
            CategoriaBE objCategoriaBE = null;
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

                        arrParameters[0] = new SqlParameter("@id_categoria", idCategoria);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objColorBE = new ColorBE();

                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                //objProductoBE = new ProductoBE();
                                //objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstColorBE.Add(objColorBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (int?)Convert.ToInt32(dr["id_padre"]) : null;

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstCategoriaBE.Add(objCategoriaBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<ProductoBE> Get_Producto_Buscar(string nombre, bool? activo) 
        {
            String cadena;
            String sql = "Producto_Buscar";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;
            ColorBE objColorBE = null;
            CategoriaBE objCategoriaBE = null;
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

                        arrParameters[0] = new SqlParameter("@nombre", nombre);
                        arrParameters[1] = new SqlParameter("@activo", activo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();
                                objProductoBE.Img_Habilitado = "/images/" + (objProductoBE.Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                                objProductoBE.Ruta_Img_Principal = "/images/productos/" + dr["nombre_imagen"].ToString();

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objColorBE = new ColorBE();

                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                //objProductoBE = new ProductoBE();
                                //objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstColorBE.Add(objColorBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (int?)Convert.ToInt32(dr["id_padre"]) : null;

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstCategoriaBE.Add(objCategoriaBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Producto_Activo(Int32 id_producto)
        {
            String cadena;
            String sql = "Producto_Update_Activo";
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

        public List<ProductoBE> Select_Producto_Activo()
        {
            String cadena;
            String sql = "Producto_Select_Activos";
            ProductoBE objProductoBE = null;
            List<ProductoBE> lstProductoBE = null;
            Imagen_ProductoBE objImagen_ProductoBE = null;
            ColorBE objColorBE = null;
            CategoriaBE objCategoriaBE = null;

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
                                if (lstProductoBE == null)
                                    lstProductoBE = new List<ProductoBE>();

                                objProductoBE = new ProductoBE();
                                objProductoBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objProductoBE.Descripcion_Corta = dr["descripcion_corta"].ToString();
                                objProductoBE.Descuento = dr["descuento"] != DBNull.Value ? (Decimal?)Convert.ToDecimal(dr["descuento"]) : null;
                                objProductoBE.Detalle = dr["detalle"].ToString();
                                objProductoBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objProductoBE.Fecha_Modificacion = Convert.ToDateTime(dr["fecha_modificacion"]);
                                objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objProductoBE.Id_Usuario_Creacion = Convert.ToInt32(dr["id_usuario_creacion"]);
                                objProductoBE.Id_Usuario_Modificacion = Convert.ToInt32(dr["id_usuario_modificacion"]);
                                objProductoBE.Nombre = dr["nombre"].ToString();
                                objProductoBE.Precio = Convert.ToDecimal(dr["precio"]);
                                objProductoBE.Destacado = Convert.ToBoolean(dr["destacado"]);
                                objProductoBE.Cantidad_Vendidos = Convert.ToInt32(dr["cantidad_vendidos"]);
                                objProductoBE.Descripcion = dr["descripcion"].ToString();
                                objProductoBE.Img_Habilitado = "/images/" + (objProductoBE.Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");

                                objImagen_ProductoBE = new Imagen_ProductoBE();
                                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(dr["id_imagen"]);
                                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);
                                objImagen_ProductoBE.Nombre = dr["nombre_imagen"].ToString();
                                objImagen_ProductoBE.Mostrar_Primero = Convert.ToBoolean(dr["mostrar_primero"].ToString());

                                objProductoBE.lstImagen_ProductoBE.Add(objImagen_ProductoBE);

                                lstProductoBE.Add(objProductoBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objColorBE = new ColorBE();

                                objColorBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objColorBE.Id_Color = Convert.ToInt32(dr["id_color"]);
                                objColorBE.Nombre = dr["nombre"].ToString();

                                //objProductoBE = new ProductoBE();
                                //objProductoBE.Id_Producto = Convert.ToInt32(dr["id_producto"]);

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstColorBE.Add(objColorBE);
                            }

                            dr.NextResult();

                            while (dr.Read())
                            {
                                objCategoriaBE = new CategoriaBE();
                                objCategoriaBE.Descripcion = dr["descripcion"] != DBNull.Value ? dr["descripcion"].ToString() : null;
                                objCategoriaBE.Id_Categoria = Convert.ToInt32(dr["id_categoria"]);
                                objCategoriaBE.Nombre = dr["nombre"].ToString();
                                objCategoriaBE.Id_Padre = dr["id_padre"] != DBNull.Value ? (int?)Convert.ToInt32(dr["id_padre"]) : null;

                                lstProductoBE.Find(x => x.Id_Producto == Convert.ToInt32(dr["id_producto"])).lstCategoriaBE.Add(objCategoriaBE);
                            }
                        }
                    }
                }

                return lstProductoBE;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
