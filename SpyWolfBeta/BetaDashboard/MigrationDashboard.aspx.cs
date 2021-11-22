using Newtonsoft.Json;
using SpyWolfBeta.Code;
using System;
using System.Collections.Generic;
using System.Net;
using System.Web;
using DevExpress.Web;

namespace SpyWolfBeta.BetaDashboard {
    public partial class MigrationDashboard : System.Web.UI.Page {
        public List<Result> CachedData {
            get { return (List<Result>)Session["CachedData"]; }
            set  { Session["CachedData"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e) {
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);
            //if (!IsPostBack)
            //    grid.ExpandAll();

            if (txtAddress.Text == "") {
                //txtAddress.Text = "0xd8d415806d20a7d1d28758c6bd73285ef2657888";
                //txtAddress.Text = "0x1255d758854c681adAD7A5329434c00328f9D491";
                txtAddress.Text = "0x8Dc5BaE11E4295F98B2a69425dcdda9E2c41815c";
            }

            if (!Page.IsPostBack && !Page.IsCallback) {
                GetData();
            }

            LoadData();
        }

        protected void GetData() {
            var x = BSCCallAPIMigration.makeAPICallToken(txtAddress.Text.Trim());
            BSCLatestTx data = JsonConvert.DeserializeObject<BSCLatestTx>(x);

            data = AutoAddDuplicate(data);

            CachedData = data.result;
        }

        protected BSCLatestTx AutoAddDuplicate(BSCLatestTx r) {
            var result = r;

            if (result.result.Count < 0) {
                var o = new List<Result>();

                foreach(var s in result.result) {
                    if (o.Find(a=>a.from == s.from) == null) {
                        o.Add(s);
                    }
                    else {
                        var add = o.Find(a => a.from == s.from);
                        add.value = Convert.ToString(Convert.ToDecimal(add.value) + Convert.ToDecimal(s.value));
                    }
                }

                r.result = o;
            }

            return result;
        }

        protected void LoadData() {
            var bal = BSCCallAPIMigration.makeAPICallBNBBalance(txtAddress.Text.Trim());            
            BNBVal val = JsonConvert.DeserializeObject<BNBVal>(bal);

            txtBalance2.Text = val.value1;
            grid.DataSource = CachedData;
            grid.DataBind();
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
    }

    public class BSCCallAPIMigration {
        private static string API_KEY = "SPKMCX4NC4DKZ9VYS269G2187MWA994DK1";
        private static string API_KEYTest = "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c";

        public static string makeAPICallToken(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");
            //var URL = new UriBuilder("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "account";
            queryString["action"] = "tokentx";
            //queryString["contractaddress"] = "0x050ca43222dfb2b50ff5d6e5a2785fc14f07f889";
            queryString["contractaddress"] = "0x050ca43222dfb2b50ff5d6e5a2785fc14f07f889";
            queryString["address"] = address;
            queryString["page"] = "1";
            queryString["offset"] = "9999";
            queryString["startblock"] = "0";
            queryString["endblock"] = "99999999";
            queryString["sort"] = "desc";
            queryString["apikey"] = "SPKMCX4NC4DKZ9VYS269G2187MWA994DK1";
            //queryString["listing_status"] = "untracked";


            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }

        public static string makeAPICallBNBBalance(string address) {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var URL = new UriBuilder("https://api.bscscan.com/api");
            //var URL = new UriBuilder("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["module"] = "account";
            queryString["action"] = "balance";
            queryString["address"] = address;
            queryString["apikey"] = "SPKMCX4NC4DKZ9VYS269G2187MWA994DK1";
            //queryString["listing_status"] = "untracked";


            URL.Query = queryString.ToString();

            var client = new WebClient();
            client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
            client.Headers.Add("Accepts", "application/json");
            var s = client.DownloadString(URL.ToString());
            return s;

        }


    }
}