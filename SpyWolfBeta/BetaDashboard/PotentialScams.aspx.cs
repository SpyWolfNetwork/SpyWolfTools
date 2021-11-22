using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpyWolfBeta.BetaDashboard {
    public partial class PotentialScams : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);
        }

        string lastValidCountry = null;
        bool hasValidationErrors = false;

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
            ASPxGridView gridView = sender as ASPxGridView;
            if (e.Column.FieldName == "SecurityLevel") {
                var level = gridView.GetRowValues(e.VisibleIndex, "SecurityLevel").ToString();

                if (level == "High" || level == "Extreme") {
                    e.Column.CellStyle.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e) {
            if (e.DataColumn.FieldName != "SecurityLevel")
                return;

            var level = Convert.ToString(e.CellValue);
            if (level == "3" || level == "4") {
                e.Cell.ForeColor = System.Drawing.Color.Red;
                e.Cell.Font.Bold = true;
            }
            if (level == "2") {
                e.Cell.ForeColor = System.Drawing.Color.Blue;
            }
            if (level == "1" || level == "0") {
                e.Cell.ForeColor = System.Drawing.Color.Green;
            }
        }
        protected void FillCityCombo(ASPxComboBox cmb, string country) {
            if (string.IsNullOrEmpty(country))
                return;

            cmb.DataSourceID = null;

            SecLevelDS.SelectCommand = string.Format("SELECT * FROM [tblCommonSpySecurityLevel] Where IsActive = 1 AND CountryId = {0}", country);
            cmb.DataSource = SecLevelDS;
            cmb.DataBindItems();
        }
        void cmbCity_OnCallback(object source, CallbackEventArgsBase e) {
            FillCityCombo(source as ASPxComboBox, e.Parameter);
        }
    }
}