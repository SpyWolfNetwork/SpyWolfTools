using Newtonsoft.Json;
using SpyWolfBeta.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace SpyWolfBeta {
    public partial class TokenScanner : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack && Request.QueryString.ToString() != "") {

                string add = Uri.UnescapeDataString(HttpUtility.ParseQueryString(Request.QueryString.ToString()).Get("add"));

                if (add != "") {
                    txtTokenAddress.Text = add;
                    GetData();
                }
            }
        }

        protected void DrawTable(List<ContractHolderResult> data, decimal total, double decimalP) {
            var x = 1;
            data = data.OrderByDescending(a => a.TokenHolderQuantityDec).ToList();


            foreach (var r in data) {
                var newRow = new HtmlTableRow();
                var tbTx = new HtmlTableCell();

                newRow.Controls.Add(new HtmlTableCell { InnerText = string.Format("#{0}", x) });
                newRow.Controls.Add(new HtmlTableCell { InnerText = r.TokenHolderAddress.Contains("0x0000") ? "Burn" : r.TokenHolderAddress.Substring(0,5) + ".." });
                newRow.Controls.Add(new HtmlTableCell { InnerText = (Decimal.Round(Convert.ToDecimal(r.TokenHolderQuantity) / total / Convert.ToDecimal((Math.Pow(10, decimalP))), 5)).ToString("#,##0.000%") });
                newRow.Controls.Add(new HtmlTableCell { InnerText = (Convert.ToDecimal(r.TokenHolderQuantity) / Convert.ToDecimal((Math.Pow(10, decimalP)))).ToString("#,##0.00") });
                tbTx.InnerHtml = string.Format("<a href = '{0}{1}?a={2}' class='tx-link' target='_blank'><span class='tx'><i class='mdi mdi-chart-bar'></i></span></a>",
                    "https://bscscan.com/token/", txtTokenAddress.Text, r.TokenHolderAddress);

                newRow.Controls.Add(tbTx);


                tblHolders.Rows.Add(newRow);
                x++;

                if (x > 5) {
                    break;
                }
            }
        }


        protected void GetData() {
            var address = txtTokenAddress.Text.Trim();

            //CMC API
            var unmapped = CMCContractAPI.GetUnmapped("");
            var media = CMCContractAPI.GetMediaInfo(address);

            if (media != "") {
                var mediaData = JsonConvert.DeserializeObject<CMCMediaRoot>(media);
                imgLogo.Src = mediaData.data.logo;
                linkWeb.HRef = mediaData.data.urls.website[0];
                linkTwitter.HRef = mediaData.data.urls.twitter[0];
                linkTG.HRef = mediaData.data.urls.chat[0];

                var price = CMCContractAPI.GetPriceInfo(mediaData.data.id.ToString());

                if (price != "") {
                    var priceData = JsonConvert.DeserializeObject<CMCPriceRoot>(price);

                    txtTokenMc.Text = Convert.ToDecimal(priceData.data.quote.USD.price).ToString("#,##0.00000000000000") + " USD";

                }
            }

            


            //BSC API
            var data = BSCCallAPIDividend.makeAPICallContractInfo(address);
            var verify = BSCCallAPIDividend.makeAPICallVerifyInfo(address);
            var holder = BSCCallAPIDividend.makeAPICallContractHolderInfo(address);
            



            var tokenData = JsonConvert.DeserializeObject<ContractApiModel>(data);
            var verifyData = JsonConvert.DeserializeObject<BNBVal>(verify);
            var holderData = JsonConvert.DeserializeObject<ContractHolderModel>(holder);
            var total = "0";
            var decimalP = "0";


            if (tokenData.status == "1" && tokenData.result.Count > 0) {
                //txtTokenLp.Text = tokenData.result[0].tokenPriceUSD.ToString();
                txtTokenLp.Text = "NA";
                txtTokenName.Text = tokenData.result[0].tokenName;
                txtTokenSymbol.Text = tokenData.result[0].symbol;
                //txtTokenMc.Text = tokenData.result[0].marketvalueFormat;
                txtTokenVerified.Text = verifyData.status == "1" ? "Yes" : "No";
                txtTokenHoneyPot.Text = "NA";
                txtTokenMint.Text = "NA";
                total = tokenData.result[0].totalSupply;
                decimalP = tokenData.result[0].divisor;
            }



            if (holderData.status == "1" && holderData.result.Count > 0) {
                DrawTable(holderData.result, Convert.ToDecimal(total), Convert.ToDouble(decimalP));
            }


        }


    }


    public class CMCContractAPI {
        private static string API_KEY = "d1ab9356-0ab7-4bc0-a475-8854559520c4";
        private static string API_KEYTest = "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c";


        public static string GetUnmapped(string contractAddress) {
            try {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                var URL = new UriBuilder("https://pro-api.coinmarketcap.com/v1/cryptocurrency/map");

                var queryString = HttpUtility.ParseQueryString(string.Empty);
                //queryString["address"] = contractAddress;
                queryString["listing_status"] = "untracked";
                queryString["symbol"] = "BNB";
                


                URL.Query = queryString.ToString();

                var client = new WebClient();
                client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
                client.Headers.Add("Accepts", "application/json");
                var s = client.DownloadString(URL.ToString());
                return RemoveCMCTag(s);



            }
            catch (Exception e) {
                return "";
            }



        }

        public static string GetMediaInfo(string contractAddress) {
            try {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                var URL = new UriBuilder("https://pro-api.coinmarketcap.com/v1/cryptocurrency/info");

                var queryString = HttpUtility.ParseQueryString(string.Empty);
                queryString["address"] = contractAddress;
                //queryString["listing_status"] = "untracked";


                URL.Query = queryString.ToString();

                var client = new WebClient();
                client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
                client.Headers.Add("Accepts", "application/json");
                var s = client.DownloadString(URL.ToString());
                return RemoveCMCTag(s);

                

            }
            catch(Exception e) {
                return "";
            }



        }

        public static string GetPriceInfo(string contractAddress) {
            try {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                var URL = new UriBuilder("https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest");

                var queryString = HttpUtility.ParseQueryString(string.Empty);
                queryString["id"] = contractAddress;
                //queryString["listing_status"] = "untracked";


                URL.Query = queryString.ToString();

                var client = new WebClient();
                client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
                client.Headers.Add("Accepts", "application/json");
                var s = client.DownloadString(URL.ToString());

                return RemoveCMCTag(s);
            }
            catch (Exception e) {
                return "";
            }



        }
        protected static string RemoveCMCTag(string str) {
            var result = "";

            result = str.Substring(0, str.IndexOf("\"data\"") + 8) + str.Substring(str.IndexOf("\"id\""), str.Length - str.IndexOf("\"id\"") - 1);

            return result;
        }


    }
}