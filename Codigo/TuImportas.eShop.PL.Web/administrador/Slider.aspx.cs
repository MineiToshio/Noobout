using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Slider : System.Web.UI.Page
    {
        const string PATH_IMG_BACK = "/images/sliders/";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {

                    if (Request.QueryString["id"] == null)
                    {
                        ViewState["MODO"] = Modo.Insertar;
                    }
                    else
                    {
                        ViewState["MODO"] = Modo.Editar;
                        ViewState["ID_SLIDER"] = Request.QueryString["id"];

                        MostrarSlider();
                    }

                    MostrarModo();
                }
            }
        }

        private void MostrarModo()
        {
            if ((Modo)ViewState["MODO"] == Modo.Insertar)
            {
                fuFondo.Visible = true;
                fuImagen.Visible = true;
                pnlImagen1.Visible = false;
                pnlImagen2.Visible = false;
            }
            else if ((Modo)ViewState["MODO"] == Modo.Editar)
            {
                fuFondo.Visible = false;
                fuImagen.Visible = false;
                pnlImagen1.Visible = true;
                pnlImagen2.Visible = true;
            }
        }

        private void MostrarSlider()
        {
            SliderBC objSliderBC = new SliderBC();
            SliderBE objSliderBE = new SliderBE();

            try
            {
                string path = MapPath(PATH_IMG_BACK);
                objSliderBE = objSliderBC.Get_Slider(Convert.ToInt32(ViewState["ID_SLIDER"]));

                txtBoton.Text = objSliderBE.Boton;
                txtDescripcion.Text = objSliderBE.Descripcion;
                txtNombre.Text = objSliderBE.Nombre;
                txtUrl.Text = objSliderBE.Url;
                pnlImagen1.Style.Add("background-image", "url('" + PATH_IMG_BACK + objSliderBE.Background + "')");
                pnlImagen2.Style.Add("background-image", "url('" + PATH_IMG_BACK + objSliderBE.Imagen + "')");
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SliderBE objSliderBE = new SliderBE();
            SliderBC objSliderBC = new SliderBC();

            try
            {
                objSliderBE.Boton = txtBoton.Text.Trim();
                objSliderBE.Descripcion = txtDescripcion.Text.Trim();
                objSliderBE.Nombre = txtNombre.Text.Trim();
                objSliderBE.Url = txtUrl.Text.Trim();

                if ((Modo)ViewState["MODO"] == Modo.Insertar)
                {
                    objSliderBE.Background = Path.GetExtension(fuFondo.FileName);
                    objSliderBE.Imagen = Path.GetExtension(fuImagen.FileName);
                    string path = MapPath(PATH_IMG_BACK);

                    int codigo = objSliderBC.Insert_Slider(objSliderBE);

                    fuFondo.SaveAs(path + codigo + objSliderBE.Background);
                    fuImagen.SaveAs(path + "img" + codigo + objSliderBE.Imagen);
                }
                else if ((Modo)ViewState["MODO"] == Modo.Editar)
                {
                    objSliderBE.Id_Slider = Convert.ToInt32(ViewState["ID_SLIDER"]);
                    objSliderBC.Update_Slider(objSliderBE);
                }

                Response.Redirect("/Administrador/Sliders.aspx");
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            SliderBE objSliderBE = new SliderBE();
            SliderBC objSliderBC = new SliderBC();
            string nombre_img = "";

            try
            {
                if (fuNuevaImagen.HasFile)
                {
                    string ext = Path.GetExtension(fuNuevaImagen.FileName);

                    if (Tools.EsImagen(ext))
                    {
                        string idPanel = hdImagenCodigo.Value;
                        string rutaImagen = hdRutaImagen.Value;
                        rutaImagen = rutaImagen.Remove(0, 4);
                        rutaImagen = rutaImagen.Remove(rutaImagen.Length - 1);

                        objSliderBE.Id_Slider = Convert.ToInt32(ViewState["ID_SLIDER"]);

                        switch (idPanel)
                        { 
                            case "1":
                                nombre_img = ViewState["ID_SLIDER"] + ext;
                                objSliderBE.Background = nombre_img;
                                objSliderBC.Update_Slider_Background(objSliderBE);
                                pnlImagen1.Style.Add("background-image", "url('" + PATH_IMG_BACK + nombre_img + "?r=" + (new Random().Next()) + "')");
                                break;
                            case "2":
                                nombre_img = "img" + ViewState["ID_SLIDER"] + ext;
                                objSliderBE.Imagen = nombre_img;
                                objSliderBC.Update_Slider_Imagen(objSliderBE);
                                pnlImagen2.Style.Add("background-image", "url('" + PATH_IMG_BACK + nombre_img + "?r=" + (new Random().Next()) + "')");
                                break;
                        }

                        string path = MapPath(PATH_IMG_BACK);
                        File.Delete(path + Path.GetFileName(rutaImagen));
                        fuNuevaImagen.SaveAs(path + nombre_img);
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