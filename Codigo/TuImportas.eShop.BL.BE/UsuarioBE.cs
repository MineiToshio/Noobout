using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TuImportas.eShop.BL.BE
{
    public class UsuarioBE
    {
        public Boolean Activo { get; set; }
        public String Apellido_Materno { get; set; }
        public String Apellido_Paterno { get; set; }
        public String Celular { get; set; }
        public String Dni { get; set; }
        public String Email { get; set; }
        public DateTime Fecha_Creacion { get; set; }
        public DateTime? Fecha_Nacimiento { get; set; }
        public Int32 Id_Rol { get; set; }
        public Int32 Id_Usuario { get; set; }
        public String Nombre { get; set; }
        public String Password { get; set; }
        public String Telefono { get; set; }
        public String Usuario { get; set; }
        public bool Activo_Correo { get; set; }
        public String Token_Correo { get; set; }
        public String Token_Recuperacion { get; set; }
        public DateTime Fecha_Ultima_Recuperacion { get; set; }
        public string Nombre_Completo { get; set; }
        public string Img_Habilitado { get; set; }
        public string Rol { get; set; }
        public string Captcha { get; set; }
    }
}
