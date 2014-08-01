using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class Boton_InicioBC
    {
        Boton_InicioDALC objBoton_InicioDALC = new Boton_InicioDALC();

        public int Insert_Boton_Inicio(Boton_InicioBE objBoton_InicioBE)
        {
            try
            {
                return objBoton_InicioDALC.Insert_Boton_Inicio(objBoton_InicioBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Boton_Inicio(Boton_InicioBE objBoton_InicioBE)
        {
            try
            {
                objBoton_InicioDALC.Update_Boton_Inicio(objBoton_InicioBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<Boton_InicioBE> Select_Boton_Inicio()
        {
            try
            {
                return objBoton_InicioDALC.Select_Boton_Inicio();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public Boton_InicioBE Get_Boton_Inicio(Int32 id_boton_inicio)
        {
            try
            {
                return objBoton_InicioDALC.Get_Boton_Inicio(id_boton_inicio);
            }
            catch(Exception)
            {
                throw;
            }
        }

    }
}
