using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpyWolfBeta.Code {
    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class Status {
        public DateTime timestamp { get; set; }
        public int error_code { get; set; }
        public object error_message { get; set; }
        public int elapsed { get; set; }
        public int credit_count { get; set; }
        public object notice { get; set; }
        public int total_count { get; set; }
    }

    public class Platform {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
        public string token_address { get; set; }
    }

    public class USD {
        public double price { get; set; }
        public double volume_24h { get; set; }
        public double volume_change_24h { get; set; }
        public double percent_change_1h { get; set; }
        public double percent_change_24h { get; set; }
        public double percent_change_7d { get; set; }
        public double percent_change_30d { get; set; }
        public double percent_change_60d { get; set; }
        public double percent_change_90d { get; set; }
        public string market_cap { get; set; }
        public string market_cap_dominance { get; set; }
        public string fully_diluted_market_cap { get; set; }
        public DateTime last_updated { get; set; }
    }

    public class Quote {
        public USD USD { get; set; }
    }

    public class Datum {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
        public int num_market_pairs { get; set; }
        public DateTime date_added { get; set; }
        public List<string> tags { get; set; }
        public long? max_supply { get; set; }
        public double circulating_supply { get; set; }
        public object total_supply { get; set; }
        public Platform platform { get; set; }
        public int? cmc_rank { get; set; }
        public DateTime last_updated { get; set; }
        public Quote quote { get; set; }
    }

    public class Root {
        public Status status { get; set; }
        public List<Datum> data { get; set; }
    }


    public class CMCModel {
        public Status status { get; set; }
        public List<Datum> data { get; set; }
    }
}