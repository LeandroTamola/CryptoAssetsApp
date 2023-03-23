//
//  CoinDetailViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 22/03/2023.
//

import Combine
import Foundation

final class CoinDetailViewModel: ObservableObject {
    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    @Published var coin: Coin

    private let coinDetailService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()

    init(coin: Coin) {
        self.coin = coin
        coinDetailService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }

    private func addSubscribers() {
        coinDetailService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] returnedArrays in
                print("RECEIVED COIN DETAIL DATA")
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
    }

    private func mapDataToStatistics(coinDetail: CoinDetail?, coin: Coin) -> (overview: [Statistic], additional: [Statistic]) {
        let overviewArray = createOverviewArray(coin: coin)
        let additionalArray = createAdditionalArray(coinDetail: coinDetail, coin: coin)
        return (overviewArray, additionalArray)
    }

    private func createOverviewArray(coin: Coin) -> [Statistic] {
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let pricePercentageChange = coin.priceChangePercentage24H
        let priceStat = Statistic(title: "Current Price", value: price, percentageChange: pricePercentageChange)

        let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapChange = coin.marketCapChangePercentage24H
        let marketCapStat = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketCapChange)

        let rank = "\(coin.rank)"
        let rankChange = coin.marketCapRank
        let rankStat = Statistic(title: "Rank", value: rank, percentageChange: rankChange)

        let volume = "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = Statistic(title: "Volume", value: volume)

        let overviewArray: [Statistic] = [
            priceStat, marketCapStat, rankStat, volumeStat,
        ]

        return overviewArray
    }

    private func createAdditionalArray(coinDetail: CoinDetail?, coin: Coin) -> [Statistic] {
        let high = coin.high24H?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = Statistic(title: "24h Hight", value: high)

        let low = coin.low24H?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = Statistic(title: "24h Low", value: low)

        let priceChange = coin.priceChange24H?.asCurrencyWith6Decimals() ?? "n/a"
        let pricePercentChange2 = coin.priceChangePercentage24H
        let priceChangeStat = Statistic(title: "24 Price Change", value: priceChange, percentageChange: pricePercentChange2)

        let marketCapChange2 = "$" + (coin.marketCapChangePercentage24H?.formattedWithAbbreviations() ?? "")
        let marketCapPercentChange2 = coin.marketCapChangePercentage24H
        let marketCapChangeStat = Statistic(title: "24h Market Cap Change", value: marketCapChange2, percentageChange: marketCapPercentChange2)

        let blockTime = coinDetail?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = Statistic(title: "Block Time", value: blockTimeString)

        let hashing = coinDetail?.hashingAlgorithm ?? "n/a"
        let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)

        let additionalArray: [Statistic] = [
            highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat,
        ]

        return additionalArray
    }
}
