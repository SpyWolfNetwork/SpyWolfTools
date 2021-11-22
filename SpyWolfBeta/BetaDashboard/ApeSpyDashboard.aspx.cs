using Newtonsoft.Json;
using SpyWolfBeta.Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpyWolfBeta.BetaDashboard {
    public partial class ApeSpyDashboard : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            var x = CMCCallAPI.makeAPICall();

            CMCModel data = JsonConvert.DeserializeObject<CMCModel>(x);
            var s = ConvertToModel(data);

            grid.DataSource = s;
            grid.DataBind();


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

    }
}


public class CMCCallAPI {
    private static string API_KEY = "d1ab9356-0ab7-4bc0-a475-8854559520c4";
    private static string API_KEYTest = "b54bcf4d-1bca-4e8e-9a24-22ff2c3d462c";

    public static string makeAPICall() {
        ServicePointManager.Expect100Continue = true;
        ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
        var URL = new UriBuilder("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");
        //var URL = new UriBuilder("https://sandbox-api.coinmarketcap.com/v1/cryptocurrency/listings/latest");

        var queryString = HttpUtility.ParseQueryString(string.Empty);
        queryString["start"] = "1";
        queryString["limit"] = "30";
        queryString["convert"] = "USD";
        queryString["sort"] = "date_added";
        queryString["sort_dir"] = "desc";
        //queryString["listing_status"] = "untracked";


        URL.Query = queryString.ToString();

        var client = new WebClient();
        client.Headers.Add("X-CMC_PRO_API_KEY", API_KEY);
        client.Headers.Add("Accepts", "application/json");
        var s = client.DownloadString(URL.ToString());
        return s;

    }


}