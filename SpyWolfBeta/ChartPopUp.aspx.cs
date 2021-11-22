using FusionCharts.Charts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpyWolfBeta {
    public partial class ChartPopUp : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["RewardsChartVal"] != null) {
                Chart chart = new Chart("column3d", "", "100%", "400", "json", (string)Session["RewardsChartVal"]);

                Literal1.Text = chart.Render();
            }
            
        }
    }
}