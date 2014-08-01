using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.DL.DALC
{
    public class UsuarioDALC
    {
        public int Insert_Usuario(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Insert";
            SqlParameter[] arrParameters = new SqlParameter[12];
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

                        arrParameters[0] = new SqlParameter("@apellido_materno", objUsuarioBE.Apellido_Materno);
                        arrParameters[1] = new SqlParameter("@apellido_paterno", objUsuarioBE.Apellido_Paterno);
                        arrParameters[2] = new SqlParameter("@celular", objUsuarioBE.Celular);
                        arrParameters[3] = new SqlParameter("@dni", objUsuarioBE.Dni);
                        arrParameters[4] = new SqlParameter("@email", objUsuarioBE.Email);
                        arrParameters[5] = new SqlParameter("@fecha_nacimiento", objUsuarioBE.Fecha_Nacimiento);
                        arrParameters[6] = new SqlParameter("@id_rol", objUsuarioBE.Id_Rol);
                        arrParameters[7] = new SqlParameter("@nombre", objUsuarioBE.Nombre);
                        arrParameters[8] = new SqlParameter("@password", objUsuarioBE.Password);
                        arrParameters[9] = new SqlParameter("@telefono", objUsuarioBE.Telefono);
                        arrParameters[10] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[11] = new SqlParameter("@token_correo", objUsuarioBE.Token_Correo);

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

        public int Update_Usuario(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Update";
            SqlParameter[] arrParameters = new SqlParameter[10];
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

                        arrParameters[0] = new SqlParameter("@apellido_materno", objUsuarioBE.Apellido_Materno);
                        arrParameters[1] = new SqlParameter("@apellido_paterno", objUsuarioBE.Apellido_Paterno);
                        arrParameters[2] = new SqlParameter("@celular", objUsuarioBE.Celular);
                        arrParameters[3] = new SqlParameter("@dni", objUsuarioBE.Dni);
                        arrParameters[4] = new SqlParameter("@email", objUsuarioBE.Email);
                        arrParameters[5] = new SqlParameter("@id_usuario", objUsuarioBE.Id_Usuario);
                        arrParameters[6] = new SqlParameter("@nombre", objUsuarioBE.Nombre);
                        arrParameters[7] = new SqlParameter("@telefono", objUsuarioBE.Telefono);
                        arrParameters[8] = new SqlParameter("@token_correo", objUsuarioBE.Token_Correo);
                        arrParameters[9] = new SqlParameter("@id_rol", objUsuarioBE.Id_Rol);

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

        public int Insert_Update_Usuario(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Insert_Update";
            int codigo = 0;
            SqlParameter[] arrParameters = new SqlParameter[14];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@activo", objUsuarioBE.Activo);
                        arrParameters[1] = new SqlParameter("@apellido_materno", objUsuarioBE.Apellido_Materno);
                        arrParameters[2] = new SqlParameter("@apellido_paterno", objUsuarioBE.Apellido_Paterno);
                        arrParameters[3] = new SqlParameter("@celular", objUsuarioBE.Celular);
                        arrParameters[4] = new SqlParameter("@dni", objUsuarioBE.Dni);
                        arrParameters[5] = new SqlParameter("@email", objUsuarioBE.Email);
                        arrParameters[6] = new SqlParameter("@fecha_creacion", objUsuarioBE.Fecha_Creacion);
                        arrParameters[7] = new SqlParameter("@fecha_nacimiento", objUsuarioBE.Fecha_Nacimiento);
                        arrParameters[8] = new SqlParameter("@id_rol", objUsuarioBE.Id_Rol);
                        arrParameters[9] = new SqlParameter("@id_usuario", objUsuarioBE.Id_Usuario);
                        arrParameters[10] = new SqlParameter("@nombre", objUsuarioBE.Nombre);
                        arrParameters[11] = new SqlParameter("@password", objUsuarioBE.Password);
                        arrParameters[12] = new SqlParameter("@telefono", objUsuarioBE.Telefono);
                        arrParameters[13] = new SqlParameter("@usuario", objUsuarioBE.Usuario);

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

        public List<UsuarioBE> Select_Usuario()
        {
            String cadena;
            String sql = "Usuario_Select";
            UsuarioBE objUsuarioBE = null;
            List<UsuarioBE> lstUsuarioBE = null;

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
                                if(lstUsuarioBE == null)
                                    lstUsuarioBE = new List<UsuarioBE>();

                                objUsuarioBE = new UsuarioBE();
                                objUsuarioBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objUsuarioBE.Apellido_Materno = dr["apellido_materno"] != DBNull.Value ? dr["apellido_materno"].ToString() : null;
                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Celular = dr["celular"] != DBNull.Value ? dr["celular"].ToString() : null;
                                objUsuarioBE.Dni = dr["dni"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objUsuarioBE.Fecha_Nacimiento = dr["fecha_nacimiento"] != DBNull.Value ? (DateTime?)Convert.ToDateTime(dr["fecha_nacimiento"]) : null;
                                objUsuarioBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objUsuarioBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Password = dr["password"].ToString();
                                objUsuarioBE.Telefono = dr["telefono"] != DBNull.Value ? dr["telefono"].ToString() : null;
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Nombre_Completo = objUsuarioBE.Nombre + " " + objUsuarioBE.Apellido_Paterno + (objUsuarioBE.Apellido_Materno != null ? " " + objUsuarioBE.Apellido_Materno : "");
                                objUsuarioBE.Img_Habilitado = "/images/" + ((Boolean)objUsuarioBE.Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                                objUsuarioBE.Rol = objUsuarioBE.Id_Rol == (int)Rol.Admin ? "Admin" : "Usuario";

                                lstUsuarioBE.Add(objUsuarioBE);
                            }
                        }
                    }
                }

                return lstUsuarioBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<UsuarioBE> Get_Usuario_Buscar(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Buscar";
            SqlParameter[] arrParameters = new SqlParameter[7];
            List<UsuarioBE> lstUsuarioBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[1] = new SqlParameter("@nombre", objUsuarioBE.Nombre);
                        arrParameters[2] = new SqlParameter("@apellido_paterno", objUsuarioBE.Apellido_Paterno);
                        arrParameters[3] = new SqlParameter("@apellido_materno", objUsuarioBE.Apellido_Materno);
                        arrParameters[4] = new SqlParameter("@dni", objUsuarioBE.Dni);
                        arrParameters[5] = new SqlParameter("@activo", objUsuarioBE.Activo);
                        arrParameters[6] = new SqlParameter("@email", objUsuarioBE.Email);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                if (lstUsuarioBE == null)
                                    lstUsuarioBE = new List<UsuarioBE>();

                                objUsuarioBE = new UsuarioBE();
                                objUsuarioBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objUsuarioBE.Apellido_Materno = dr["apellido_materno"] != DBNull.Value ? dr["apellido_materno"].ToString() : null;
                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Celular = dr["celular"] != DBNull.Value ? dr["celular"].ToString() : null;
                                objUsuarioBE.Dni = dr["dni"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objUsuarioBE.Fecha_Nacimiento = dr["fecha_nacimiento"] != DBNull.Value ? (DateTime?)Convert.ToDateTime(dr["fecha_nacimiento"]) : null;
                                objUsuarioBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objUsuarioBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Password = dr["password"].ToString();
                                objUsuarioBE.Telefono = dr["telefono"] != DBNull.Value ? dr["telefono"].ToString() : null;
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Nombre_Completo = objUsuarioBE.Nombre + " " + objUsuarioBE.Apellido_Paterno + (objUsuarioBE.Apellido_Materno != null ? " " + objUsuarioBE.Apellido_Materno : "");
                                objUsuarioBE.Img_Habilitado = "/images/" + ((Boolean)objUsuarioBE.Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                                objUsuarioBE.Rol = objUsuarioBE.Id_Rol == (int)Rol.Admin ? "Admin" : "Usuario";

                                lstUsuarioBE.Add(objUsuarioBE);
                            }
                        }
                    }
                }

                return lstUsuarioBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Get_Usuario(Int32 id_usuario)
        {
            String cadena;
            String sql = "Usuario_Get";
            SqlParameter[] arrParameters = new SqlParameter[1];
            UsuarioBE objUsuarioBE = null;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using(SqlConnection conn = new SqlConnection(cadena))
                {
                    using(SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_usuario", id_usuario);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        using(SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while(dr.Read())
                            {
                                objUsuarioBE = new UsuarioBE();
                                objUsuarioBE.Activo = Convert.ToBoolean(dr["activo"]);
                                objUsuarioBE.Apellido_Materno = dr["apellido_materno"] != DBNull.Value ? dr["apellido_materno"].ToString() : null;
                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Celular = dr["celular"] != DBNull.Value ? dr["celular"].ToString() : null;
                                objUsuarioBE.Dni = dr["dni"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objUsuarioBE.Fecha_Nacimiento = dr["fecha_nacimiento"] != DBNull.Value ? (DateTime?)Convert.ToDateTime(dr["fecha_nacimiento"]) : null;
                                objUsuarioBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objUsuarioBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Password = dr["password"].ToString();
                                objUsuarioBE.Telefono = dr["telefono"] != DBNull.Value ? dr["telefono"].ToString() : null;
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Nombre_Completo = objUsuarioBE.Nombre + " " + objUsuarioBE.Apellido_Paterno + (objUsuarioBE.Apellido_Materno != null ? " " + objUsuarioBE.Apellido_Materno : "");
                            }
                        }
                    }
                }
                return objUsuarioBE;
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Usuario(Int32 id_rol, Int32 id_usuario)
        {
            String cadena;
            String sql = "Usuario_Delete";
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

                        arrParameters[0] = new SqlParameter("@id_rol", id_rol);
                        arrParameters[1] = new SqlParameter("@id_usuario", id_usuario);

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

        public UsuarioBE Login(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Login";
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

                        arrParameters[0] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[1] = new SqlParameter("@password", objUsuarioBE.Password);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        objUsuarioBE = null;

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                objUsuarioBE = new UsuarioBE();
                                
                                objUsuarioBE.Apellido_Materno = dr["apellido_materno"] != DBNull.Value ? dr["apellido_materno"].ToString() : null;
                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Celular = dr["celular"] != DBNull.Value ? dr["celular"].ToString() : null;
                                objUsuarioBE.Dni = dr["dni"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objUsuarioBE.Fecha_Nacimiento = dr["fecha_nacimiento"] != DBNull.Value ? (DateTime?)Convert.ToDateTime(dr["fecha_nacimiento"]) : null;
                                objUsuarioBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objUsuarioBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Telefono = dr["telefono"] != DBNull.Value ? dr["telefono"].ToString() : null;
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Activo_Correo = Convert.ToBoolean(dr["activo_correo"]);
                                objUsuarioBE.Nombre_Completo = objUsuarioBE.Nombre + " " + objUsuarioBE.Apellido_Paterno + (objUsuarioBE.Apellido_Materno != null ? " " + objUsuarioBE.Apellido_Materno : "");
                            }
                        }
                    }
                }
                return objUsuarioBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Update_Password_Usuario(int idUsuaurio, String passwordAntiguo, String passwordNuevo)
        {
            String cadena;
            String sql = "Usuario_Update_Password";
            SqlParameter[] arrParameters = new SqlParameter[3];
            int codigo = 0;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@id_usuario", idUsuaurio);
                        arrParameters[1] = new SqlParameter("@password_antiguo", passwordAntiguo);
                        arrParameters[2] = new SqlParameter("@password_nuevo", passwordNuevo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        codigo = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }

                return codigo;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Usuario_Activar(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Activar";
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

                        arrParameters[0] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[1] = new SqlParameter("@token_correo", objUsuarioBE.Token_Correo);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        objUsuarioBE = null;

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                objUsuarioBE = new UsuarioBE();

                                objUsuarioBE.Apellido_Materno = dr["apellido_materno"] != DBNull.Value ? dr["apellido_materno"].ToString() : null;
                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Celular = dr["celular"] != DBNull.Value ? dr["celular"].ToString() : null;
                                objUsuarioBE.Dni = dr["dni"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Fecha_Creacion = Convert.ToDateTime(dr["fecha_creacion"]);
                                objUsuarioBE.Fecha_Nacimiento = dr["fecha_nacimiento"] != DBNull.Value ? (DateTime?)Convert.ToDateTime(dr["fecha_nacimiento"]) : null;
                                objUsuarioBE.Id_Rol = Convert.ToInt32(dr["id_rol"]);
                                objUsuarioBE.Id_Usuario = Convert.ToInt32(dr["id_usuario"]);
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Telefono = dr["telefono"] != DBNull.Value ? dr["telefono"].ToString() : null;
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Activo_Correo = Convert.ToBoolean(dr["activo_correo"]);
                            }
                        }
                    }
                }
                return objUsuarioBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Update_Usuario_Recuperar_Pass(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Update_Recuperar_Pass";
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

                        arrParameters[0] = new SqlParameter("@email", objUsuarioBE.Email);
                        arrParameters[1] = new SqlParameter("@token_recuperacion", objUsuarioBE.Token_Recuperacion);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        objUsuarioBE = null;

                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                objUsuarioBE = new UsuarioBE();

                                objUsuarioBE.Apellido_Paterno = dr["apellido_paterno"].ToString();
                                objUsuarioBE.Email = dr["email"].ToString();
                                objUsuarioBE.Nombre = dr["nombre"].ToString();
                                objUsuarioBE.Usuario = dr["usuario"].ToString();
                                objUsuarioBE.Token_Recuperacion = dr["token_recuperacion"].ToString();
                            }
                        }
                    }
                }

                return objUsuarioBE;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Validar_Recuperar_Pass(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Validar_Recuperar_Pass";
            SqlParameter[] arrParameters = new SqlParameter[2];
            int codigo;

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[1] = new SqlParameter("@token_recuperacion", objUsuarioBE.Token_Recuperacion);

                        for (int i = 0; i < arrParameters.Length; i++)
                            cmd.Parameters.Add(arrParameters[i]);

                        cmd.Connection.Open();

                        codigo = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                }

                return codigo;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Recuperar_Password(UsuarioBE objUsuarioBE)
        {
            String cadena;
            String sql = "Usuario_Update_Recuperar_Pass_Nuevo";
            SqlParameter[] arrParameters = new SqlParameter[3];

            try
            {
                cadena = Tool.GetCadenaConexion();

                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    using (SqlCommand cmd = conn.CreateCommand())
                    {
                        cmd.CommandText = sql;
                        cmd.CommandType = CommandType.StoredProcedure;

                        arrParameters[0] = new SqlParameter("@usuario", objUsuarioBE.Usuario);
                        arrParameters[1] = new SqlParameter("@password", objUsuarioBE.Password);
                        arrParameters[2] = new SqlParameter("@token_recuperacion", objUsuarioBE.Token_Recuperacion);

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

        public void Update_Activo_Usuario(int id_usuario)
        {
            String cadena;
            String sql = "Usuario_Update_Activo";
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
    }
}
