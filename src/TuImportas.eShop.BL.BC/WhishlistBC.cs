using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TuImportas.eShop.DL.DALC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.BL.BC
{
    public class WhishlistBC
    {
        WhishlistDALC objWhishlistDALC = new WhishlistDALC();

        public int Insert_Whishlist(WhishlistBE objWhishlistBE)
        {
            try
            {
                return objWhishlistDALC.Insert_Whishlist(objWhishlistBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Update_Whishlist(WhishlistBE objWhishlistBE)
        {
            try
            {
                objWhishlistDALC.Update_Whishlist(objWhishlistBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public int Insert_Update_Whishlist(WhishlistBE objWhishlistBE)
        {
            try
            {
                return objWhishlistDALC.Insert_Update_Whishlist(objWhishlistBE);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<WhishlistBE> Select_Whishlist()
        {
            try
            {
                return objWhishlistDALC.Select_Whishlist();
            }
            catch(Exception)
            {
                throw;
            }
        }

        public WhishlistBE Get_Whishlist(Int32 id_producto, Int32 id_usuario, Int32 id_whishlist)
        {
            try
            {
                return objWhishlistDALC.Get_Whishlist(id_producto, id_usuario, id_whishlist);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public void Delete_Whishlist(Int32 id_producto, Int32 id_usuario, Int32 id_whishlist)
        {
            try
            {
                objWhishlistDALC.Delete_Whishlist(id_producto, id_usuario, id_whishlist);
            }
            catch(Exception)
            {
                throw;
            }
        }

        public List<WhishlistBE> Get_Whishlist_Usuario(Int32 id_usuario)
        {
            try
            {
                return objWhishlistDALC.Get_Whishlist_Usuario(id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Delete_Whishlist_Usuario_Producto(Int32 id_producto, Int32 id_usuario)
        {
            try
            {
                objWhishlistDALC.Delete_Whishlist_Usuario_Producto(id_producto, id_usuario);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
