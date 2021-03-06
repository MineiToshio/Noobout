﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.usercontrol
{
    public partial class ucProducto : System.Web.UI.UserControl
    {
        const string PATH_IMG_PROD = "/images/productos/";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void SetParametros(ProductoBE objProductoBE)
        {
            //imgProducto.ImageUrl = "/images/productos/" + objProductoBE.lstImagen_ProductoBE[0].Nombre;
            lblVerMas.Text = "<a ID=\"lnkVerMas\" class=\"btn more btn-primary\" href=\"/Producto/" + objProductoBE.Id_Producto + "\">ver más</a>";
            lblNombre.Text = objProductoBE.Nombre;
            lblDescripcion.Text = objProductoBE.Descripcion_Corta;
            lblPrecio.Text = objProductoBE.Precio.ToString();
            hdIdProducto.Value = objProductoBE.Id_Producto.ToString();
            pnlImagen.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[0].Nombre + "')");
        }

        protected void lnkAnadir_Click(object sender, EventArgs e)
        {
            if (Tools.AñadirCarrito(Convert.ToInt32(hdIdProducto.Value), 1, null))
            {
                eshop masterPage = (eshop)Page.Master;
                masterPage.CargarItemsCarrito();
            }
        }

        protected void lnkAgregarWhishlist_Click(object sender, EventArgs e)
        {
            if (Session["USUARIO"] == null)
                Tools.Alert("Por favor ingrese con su usuario", "Favoritos", GetType(), this);
        }
    }
}