using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class UsuarioBC
    {
        UsuarioDALC objUsuarioDALC = new UsuarioDALC();

        public int Insert_Usuario(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Insert_Usuario(objUsuarioBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Update_Usuario(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Update_Usuario(objUsuarioBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Usuario(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Insert_Update_Usuario(objUsuarioBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<UsuarioBE> Select_Usuario()
        {
            try
            {
                return objUsuarioDALC.Select_Usuario();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<UsuarioBE> Get_Usuario_Buscar(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Get_Usuario_Buscar(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Get_Usuario(Int32 id_usuario)
        {
            try
            {
                return objUsuarioDALC.Get_Usuario(id_usuario);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Usuario(Int32 id_rol, Int32 id_usuario)
        {
            try
            {
                objUsuarioDALC.Delete_Usuario(id_rol, id_usuario);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public UsuarioBE Login(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Login(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Update_Password_Usuario(int idUsuaurio, String passwordAntiguo, String passwordNuevo)
        {
            try
            {
                return objUsuarioDALC.Update_Password_Usuario(idUsuaurio, passwordAntiguo, passwordNuevo);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Usuario_Activar(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Usuario_Activar(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public UsuarioBE Update_Usuario_Recuperar_Pass(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Update_Usuario_Recuperar_Pass(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int Validar_Recuperar_Pass(UsuarioBE objUsuarioBE)
        {
            try
            {
                return objUsuarioDALC.Validar_Recuperar_Pass(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Recuperar_Password(UsuarioBE objUsuarioBE)
        {
            try
            {
                objUsuarioDALC.Recuperar_Password(objUsuarioBE);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Update_Activo_Usuario(int id_usuario)
        {
            try
            {
                objUsuarioDALC.Update_Activo_Usuario(id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
