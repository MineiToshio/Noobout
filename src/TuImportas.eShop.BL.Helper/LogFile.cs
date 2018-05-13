using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuImportas.eShop.BL.Helper
{
    public class LogFile
    {
        public static void EscribirLog(Exception ex)
        {
            // Create a writer and open the file:
            StreamWriter log;
            //String ruta = System.Configuration.ConfigurationManager.AppSettings["LogDir"].ToString() + "logfile.txt";
            String ruta = Directory.GetParent(System.AppDomain.CurrentDomain.BaseDirectory) + @"\Error\ErrorLog.txt";

            if (!File.Exists(@ruta))
            {
                log = new StreamWriter(@ruta);
            }
            else
            {
                log = File.AppendText(@ruta);
            }

            DateTime now = HelperTools.GetDate();

            log.WriteLine("Tipo: " + ex.GetType().FullName);
            log.WriteLine("Mensaje: " + ex.Message);
            log.WriteLine("Fuente: " + ex.Source);
            log.WriteLine("StackTrace: " + ex.StackTrace);
            EscribirInner(ex, log, 1);
            log.WriteLine("Día/Hora: " + now);
            log.WriteLine("===========================================================================================");

            // Close the stream:
            log.Close();
        }

        public static void EscribirInner(Exception ex, StreamWriter log, int nroInner)
        {
            if (ex.InnerException != null)
            {
                log.WriteLine("Inner StackTrace " + nroInner + ": " + ex.InnerException.StackTrace);
                EscribirInner(ex.InnerException, log, nroInner++);
            }
            else
                return;
        }
    }
}
