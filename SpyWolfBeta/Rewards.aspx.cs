using Newtonsoft.Json;
using SpyWolfBeta.BetaDashboard;
using SpyWolfBeta.Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace SpyWolfBeta {
    public partial class Rewards : Page {
        public static string SpyDividendAddress = ConfigurationManager.AppSettings["SpyDividend"];

        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack && Request.QueryString.ToString() != "") {

                string add = Uri.UnescapeDataString(HttpUtility.ParseQueryString(Request.QueryString.ToString()).Get("add"));

                if (add != "") {
                    txtAddressReadOnly.Text = add;
                    bscWalletLink.HRef = "https://bscscan.com/address/" + add;
                    showGraph.ClientEnabled = true;
                    GetData();
                }
            }
        }

        protected void GetData() {
            var bal = BSCCallAPIDividend.makeAPICallTokenBalance(txtAddressReadOnly.Text.Trim());
            var x = BSCCallAPIDividend.makeAPICallToken(txtAddressReadOnly.Text.Trim());

            BSCLatestTx data = JsonConvert.DeserializeObject<BSCLatestTx>(x);
            BNBVal val = JsonConvert.DeserializeObject<BNBVal>(bal);

            if (data.result != null && data.result.Count > 0) {
                decimal total = 0;
                data.result = data.result.FindAll(a => a.from == SpyDividendAddress);

                data.result.ForEach(a => {
                    total += Convert.ToDecimal(a.value1);
                });

                txtTotalRewards.InnerText = total.ToString("#,##0.00") + "BNB";
                //0.84BNB ($482.82)

            }

            if (data.result != null && data.result.Count > 0) {
                DrawTable(data.result);
            }

            RenderChart(data);
        }

        protected void RenderChart(BSCLatestTx dataS) {
            StringBuilder jsonData = new StringBuilder();
            StringBuilder data = new StringBuilder();
            // store chart config name-config value pair

            Dictionary<string, string> chartConfig = new Dictionary<string, string>();
            chartConfig.Add("xAxisName", "Date");
            chartConfig.Add("yAxisName", "Rewards");
            chartConfig.Add("numberSuffix", "BNB");
            chartConfig.Add("theme", "fusion");
            chartConfig.Add("bgAlpha", "0");
            chartConfig.Add("showValues", "0");


            // json data to use as chart data source
            jsonData.Append("{'chart':{");
            foreach (var config in chartConfig) {
                jsonData.AppendFormat("'{0}':'{1}',", config.Key, config.Value);
            }
            jsonData.Replace(",", "},", jsonData.Length - 1, 1);

            // build  data object from label-value pair
            data.Append("'data':[");

            if (dataS.result != null) {
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

            Session["RewardsChartVal"] = jsonData.ToString();
        }

        protected void DrawTable(List<Result> data) {
            foreach (var r in data) {
                var newRow = new HtmlTableRow();
                var tbTx = new HtmlTableCell();

                tbTx.InnerHtml = string.Format("<a href = '{0}{1}' class='tx-link' target='_blank'><span class='tx'><i class='mdi mdi-web'></i></span></a>",
                    "https://bscscan.com/tx/", r.hash);

                newRow.Controls.Add(tbTx);
                newRow.Controls.Add(new HtmlTableCell { InnerText = r.DateFormat1 });
                newRow.Controls.Add(new HtmlTableCell { InnerText = r.Age });
                newRow.Controls.Add(new HtmlTableCell { InnerText = r.value1 + "BNB" });

                tblRewards.Rows.Add(newRow);
            }
        }
    }

    public class BSCCallAPIDividend {
        private static string API_KEY = "SPKMCX4NC4DKZ9VYS269G2187MWA994DK1";
        public static string BSCApiKeyAPIKey = ConfigurationManager.AppSettings["APIKey"];


        public static string makeAPICallContractInfo(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "token";
            queryString["action"] = "tokeninfo";
            queryString["contractaddress"] = address;
            queryString["apikey"] = BSCApiKeyAPIKey;

            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", BSCApiKeyAPIKey);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }


        public static string makeAPICallVerifyInfo(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "contract";
            queryString["action"] = "getabi";
            queryString["address"] = address;
            queryString["apikey"] = BSCApiKeyAPIKey;

            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", BSCApiKeyAPIKey);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }
        public static string makeAPICallContractHolderInfo(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "token";
            queryString["action"] = "tokenholderlist";
            queryString["contractaddress"] = address;
            queryString["page"] = "1";
            queryString["offset"] = "50000";
            queryString["sort"] = "asc";
            queryString["apikey"] = BSCApiKeyAPIKey;

            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", BSCApiKeyAPIKey);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }

        public static string makeAPICallToken(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "account";
            queryString["action"] = "txlistinternal";
            queryString["address"] = address;
            queryString["startblock"] = "0";
            queryString["endblock"] = "99999999";
            queryString["page"] = "1";
            queryString["offset"] = "9999";
            queryString["sort"] = "desc";
            queryString["apikey"] = BSCApiKeyAPIKey;

            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", BSCApiKeyAPIKey);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }

        public static string makeAPICallTokenBalance(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "account";
            queryString["action"] = "tokenbalance";
            queryString["address"] = address;
            queryString["contractaddress"] = "0xc2d0f6b7513994a1ba86cef3aac181a371a4ca0c";
            queryString["apikey"] = BSCApiKeyAPIKey;
            queryString["tag"] = "latest";


            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", BSCApiKeyAPIKey);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }
    }
}