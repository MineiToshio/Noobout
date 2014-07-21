using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.BC;
using TuImportas.eShop.BL.BE;

namespace TuImportas.eShop.PL.Web.administrador
{
    public partial class OperadorLogistico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Tools.EsAdmin())
                {
                    LlenarOperadorLogistico();
                }
            }
        }

        private void LlenarOperadorLogistico()
        {
            List<Operador_LogisticoBE> lstOperador_LogisticoBE = null;
            Operador_LogisticoBC objOperador_LogisticoBC = new Operador_LogisticoBC();

            try
            {
                lstOperador_LogisticoBE = objOperador_LogisticoBC.Select_Operador_Logistico();

                if (lstOperador_LogisticoBE != null)
                {
                    gvOperadorLogistico.DataSource = lstOperador_LogisticoBE;
                    gvOperadorLogistico.DataBind();
                }
                else
                {
                    lstOperador_LogisticoBE = new List<Operador_LogisticoBE>();
                    lstOperador_LogisticoBE.Add(new Operador_LogisticoBE());
                    gvOperadorLogistico.DataSource = lstOperador_LogisticoBE;
                    gvOperadorLogistico.DataBind();
                    int TotalColumns = gvOperadorLogistico.Rows[0].Cells.Count;
                    gvOperadorLogistico.Rows[0].Cells.Clear();
                    gvOperadorLogistico.Rows[0].Cells.Add(new TableCell());
                    gvOperadorLogistico.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Left;
                    gvOperadorLogistico.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                    gvOperadorLogistico.Rows[0].Cells[0].Text = "[No se encontraron colores]";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void gvOperadorLogistico_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                #region Nuevo

                if (e.CommandName.Equals("Nuevo"))
                {
                    TextBox txtNewNombre = (TextBox)gvOperadorLogistico.FooterRow.FindControl("txtNewNombre");
                    TextBox txtNewCostoLima = (TextBox)gvOperadorLogistico.FooterRow.FindControl("txtNewCostoLima");
                    TextBox txtNewCostoProvincia = (TextBox)gvOperadorLogistico.FooterRow.FindControl("txtNewCostoProvincia");
                    TextBox txtNewTiempoEntrega = (TextBox)gvOperadorLogistico.FooterRow.FindControl("txtNewTiempoEntrega");

                    Operador_LogisticoBE objOperador_LogisticoBE = new Operador_LogisticoBE();

                    objOperador_LogisticoBE.Nombre = txtNewNombre.Text;
                    objOperador_LogisticoBE.Costo_Lima = Convert.ToDecimal(txtNewCostoLima.Text);
                    objOperador_LogisticoBE.Costo_Provincia = Convert.ToDecimal(txtNewCostoProvincia.Text);
                    objOperador_LogisticoBE.Tiempo_Entrega = txtNewTiempoEntrega.Text;

                    Operador_LogisticoBC obOperador_LogisticoBC = new Operador_LogisticoBC();
                    obOperador_LogisticoBC.Insert_Operador_Logistico(objOperador_LogisticoBE);

                    LlenarOperadorLogistico();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Editar

                if (e.CommandName.Equals("Editar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    gvOperadorLogistico.EditIndex = gvRow.RowIndex;
                    LlenarOperadorLogistico();
                }

                #endregion

                #region Cancelar

                if (e.CommandName.Equals("Cancelar"))
                {
                    gvOperadorLogistico.EditIndex = -1;
                    LlenarOperadorLogistico();
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Actualizar"))
                {
                    GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                    TextBox txtNombre = (TextBox)gvRow.FindControl("txtNombre");
                    TextBox txtCostoLima = (TextBox)gvRow.FindControl("txtCostoLima");
                    TextBox txtCostoProvincia = (TextBox)gvRow.FindControl("txtCostoProvincia");
                    TextBox txtTiempoEntrega = (TextBox)gvRow.FindControl("txtTiempoEntrega");

                    Operador_LogisticoBE objOperador_LogisticoBE = new Operador_LogisticoBE();

                    objOperador_LogisticoBE.Id_Operador = Convert.ToInt32(e.CommandArgument);
                    objOperador_LogisticoBE.Nombre = txtNombre.Text;
                    objOperador_LogisticoBE.Costo_Lima = Convert.ToDecimal(txtCostoLima.Text);
                    objOperador_LogisticoBE.Costo_Provincia = Convert.ToDecimal(txtCostoProvincia.Text);
                    objOperador_LogisticoBE.Tiempo_Entrega = txtTiempoEntrega.Text;

                    Operador_LogisticoBC objOperador_LogisticoBC = new Operador_LogisticoBC();
                    objOperador_LogisticoBC.Update_Operador_Logistico(objOperador_LogisticoBE);

                    gvOperadorLogistico.EditIndex = -1;
                    LlenarOperadorLogistico();

                    Tools.Unload(GetType(), this);
                }

                #endregion

                #region Actualizar

                if (e.CommandName.Equals("Habilitado"))
                {
                    Operador_LogisticoBC objProductoBC = new Operador_LogisticoBC();

                    objProductoBC.Update_Operador_Activo(Convert.ToInt32(e.CommandArgument));

                    LlenarOperadorLogistico();
                }

                #endregion
            }
            catch (Exception ex)
            {
                Tools.Error(GetType(), this, ex);
            }
        }
    }
}