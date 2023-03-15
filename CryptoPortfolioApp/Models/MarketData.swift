//
//  MarketData.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 13/03/2023.
//

import Foundation

/*
   URL: https://api.coingecko.com/api/v3/global
   JSON Response: {
   "data": {
     "active_cryptocurrencies": 11491,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 682,
     "total_market_cap": {
       "btc": 46042364.323534824,
       "eth": 663419807.1851997,
       "ltc": 13692386377.870335,
       "bch": 8786779944.13249,
       "bnb": 3627769094.0411334,
       "eos": 1029048012909.6953,
       "xrp": 2968693187612.7134,
       "xlm": 13131245920819.584,
       "link": 165396595795.28473,
       "dot": 183358399548.72168,
       "yfi": 124917232.61515486,
       "usd": 1121206645880.9985,
       "aed": 4117833224194.2207,
       "ars": 224967707386560,
       "aud": 1681096881394.7163,
       "bdt": 107626074594526.97,
       "bhd": 422694905497.13586,
       "bmd": 1121206645880.9985,
       "brl": 5907077213824.034,
       "cad": 1539267604310.7053,
       "chf": 1021834100856.5664,
       "clp": 816496368995234.1,
       "cny": 7675444335707.541,
       "czk": 24815465997294.52,
       "dkk": 7780151581953.06,
       "eur": 1045006078606.9893,
       "gbp": 919963507425.108,
       "hkd": 8793853571007.056,
       "huf": 410721539725772.94,
       "idr": 17258565719049312,
       "ils": 4062484858120.306,
       "inr": 92368254986949.44,
       "jpy": 149614060090314.06,
       "krw": 1454430809423205.8,
       "kwd": 343685715575.1938,
       "lkr": 330992127466501.4,
       "mmk": 2138587065460203.2,
       "mxn": 21289412368036.168,
       "myr": 5041785984865.371,
       "ngn": 472484868248709.2,
       "nok": 11842867408642.457,
       "nzd": 1800280026645.2202,
       "php": 61828939365900.84,
       "pkr": 285827587006132.1,
       "pln": 4891847020111.717,
       "rub": 84118523001188.81,
       "sar": 4209306868398.4214,
       "sek": 11889649755941.826,
       "sgd": 1510658895534.4067,
       "thb": 38740464601637,
       "try": 21268730590246.24,
       "twd": 34151730192206.008,
       "uah": 37586903819770.78,
       "vef": 112266421452.06404,
       "vnd": 26454870809562130,
       "zar": 20416200935330.996,
       "xdr": 765691831285.8232,
       "xag": 51495283375.0133,
       "xau": 585942593.1374111,
       "bits": 46042364323534.82,
       "sats": 4604236432353482
     },
     "total_volume": {
       "btc": 7500781.985201272,
       "eth": 108078014.9210724,
       "ltc": 2230632735.4489822,
       "bch": 1431458216.3885033,
       "bnb": 591001471.5109788,
       "eos": 167642668019.869,
       "xrp": 483631123388.09686,
       "xlm": 2139217094804.689,
       "link": 26944832750.926872,
       "dot": 29870998163.9101,
       "yfi": 20350321.748399206,
       "usd": 182656271776.49854,
       "aed": 670838036228.1097,
       "ars": 36649588951595.15,
       "aud": 273868238275.8977,
       "bdt": 17533411529084.105,
       "bhd": 68861414459.73984,
       "bmd": 182656271776.49854,
       "brl": 962324567854.4814,
       "cad": 250762767864.98563,
       "chf": 166467446408.94757,
       "clp": 133015785473275.52,
       "cny": 1250410039700.374,
       "czk": 4042698567756.5923,
       "dkk": 1267467943609.0352,
       "eur": 170242403577.7525,
       "gbp": 149871662867.87805,
       "hkd": 1432610584078.7886,
       "huf": 66910828133438.664,
       "idr": 2811600593014872.5,
       "ils": 661821209371.863,
       "inr": 15047753372136.055,
       "jpy": 24373692861915.387,
       "krw": 236941967996784.62,
       "kwd": 55989992300.193565,
       "lkr": 53922074233601.65,
       "mmk": 348398166993975.5,
       "mxn": 3468267607709.75,
       "myr": 821359590110.9681,
       "ngn": 76972719366380.9,
       "nok": 1929326780172.8906,
       "nzd": 293284417309.4677,
       "php": 10072579924458.71,
       "pkr": 46564298923138.98,
       "pln": 796932966886.2991,
       "rub": 13703785876750.463,
       "sar": 685740048160.9952,
       "sek": 1936948113112.7625,
       "sgd": 246102110434.33664,
       "thb": 6311226264150.662,
       "try": 3464898330120.5586,
       "twd": 5563673507057.784,
       "uah": 6123299165736.344,
       "vef": 18289372492.98074,
       "vnd": 4309774732566477,
       "zar": 3326012346062.4062,
       "xdr": 124739195710.43314,
       "xag": 8389119445.473348,
       "xau": 95456167.63039833,
       "bits": 7500781985201.272,
       "sats": 750078198520127.2
     },
     "market_cap_percentage": {
       "btc": 41.954133511180636,
       "eth": 18.122193040003424,
       "usdt": 6.6551345769315695,
       "bnb": 4.354268610677213,
       "usdc": 3.531004906988506,
       "xrp": 1.7153676516959107,
       "ada": 1.0878679280893788,
       "matic": 0.9599457056770461,
       "doge": 0.9105904170132381,
       "steth": 0.8675199976217117
     },
     "market_cap_change_percentage_24h_usd": 9.90012165831727,
     "updated_at": 1678736648
   }
 }
   */

struct GlobalData: Codable {
    let data: MarketData?
}

// MARK: - DataClass

struct MarketData: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }

    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }

    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }

    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}
