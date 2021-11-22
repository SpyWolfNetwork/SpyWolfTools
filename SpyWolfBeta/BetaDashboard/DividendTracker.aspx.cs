using Newtonsoft.Json;
using SpyWolfBeta.Code;
using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using DevExpress.Web;
using FusionCharts.Charts;
using System.Text;

namespace SpyWolfBeta.BetaDashboard {
    public partial class DividendTracker : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (txtAddress.Text == "") {
                txtAddress.Text = "0x475a08cc64b8a3eb27d67cd49a7e9d867d3736bc";
            }

            if (!Page.IsPostBack && Request.QueryString.ToString() != "") {

                string add = Uri.UnescapeDataString(HttpUtility.ParseQueryString(Request.QueryString.ToString()).Get("add"));

                if (add != "") {
                    txtAddress.Text = add;
                    GetData();
                }
            }
        }


        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e) {
            if (e.DataColumn.FieldName != "from" && e.DataColumn.FieldName != "to")
                return;


            ASPxGridView gridView = sender as ASPxGridView;
            if (e.DataColumn.FieldName == "from") {
                var level = gridView.GetRowValues(e.VisibleIndex, "from").ToString();

                e.DataColumn.CellStyle.ForeColor = level == txtAddress.Text.Trim() ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            }

            if (e.DataColumn.FieldName == "to") {
                var level = gridView.GetRowValues(e.VisibleIndex, "to").ToString();
                e.DataColumn.CellStyle.ForeColor = level == txtAddress.Text.Trim() ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            }
        }


        protected void grid_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
            ASPxGridView gridView = sender as ASPxGridView;

            if (e.Column.FieldName != "from" && e.Column.FieldName != "to")
                return;


            if (e.Column.FieldName == "from") {
                var level = gridView.GetRowValues(e.VisibleIndex, "from").ToString();

                e.Column.CellStyle.ForeColor = level == txtAddress.Text.Trim() ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            }

            if (e.Column.FieldName == "to") {
                var level = gridView.GetRowValues(e.VisibleIndex, "to").ToString();
                e.Column.CellStyle.ForeColor = level == txtAddress.Text.Trim() ? System.Drawing.Color.Green : System.Drawing.Color.Red;
            }
        }

        private List<CryptoNewListModel> ConvertToModel(CMCModel model) {
            var result = new List<CryptoNewListModel>();

            if (model != null && model.data.Count > 0) {
                model.data.ForEach(a => {
                    result.Add(new CryptoNewListModel {
                        Id = a.id,
                        Name = a.name.ToString(),
                        Price = "$" + a.quote.USD.price.ToString(),
                        Added = GetDateDiff(a.date_added),
                        BlockChain = (a.platform != null ? a.platform.name : ""),
                        OneHD = a.quote.USD.percent_change_1h.ToString() + "%",
                        TwentyFourHD = a.quote.USD.percent_change_24h.ToString() + "%",
                        Volume = "$" + a.quote.USD.volume_24h.ToString(),
                        PooLink = "https://poocoin.app/tokens/" + (a.platform != null ? a.platform.token_address : "")
                    });
                });
            }


            return result;
        }

        private string GetDateDiff(DateTime d) {
            TimeSpan ts = DateTime.Now - d.AddHours(3);
            return ts.ToString(@"hh\:mm\:ss");
        }

        protected void cmdTrack_Click(object sender, EventArgs e) {
            GetData();
        }

        protected void GetData() {
            var bal = BSCCallAPIDividend.makeAPICallTokenBalance(txtAddress.Text.Trim());
            var x = BSCCallAPIDividend.makeAPICallToken(txtAddress.Text.Trim());

            BSCLatestTx data = JsonConvert.DeserializeObject<BSCLatestTx>(x);
            BNBVal val = JsonConvert.DeserializeObject<BNBVal>(bal);

            if (data.result != null && data.result.Count > 0) {
                decimal total = 0;
                data.result = data.result.FindAll(a => a.from == "0x4d954bcc5414e91ef41092014b7979c088d299ed");

                data.result.ForEach(a => {
                    total += Convert.ToDecimal(a.value1);
                });

                txtBalance2.Text = total.ToString("#,##0.00") + " BNB";

            }

            txtTotal.Text = val.valueFormat;
            grid.DataSource = data.result;
            grid.DataBind();

            RenderChart(data);
        }

        protected void RenderChart(BSCLatestTx dataS) {
            StringBuilder jsonData = new StringBuilder();
            StringBuilder data = new StringBuilder();
            // store chart config name-config value pair

            Dictionary<string, string> chartConfig = new Dictionary<string, string>();
            chartConfig.Add("caption", "Latest 10 Rewards");
            //chartConfig.Add("subCaption", "In MMbbl = One Million barrels");
            chartConfig.Add("xAxisName", "Date");
            chartConfig.Add("yAxisName", "Rewards");
            chartConfig.Add("numberSuffix", "BNB");
            chartConfig.Add("theme", "candy");
            chartConfig.Add("bgAlpha", "0");
            //chartConfig.Add("bgColor", "#DDDDDD");


            // json data to use as chart data source
            jsonData.Append("{'chart':{");
            foreach (var config in chartConfig) {
                jsonData.AppendFormat("'{0}':'{1}',", config.Key, config.Value);
            }
            jsonData.Replace(",", "},", jsonData.Length - 1, 1);

            // build  data object from label-value pair
            data.Append("'data':[");

            if (dataS.result != null) {
                //var s = dataS.result.FindAll(a => Convert.ToDateTime(a.DateFormat1) > DateTime.Now.AddDays(-2));

                if (dataS.result != null && dataS.result.Count > 0) {
                    var x = 0;
                    foreach (var pair in dataS.result) {
                        x++;

                        if (x <= 10) {
                            data.AppendFormat("{{'label':'{0}','value':'{1}'}},", pair.DateFormat1, pair.value1);
                        }

                    }
                }
            }


            data.Replace(",", "]", data.Length - 1, 1);

            jsonData.Append(data.ToString());
            jsonData.Append("}");

            Chart chart = new Chart("column3d", "", "100%", "200", "json", jsonData.ToString());

            Literal1.Text = chart.Render();
        }
    }
}