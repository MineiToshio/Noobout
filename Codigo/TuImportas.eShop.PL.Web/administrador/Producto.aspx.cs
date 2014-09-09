using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Producto : System.Web.UI.Page
    {
        const string PATH_IMG_PROD = "/images/productos/";
        const string NO_IMAGE = "/images/no-image.png";
        

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        //LlenarColores();
                        LlenarCategorias();

                        if (Request.QueryString["id_producto"] == null)
                        {
                            ViewState["MODO"] = Modo.Insertar;
                            ViewState["ATRIBUTOS"] = "";
                        }
                        else
                        {
                            ViewState["MODO"] = Modo.Editar;
                            ViewState["ID_PRODUCTO"] = Request.QueryString["id_producto"];

                            MostrarProducto();
                        }

                        MostrarModo();
                        LlenarAtributos();
                        
                    }
                }

                CrearAtributos();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void MostrarProducto()
        {
            ProductoBC objProductoBC = new ProductoBC();

            try
            {
                ProductoBE objProductoBE = objProductoBC.Get_Producto(Convert.ToInt32(Request.QueryString["id_producto"]));

                txtNombre.Text = objProductoBE.Nombre;
                txtPrecio.Text = objProductoBE.Precio.ToString();
                chkDestacado.Checked = objProductoBE.Destacado;
                txtDescripcionCorta.Text = objProductoBE.Descripcion_Corta;
                txtDescripcion.Text = objProductoBE.Descripcion;
                txtYoutube.Text = objProductoBE.Youtube;
                txtDetalle.Text =objProductoBE.Detalle;
                txtCaracteristicaTecnica.Text = objProductoBE.Caracteristica_Tecnica;

                lbCategoriaDestino.DataSource = objProductoBE.lstCategoriaBE;
                lbCategoriaDestino.DataValueField = "Id_Categoria";
                lbCategoriaDestino.DataTextField = "Nombre";
                lbCategoriaDestino.DataBind();

                foreach (CategoriaBE c in objProductoBE.lstCategoriaBE)
                    lbCategoriaPartida.Items.Remove(new ListItem(c.Nombre, c.Id_Categoria.ToString()));

                //lbColorDestino.DataSource = objProductoBE.lstColorBE;
                //lbColorDestino.DataValueField = "Id_Color";
                //lbColorDestino.DataTextField = "Nombre";
                //lbColorDestino.DataBind();

                //foreach (ColorBE c in objProductoBE.lstColorBE)
                //    lbColorPartida.Items.Remove(new ListItem(c.Nombre, c.Id_Color.ToString()));

                //string path = "/images/productos/";

                pnlImagen1.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[0].Nombre + "')");

                if (objProductoBE.lstImagen_ProductoBE.Count >= 2)
                    pnlImagen2.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[1].Nombre + "')");
                else
                    lnkEliminarImagen2.Visible = false;

                if (objProductoBE.lstImagen_ProductoBE.Count >= 3)
                    pnlImagen3.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[2].Nombre + "')");
                else
                    lnkEliminarImagen3.Visible = false;
                
                if (objProductoBE.lstImagen_ProductoBE.Count >= 4)
                    pnlImagen4.Style.Add("background-image", "url('" + PATH_IMG_PROD + objProductoBE.lstImagen_ProductoBE[3].Nombre + "')");
                else
                    lnkEliminarImagen4.Visible = false;

                if (objProductoBE.lstAtributoBE.Count > 0)
                {
                    foreach (AtributoBE a in objProductoBE.lstAtributoBE)
                    {
                        ViewState["ATRIBUTOS"] = ViewState["ATRIBUTOS"] + "|" + a.Id_Atributo + "," + a.Nombre;
                    }
                }
                else
                    ViewState["ATRIBUTOS"] = "";

                CrearAtributos();

                LlenarElementoAtributo(objProductoBE);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarModo()
        {
            try
            {
                if ((Modo)ViewState["MODO"] == Modo.Insertar)
                {
                    pnlImagenInsertar.Visible = true;
                    pnlImagenActualizar.Visible = false;
                }
                else if ((Modo)ViewState["MODO"] == Modo.Editar)
                {
                    pnlImagenInsertar.Visible = false;
                    pnlImagenActualizar.Visible = true;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        //private void LlenarColores()
        //{
        //    ColorBC objColorBC = new ColorBC();

        //    try
        //    {
        //        lbColorPartida.DataSource = objColorBC.Select_Color();
        //        lbColorPartida.DataValueField = "Id_Color";
        //        lbColorPartida.DataTextField = "Nombre";
        //        lbColorPartida.DataBind();
        //    }
        //    catch (Exception)
        //    {
                
        //        throw;
        //    }
        //}

        private void LlenarCategorias()
        {
            CategoriaBC objCategoriaBC = new CategoriaBC();

            try
            {
                lbCategoriaPartida.DataSource = objCategoriaBC.Select_Categoria();
                lbCategoriaPartida.DataValueField = "Id_Categoria";
                lbCategoriaPartida.DataTextField = "Nombre";
                lbCategoriaPartida.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        //protected void btnColorIzquierda_Click(object sender, EventArgs e)
        //{
        //    lbColor.Items.Add(lbColorDestino.SelectedItem);
        //    lbColorDestino.Items.Remove(lbColorDestino.SelectedItem);
        //}

        //protected void btnColorDerecha_Click(object sender, EventArgs e)
        //{
        //    lbColorDestino.Items.Add(lbColor.SelectedItem);
        //    lbColor.Items.Remove(lbColor.SelectedItem);
        //}

        private string ValidarImagenes()
        {
            try
            {
                string error = "";
                string ext = "";

                if (fuImagen1.HasFile)
                {
                    ext = Path.GetExtension(fuImagen1.FileName);
                    if (!Tools.EsImagen(ext))
                        return "La extensión " + ext + " no es soportada por el sistema.";
                }

                if (fuImagen2.HasFile)
                {
                    ext = Path.GetExtension(fuImagen2.FileName);
                    if (!Tools.EsImagen(ext))
                        return "La extensión " + ext + " no es soportada por el sistema.";
                }

                if (fuImagen3.HasFile)
                {
                    ext = Path.GetExtension(fuImagen3.FileName);
                    if (!Tools.EsImagen(ext))
                        return "La extensión " + ext + " no es soportada por el sistema.";
                }

                if (fuImagen4.HasFile)
                {
                    ext = Path.GetExtension(fuImagen4.FileName);
                    if (!Tools.EsImagen(ext))
                        return "La extensión " + ext + " no es soportada por el sistema.";
                }

                return error;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProductoBC objProductoBC = new ProductoBC();
            ProductoBE objProductoBE = new ProductoBE();
            Imagen_ProductoBE objImagen_ProductoBE = new Imagen_ProductoBE();
            CategoriaBE objCategoriaBE = new CategoriaBE();

            try
            {
                UsuarioBE objUsuarioBE = (UsuarioBE)Session["USUARIO"];

                objProductoBE.Id_Usuario_Creacion = objUsuarioBE.Id_Usuario;
                objProductoBE.Id_Usuario_Modificacion = objUsuarioBE.Id_Usuario;
                objProductoBE.Nombre = txtNombre.Text.Trim();
                objProductoBE.Precio = Convert.ToDecimal(txtPrecio.Text.Trim());
                objProductoBE.Destacado = chkDestacado.Checked;
                objProductoBE.Descripcion_Corta = txtDescripcionCorta.Text.Trim();
                objProductoBE.Descripcion = txtDescripcion.Text.Trim();
                objProductoBE.Youtube = txtYoutube.Text.Trim();
                objProductoBE.Detalle = txtDetalle.Text.Trim();
                objProductoBE.Caracteristica_Tecnica = txtCaracteristicaTecnica.Text.Trim();

                //string colores = Request.Form[lbColorDestino.UniqueID];
                //if (!string.IsNullOrEmpty(colores))
                //{
                //    foreach (string item in colores.Split(','))
                //    {
                //        objColorBE = new ColorBE();
                //        objColorBE.Id_Color = Convert.ToInt32(item);
                //        objProductoBE.lstColorBE.Add(objColorBE);
                //    }
                //}

                string categorias = Request.Form[lbCategoriaDestino.UniqueID];
                if (!string.IsNullOrEmpty(categorias))
                {
                    foreach (string item in categorias.Split(','))
                    {
                        objCategoriaBE = new CategoriaBE();
                        objCategoriaBE.Id_Categoria = Convert.ToInt32(item);
                        objProductoBE.lstCategoriaBE.Add(objCategoriaBE);
                    }
                }

                string[] atributos = ViewState["ATRIBUTOS"].ToString().Split('|');

                GridView gv = new GridView();
                Elemento_AtributoBE objElemento_AtributoBE = new Elemento_AtributoBE();
                //Producto_Elemento_AtributoBE objProducto_Elemento_AtributoBE = new Producto_Elemento_AtributoBE();

                foreach(string s in atributos)
                {
                    string[] atributo = s.Split(',');

                    if (!string.IsNullOrEmpty(s))
                    {
                        gv = new GridView();
                        gv = (GridView)pnlAtributos.FindControl("gvElementoAtributo" + atributo[0]);

                        foreach (GridViewRow r in gv.Rows)
                        {
                            objElemento_AtributoBE = new Elemento_AtributoBE();

                            CheckBox chk = (CheckBox)r.Cells[0].Controls[0];

                            if (chk.Checked)
                            {
                                objElemento_AtributoBE.Id_Elemento_Atributo = Convert.ToInt32(chk.ID.Replace("chk", ""));
                                objProductoBE.lstElemento_AtributoBE.Add(objElemento_AtributoBE);
                            }
                        }
                    }
                }

                if ((Modo)ViewState["MODO"] == Modo.Insertar)
                {
                    String error = ValidarImagenes();
                    
                    if (String.IsNullOrEmpty(error))
                    {
                        if (fuImagen1.HasFile) objProductoBE.lstImagen_ProductoBE.Add(AgregarImagen(fuImagen1, true));
                        if (fuImagen2.HasFile) objProductoBE.lstImagen_ProductoBE.Add(AgregarImagen(fuImagen2));
                        if (fuImagen3.HasFile) objProductoBE.lstImagen_ProductoBE.Add(AgregarImagen(fuImagen3));
                        if (fuImagen4.HasFile) objProductoBE.lstImagen_ProductoBE.Add(AgregarImagen(fuImagen4));
                    }
                    else
                    {
                        Tools.Alert(error, "Agregar Producto", GetType(), this);
                        return;
                    }

                    objProductoBC.Insert_Producto_Completo(objProductoBE);

                    GuardarImagen(fuImagen1, objProductoBE.lstImagen_ProductoBE[0].Nombre);

                    if (objProductoBE.lstImagen_ProductoBE.Count >= 2) GuardarImagen(fuImagen2, objProductoBE.lstImagen_ProductoBE[1].Nombre);
                    if (objProductoBE.lstImagen_ProductoBE.Count >= 3) GuardarImagen(fuImagen3, objProductoBE.lstImagen_ProductoBE[2].Nombre);
                    if (objProductoBE.lstImagen_ProductoBE.Count >= 4) GuardarImagen(fuImagen4, objProductoBE.lstImagen_ProductoBE[3].Nombre);
                }
                else if ((Modo)ViewState["MODO"] == Modo.Editar)
                {
                    objProductoBE.Id_Producto = Convert.ToInt32(ViewState["ID_PRODUCTO"]);

                    objProductoBC.Update_Producto_Completo(objProductoBE);
                }

                Response.Redirect("/Administrador/Productos.aspx");
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void GuardarImagen(FileUpload fu, string nombre)
        {
            try
            {
                if (fu.HasFile)
                {
                    string path;

                    path = MapPath("../images/productos/") + nombre;
                    fu.SaveAs(path);
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private Imagen_ProductoBE AgregarImagen(FileUpload fu, bool esPrimero = false)
        {
            try
            {
                Imagen_ProductoBE objImagen_ProductoBE = new Imagen_ProductoBE();

                string ext = Path.GetExtension(fu.FileName);

                if (Tools.EsImagen(ext))
                {
                    objImagen_ProductoBE.Mostrar_Primero = esPrimero;
                    objImagen_ProductoBE.Nombre = ext;
                }

                return objImagen_ProductoBE;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            Imagen_ProductoBE objImagen_ProductoBE = new Imagen_ProductoBE();
            Imagen_ProductoBC objImagen_ProductoBC = new Imagen_ProductoBC();
            

            try
            {
                

                if (fuNuevaImagen.HasFile)
                {
                    string ext = Path.GetExtension(fuNuevaImagen.FileName);

                    if (Tools.EsImagen(ext))
                    {
                        string idPanel = hdImagenCodigo.Value;
                        string rutaImagen = hdRutaImagen.Value;
                        //string imagen = rutaImagen.Replace("url('", "").Replace("')", "");
                        rutaImagen = rutaImagen.Remove(0, 5);
                        rutaImagen = rutaImagen.Remove(rutaImagen.Length - 1);

                        bool esPrimero = (idPanel == "1" ? true : false);
                        objImagen_ProductoBE = AgregarImagen(fuNuevaImagen, esPrimero);
                        objImagen_ProductoBE.Id_Producto = Convert.ToInt32(ViewState["ID_PRODUCTO"]);

                        string path = MapPath(PATH_IMG_PROD);

                        if (!rutaImagen.Contains(NO_IMAGE))
                        {
                            string codigo = Path.GetFileName(rutaImagen).Replace(Path.GetExtension(rutaImagen), "");
                            objImagen_ProductoBC.Delete_Imagen_Producto(Convert.ToInt32(codigo), Convert.ToInt32(ViewState["ID_PRODUCTO"]));
                            File.Delete(path + Path.GetFileName(rutaImagen));
                        }

                        int id_imagen = objImagen_ProductoBC.Insert_Imagen_Producto(objImagen_ProductoBE);

                        string nombre_img = id_imagen + ext;
                        //GuardarImagen(fuNuevaImagen, nombre_img);
                        fuNuevaImagen.SaveAs(path + nombre_img);

                        Panel pnl = (Panel)pnlImagenActualizar.FindControl("pnlImagen" + idPanel);
                        pnl.Style.Add("background-image", "url('" + PATH_IMG_PROD + nombre_img + "')");

                        if (idPanel != "1")
                        {
                            LinkButton lnk = (LinkButton)pnlImagenActualizar.FindControl("lnkEliminarImagen" + idPanel);
                            lnk.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void lnkEliminarImagen2_Click(object sender, EventArgs e)
        {
            try
            {
                EliminarImagen(pnlImagen2, lnkEliminarImagen2);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void lnkEliminarImagen3_Click(object sender, EventArgs e)
        {
            try
            {
                EliminarImagen(pnlImagen3, lnkEliminarImagen3);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void lnkEliminarImagen4_Click(object sender, EventArgs e)
        {
            try
            {
                EliminarImagen(pnlImagen4, lnkEliminarImagen4);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void EliminarImagen(Panel pnl, LinkButton lnk)
        {
            Imagen_ProductoBC objImagen_ProductoBC = new Imagen_ProductoBC();
            Imagen_ProductoBE objImagen_ProductoBE = new Imagen_ProductoBE();

            try
            {
                string codigo = ObtenerCodigoPnlImagen(pnl);

                string path = MapPath(PATH_IMG_PROD);
                File.Delete(path + Path.GetFileName(ObtenerRutaPnlImagen(pnl)));

                objImagen_ProductoBE.Id_Producto = Convert.ToInt32(ViewState["ID_PRODUCTO"]);
                objImagen_ProductoBE.Id_Imagen = Convert.ToInt32(codigo);

                objImagen_ProductoBC.Delete_Imagen_Producto(objImagen_ProductoBE.Id_Imagen, objImagen_ProductoBE.Id_Producto);
                pnl.Style.Add("background-image", "url('" + NO_IMAGE + "')");

                lnk.Visible = false;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string ObtenerRutaPnlImagen(Panel pnl)
        {
            try
            {
                string imagen = pnl.Style["background-image"].ToString();
                imagen = imagen.Replace("url('", "").Replace("')", "");

                return imagen;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private string ObtenerCodigoPnlImagen(Panel pnl)
        {
            try
            {
                string imagen = ObtenerRutaPnlImagen(pnl);

                string codigo = Path.GetFileName(imagen).Replace(Path.GetExtension(imagen), "");

                return codigo;
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarAtributos()
        {
            AtributoBC objAtributoBC = new AtributoBC();

            try
            {
                ddlAtributo.DataSource = objAtributoBC.Get_Atributo_No_Producto(Convert.ToInt32(ViewState["ID_PRODUCTO"]));
                ddlAtributo.DataValueField = "Id_Atributo";
                ddlAtributo.DataTextField = "Nombre";
                ddlAtributo.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void lnkAgregarAtributo_Click(object sender, EventArgs e)
        {
            try
            {
                string atributo = ddlAtributo.SelectedItem.Value + "," + ddlAtributo.SelectedItem.Text;

                CrearAtributo(atributo);

                ViewState["ATRIBUTOS"] = ViewState["ATRIBUTOS"] + "|" + atributo;

                MostrarTab(3);

                ddlAtributo.Items.Remove(ddlAtributo.SelectedItem);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void CrearAtributo(string atributo)
        {
            try
            {
                string[] atributos = atributo.Split(',');

                Panel pnl = new Panel();
                pnl.ID = "pnl" + atributos[0];
                pnl.CssClass = "pnl-atributo";

                Label lblTitulo = new Label();
                lblTitulo.Text = atributos[1];
                lblTitulo.ID = "lblAtributo" + atributos[0];
                
                pnl.Controls.Add(lblTitulo);

                ImageButton ibtnCancel = new ImageButton();
                ibtnCancel.ID = "ibtnCancel" + atributos[0];
                ibtnCancel.ImageUrl = "../images/cancel.png";
                ibtnCancel.Click += ibtnCancel_Click;

                pnl.Controls.Add(ibtnCancel);

                Elemento_AtributoBC objElemento_AtributoBC = new Elemento_AtributoBC();
                List<Elemento_AtributoBE> lstElemento_AtributoBE = new List<Elemento_AtributoBE>();

                lstElemento_AtributoBE = objElemento_AtributoBC.Get_Elemento_Atributo_Atributo(Convert.ToInt32(atributos[0]));
                
                GridView gvElementoAtributo = new GridView();
                gvElementoAtributo.ID = "gvElementoAtributo" + atributos[0];
                gvElementoAtributo.CssClass = "gridview";
                gvElementoAtributo.AlternatingRowStyle.CssClass = "alt";
                gvElementoAtributo.PagerStyle.CssClass = "pgr";
                gvElementoAtributo.AutoGenerateColumns = false;

                TemplateField tfCheck = new TemplateField();
                gvElementoAtributo.Columns.Add(tfCheck);

                BoundField bfNombre = new BoundField();
                bfNombre.DataField = "Nombre";
                bfNombre.HeaderText = "Nombre";

                gvElementoAtributo.Columns.Add(bfNombre);

                BoundField bfIdElemento = new BoundField();
                bfIdElemento.DataField = "Id_Elemento_Atributo";
                bfIdElemento.HeaderText = "Id_Elemento_Atributo";
                bfIdElemento.Visible = false;

                gvElementoAtributo.Columns.Add(bfIdElemento);

                gvElementoAtributo.RowDataBound += gvElementoAtributo_RowDataBound;

                gvElementoAtributo.DataSource = lstElemento_AtributoBE;
                gvElementoAtributo.DataBind();

                pnl.Controls.Add(gvElementoAtributo);

                pnlAtributos.Controls.Add(pnl);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void gvElementoAtributo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    CheckBox chk = new CheckBox();
                    Elemento_AtributoBE objElemento_AtributoBE = (Elemento_AtributoBE)e.Row.DataItem;
                    chk.ID = "chk" + objElemento_AtributoBE.Id_Elemento_Atributo;
                    e.Row.Cells[0].Controls.Add(chk);
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void ibtnCancel_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton ibtn = (ImageButton)sender;

            try
            {
                string id = ibtn.ID.Replace("ibtnCancel", "");

                Label lbl = (Label)ibtn.Parent.FindControl("lblAtributo" + id);

                ddlAtributo.Items.Add(new ListItem(lbl.Text, id));

                pnlAtributos.Controls.Remove(ibtn.Parent);

                ViewState["ATRIBUTOS"] = ViewState["ATRIBUTOS"].ToString().Replace("|" + id + "," + lbl.Text, "");
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void CrearAtributos()
        {
            try
            {
                if (pnlAtributos.Controls.Count == 0)
                {
                    string[] atributos = ViewState["ATRIBUTOS"].ToString().Split('|');

                    foreach (string s in atributos)
                        if (!string.IsNullOrEmpty(s))
                            CrearAtributo(s);
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void MostrarTab(int tab)
        {
            try
            {
                liInformacion.Attributes.Add("class", "");
                liMedia.Attributes.Add("class", "");
                liAtributos.Attributes.Add("class", "");

                tabInformacion.Attributes.Add("class", "fade tab-pane");
                tabMedia.Attributes.Add("class", "fade tab-pane");
                tabAtributos.Attributes.Add("class", "fade tab-pane");

                switch (tab)
                {
                    case 1:
                        liInformacion.Attributes.Add("class", "active");
                        tabInformacion.Attributes.Add("class", "fade in tab-pane active");
                        break;
                    case 2:
                        liMedia.Attributes.Add("class", "active");
                        tabMedia.Attributes.Add("class", "fade in tab-pane active");
                        break;
                    case 3:
                        liAtributos.Attributes.Add("class", "active");
                        tabAtributos.Attributes.Add("class", "fade in tab-pane active");
                        break;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarElementoAtributo(ProductoBE objProductoBE)
        {
            try
            {
                string[] atributos = ViewState["ATRIBUTOS"].ToString().Split('|');

                GridView gv = new GridView();

                foreach (string s in atributos)
                {
                    string[] atributo = s.Split(',');

                    if (!string.IsNullOrEmpty(s))
                    {
                        gv = new GridView();
                        gv = (GridView)pnlAtributos.FindControl("gvElementoAtributo" + atributo[0]);

                        foreach (GridViewRow r in gv.Rows)
                        {
                            CheckBox chk = (CheckBox)r.Cells[0].Controls[0];
                            int idElemento_Atributo = Convert.ToInt32(chk.ID.Replace("chk", ""));

                            foreach (Elemento_AtributoBE ea in objProductoBE.lstElemento_AtributoBE)
                            {
                                if (idElemento_Atributo == ea.Id_Elemento_Atributo)
                                {
                                    chk.Checked = true;
                                    objProductoBE.lstElemento_AtributoBE.Remove(ea);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}