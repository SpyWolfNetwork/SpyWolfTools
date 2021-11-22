using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SpyWolfBeta.Code {

    public class CMCMediaStatus {
        public DateTime timestamp { get; set; }
        public int error_code { get; set; }
        public object error_message { get; set; }
        public int elapsed { get; set; }
        public int credit_count { get; set; }
        public object notice { get; set; }
    }

    public class CMCMediaUrls {
        public List<string> website { get; set; }
        public List<string> twitter { get; set; }
        public List<string> message_board { get; set; }
        public List<string> chat { get; set; }
        public List<object> facebook { get; set; }
        public List<string> explorer { get; set; }
        public List<string> reddit { get; set; }
        public List<string> technical_doc { get; set; }
        public List<string> source_code { get; set; }
        public List<object> announcement { get; set; }
    }

    public class CMCMediaPlatform {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
        public string token_address { get; set; }
        public CMCMediaCoin coin { get; set; }
    }

    public class CMCMediaCoin {
        public string id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
    }

    public class CMCMediaContractAddress {
        public string contract_address { get; set; }
        public Platform platform { get; set; }
    }

    public class CMCMediaData {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string category { get; set; }
        public string description { get; set; }
        public string slug { get; set; }
        public string logo { get; set; }
        public string subreddit { get; set; }
        public string notice { get; set; }
        public object tags { get; set; }

        [JsonProperty("tag-names")]
        public object TagNames { get; set; }

        [JsonProperty("tag-groups")]
        public object TagGroups { get; set; }
        public CMCMediaUrls urls { get; set; }
        public Platform platform { get; set; }
        public DateTime date_added { get; set; }
        public string twitter_username { get; set; }
        public int is_hidden { get; set; }
        public DateTime? date_launched { get; set; }
        public List<CMCMediaContractAddress> contract_address { get; set; }
        public long? self_reported_circulating_supply { get; set; }
        public object self_reported_tags { get; set; }
    }

    public class CMCMediaRoot {
        public Status status { get; set; }
        public CMCMediaData data { get; set; }
    }


    public class ContractApiModelResult {
        public string contractAddress { get; set; }
        public string tokenName { get; set; }
        public string symbol { get; set; }
        public string divisor { get; set; }
        public string tokenType { get; set; }
        public string totalSupply { get; set; }
        public string blueCheckmark { get; set; }
        public string description { get; set; }
        public string website { get; set; }
        public string email { get; set; }
        public string blog { get; set; }
        public string reddit { get; set; }
        public string slack { get; set; }
        public string facebook { get; set; }
        public string twitter { get; set; }
        public string bitcointalk { get; set; }
        public string github { get; set; }
        public string telegram { get; set; }
        public string wechat { get; set; }
        public string linkedin { get; set; }
        public string discord { get; set; }
        public string whitepaper { get; set; }
        public string tokenPriceUSD { get; set; }



        public string marketvalueFormat {
            get {
                return Decimal.Round((Convert.ToDecimal(totalSupply) * Convert.ToDecimal(tokenPriceUSD)), 2).ToString("$#,##0.00");
            }
        }
    }

    public class ContractApiModel {
        public string status { get; set; }
        public string message { get; set; }
        public List<ContractApiModelResult> result { get; set; }
    }


    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class ContractHolderResult {
        public string TokenHolderAddress { get; set; }
        public string TokenHolderQuantity { get; set; }
        public decimal TokenHolderQuantityDec { 
            get {
                return Convert.ToDecimal(TokenHolderQuantity);
            }
        }

    }

    public class ContractHolderModel {
        public string status { get; set; }
        public string message { get; set; }
        public List<ContractHolderResult> result { get; set; }
    }








    // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse); 
    public class CMCPriceStatus {
        public DateTime timestamp { get; set; }
        public int error_code { get; set; }
        public object error_message { get; set; }
        public int elapsed { get; set; }
        public int credit_count { get; set; }
        public object notice { get; set; }
    }

    public class CMCPricePlatform {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
        public string token_address { get; set; }
    }

    public class CMCPriceUSD {
        public double price { get; set; }
        public double volume_24h { get; set; }
        public double volume_change_24h { get; set; }
        public double percent_change_1h { get; set; }
        public double percent_change_24h { get; set; }
        public double percent_change_7d { get; set; }
        public double percent_change_30d { get; set; }
        public double percent_change_60d { get; set; }
        public double percent_change_90d { get; set; }
        public int market_cap { get; set; }
        public int market_cap_dominance { get; set; }
        public double fully_diluted_market_cap { get; set; }
        public DateTime last_updated { get; set; }
    }

    public class CMCPriceQuote {
        public USD USD { get; set; }
    }


    public class CMCPriceData {
        public int id { get; set; }
        public string name { get; set; }
        public string symbol { get; set; }
        public string slug { get; set; }
        public int num_market_pairs { get; set; }
        public DateTime date_added { get; set; }
        public List<object> tags { get; set; }
        public long? max_supply { get; set; }
        public string circulating_supply { get; set; }
        public long? total_supply { get; set; }
        public Platform platform { get; set; }
        public int is_active { get; set; }
        public int cmc_rank { get; set; }
        public int is_fiat { get; set; }
        public DateTime last_updated { get; set; }
        public Quote quote { get; set; }
    }

    public class CMCPriceRoot {
        public CMCPriceStatus status { get; set; }
        public CMCPriceData data { get; set; }
    }




}