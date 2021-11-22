using DevExpress.Web;
using SpyWolfBeta.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpyWolfBeta.SpywolfTeam {
    public partial class AdminPotentialScams : System.Web.UI.Page {


        ApplicationUserModel MainUserModel { get; set; }
        protected void Page_Load(object sender, EventArgs e) {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);
            if (!IsPostBack) {
                MainUserModel = AuthHelper.GetLoggedInUserInfo();
            }

            if (MainUserModel == null || MainUserModel.UserName != "admin") {
                Response.Redirect("~/Account/SignIn.aspx", true);
            }


        }

        string lastValidCountry = null;
        bool hasValidationErrors = false;

        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
            ASPxGridView gridView = sender as ASPxGridView;
            if (gridView.IsEditing && e.Column.FieldName == "CityId") {
                ASPxComboBox comboboxCity = e.Editor as ASPxComboBox;
                comboboxCity.Callback += cmbCity_OnCallback;
                var currentCountry = gridView.GetRowValues(e.VisibleIndex, "CountryId");
                if (hasValidationErrors)
                    FillCityCombo(comboboxCity, lastValidCountry);
                else
                    if (e.KeyValue != DBNull.Value && e.KeyValue != null && currentCountry != null && currentCountry != DBNull.Value) {
                    FillCityCombo(comboboxCity, currentCountry.ToString());
                }
                else {
                    comboboxCity.DataSourceID = null;
                    comboboxCity.Items.Clear();
                }
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