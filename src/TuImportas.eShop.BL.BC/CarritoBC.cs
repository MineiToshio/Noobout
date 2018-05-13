using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class CarritoBC
    {
        CarritoDALC objCarritoDALC = new CarritoDALC();

        public int Insert_Carrito(CarritoBE objCarritoBE)
        {
            try
            {
                return objCarritoDALC.Insert_Carrito(objCarritoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Carrito(CarritoBE objCarritoBE)
        {
            try
            {
                objCarritoDALC.Update_Carrito(objCarritoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Insert_Update_Carrito(CarritoBE objCarritoBE)
        {
            try
            {
                objCarritoDALC.Insert_Update_Carrito(objCarritoBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<CarritoBE> Select_Carrito()
        {
            try
            {
                return objCarritoDALC.Select_Carrito();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public CarritoBE Get_Carrito(Int32 id_carrito)
        {
            try
            {
                return objCarritoDALC.Get_Carrito(id_carrito);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito(Int32 id_carrito, Int32 id_direccion_envio, Int32 id_direccion_facturacion, Int32 id_usuario)
        {
            try
            {
                objCarritoDALC.Delete_Carrito(id_carrito, id_direccion_envio, id_direccion_facturacion, id_usuario);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Carrito_Total(Int32 id_usuario)
        {
            try
            {
                objCarritoDALC.Delete_Carrito_Total(id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public CarritoBE Get_Carrito_Usuario(Int32 id_usuario)
        {
            try
            {
                return objCarritoDALC.Get_Carrito_Usuario(id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
