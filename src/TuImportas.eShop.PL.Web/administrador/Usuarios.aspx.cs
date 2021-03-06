﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;
using TuImportas.eShop.BL.Helper;
using System.Linq;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Tools.EsAdmin())
                    {
                        LlenarUsuariosTodos();
                    }
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        private void LlenarUsuarios()
        {
            try
            {
                gvUsuarios.DataSource = ViewState["USUARIOS"];
                gvUsuarios.DataBind();
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        private void LlenarUsuariosTodos()
        {
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                ViewState["USUARIOS"] = objUsuarioBC.Select_Usuario();
                LlenarUsuarios();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Habilitado"))
                {
                    UsuarioBC objUsuarioBC = new UsuarioBC();

                    objUsuarioBC.Update_Activo_Usuario(Convert.ToInt32(e.CommandArgument));

                    List<UsuarioBE> lstUsuarioBE = (List<UsuarioBE>)ViewState["USUARIOS"];

                    for (int i = 0; i < lstUsuarioBE.Count; i++)
                    {
                        if (lstUsuarioBE[i].Id_Usuario == Convert.ToInt32(e.CommandArgument))
                        {
                            lstUsuarioBE[i].Activo = !lstUsuarioBE[i].Activo;
                            lstUsuarioBE[i].Img_Habilitado = "/images/" + ((bool)lstUsuarioBE[i].Activo ? "checkbox_checked.png" : "checkbox_unchecked.png");
                            break;
                        }
                    }

                    ViewState["PRODUCTOS"] = lstUsuarioBE;

                    LlenarUsuarios();
                }
                else if (e.CommandName.Equals("Edicion"))
                {
                    Response.Redirect("/administrador/usuario.aspx?id_usuario=" + e.CommandArgument);
                }
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsuarioBE objUsuarioBE = new UsuarioBE();
            UsuarioBC objUsuarioBC = new UsuarioBC();

            try
            {
                objUsuarioBE.Usuario = txtUsuarioBuscar.Text.Trim();
                objUsuarioBE.Nombre = txtUsuarioNombreBuscar.Text.Trim();
                objUsuarioBE.Apellido_Paterno = txtUsuarioApellidoPBuscar.Text.Trim();
                objUsuarioBE.Apellido_Materno = txtUsuarioApellidoMBuscar.Text.Trim();
                objUsuarioBE.Email = txtUsuarioEMailBuscar.Text.Trim();
                objUsuarioBE.Dni = txtUsuarioDniBuscar.Text.Trim();

                switch (ddlActivoBuscar.SelectedValue)
                {
                    case "0": objUsuarioBE.Activo = false; break;
                    case "1": objUsuarioBE.Activo = true; break;
                    default: objUsuarioBE.Activo = null; break;
                }

                ViewState["USUARIOS"] = objUsuarioBC.Get_Usuario_Buscar(objUsuarioBE);
                LlenarUsuarios();
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        protected void gvUsuarios_Sorting(object sender, GridViewSortEventArgs e)
        {
            try
            {
                Admin masterPage = (Admin)Page.Master;
                ViewState["USUARIOS"] = masterPage.SortGrid<UsuarioBE>(gvUsuarios, e.SortExpression, (List<UsuarioBE>)ViewState["USUARIOS"]);
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }

        
    }
}