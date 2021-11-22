using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpyWolfBeta.Code {

    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class Result {
        public string blockNumber { get; set; }
        public string timeStamp { get; set; }
        public string hash { get; set; }
        public string nonce { get; set; }
        public string blockHash { get; set; }
        public string transactionIndex { get; set; }
        public string from { get; set; }
        public string to { get; set; }
        public string value { get; set; }
        public string gas { get; set; }
        public string gasPrice { get; set; }
        public string isError { get; set; }
        public string txreceipt_status { get; set; }
        public string input { get; set; }
        public string contractAddress { get; set; }
        public string cumulativeGasUsed { get; set; }
        public string gasUsed { get; set; }
        public string confirmations { get; set; }

        public string PooLink {
            get {
                return "https://bscscan.com/tx/" + hash;
            }
        }

        public string CsvText {
            get {
                return from + ","  +Decimal.Round((Convert.ToDecimal(value) / Convert.ToDecimal(1000000000)), 4).ToString();
            }
        }
        public string Date {
            get {
                System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
                dtDateTime = dtDateTime.AddSeconds(Convert.ToInt32(timeStamp)).ToLocalTime();

                TimeSpan ts = DateTime.Now - dtDateTime;
                return ts.ToString(@"d\hh\:mm\:ss");
            }
        }
        public string Age {
            get {
                System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
                dtDateTime = dtDateTime.AddSeconds(Convert.ToInt32(timeStamp)).ToLocalTime();

                TimeSpan diff = DateTime.Now - dtDateTime;

                return string.Format(
                       System.Globalization.CultureInfo.CurrentCulture,
                       "{0} days, {1} hours, {2} minutes, {3} seconds",
                       diff.Days,
                       diff.Hours,
                       diff.Minutes,
                       diff.Seconds);
            }
        }
        public string DateFormat1 {
            get {
                System.DateTime dtDateTime = new DateTime(1970, 1, 1, 0, 0, 0, 0, System.DateTimeKind.Utc);
                return dtDateTime.AddSeconds(Convert.ToInt32(timeStamp)).ToLocalTime().ToString();
            }
        }

        public string value1 {
            get {
                return Decimal.Round((Convert.ToDecimal(value) / Convert.ToDecimal(1000000000000000000)), 4).ToString();
            }
        }
        public string valueShip {
            get {
                return Decimal.Round((Convert.ToDecimal(value) / Convert.ToDecimal(1000000000)), 4).ToString("#,##0.00");
                ;
            }
        }

        
    }

    public class BSCLatestTx {
        public string status { get; set; }
        public string message { get; set; }
        public List<Result> result { get; set; }
    }

    public class BNBVal {
        public string status { get; set; }
        public string message { get; set; }
        public string result { get; set; }

        public string value1 {
            get {
                return Decimal.Round((Convert.ToDecimal(result) / 1000000000000000000), 2).ToString();
            }
        }

        public string valueFormat {
            get {
                return Decimal.Round((Convert.ToDecimal(result) / 1000000000000000000), 2).ToString("#,##0.00");
            }
        }
    }


}