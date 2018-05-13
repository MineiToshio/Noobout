using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TuImportas.eShop.BL.Helper;

namespace TuImportas.eShop.PL.Web
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Ordenar Grillas

        public string GetSortDirection(string SortExpression)
        {
            if (ViewState[SortExpression] == null)
                ViewState[SortExpression] = "Desc";
            else
                ViewState[SortExpression] = ViewState[SortExpression].ToString() == "Desc" ? "Asc" : "Desc";

            return ViewState[SortExpression].ToString();
        }

        public List<T> SortGrid<T>(GridView grid, string sortExpresion, List<T> list)
        {
            //List<T> list = (List<T>)ViewState[viewStateKey];

            if (list != null)
            {
                string sortDirection = GetSortDirection(sortExpresion);
                list = list.AsQueryable().OrderBy(sortExpresion + " " + sortDirection).ToList();

                LlenarGrilla(grid, list);

                Tools.MostrarGridSortDirection(grid, sortExpresion, sortDirection);
            }

            return list;
        }

        private void LlenarGrilla<T>(GridView grid, List<T> list)
        {
            try
            {
                grid.DataSource = list;
                grid.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion
    }
}