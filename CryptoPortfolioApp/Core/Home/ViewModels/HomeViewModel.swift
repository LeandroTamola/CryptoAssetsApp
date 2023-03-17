//
//  HomeViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import Combine
import Foundation

final class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    @Published var statistics: [Statistic] = []
    @Published var isLoading: Bool = false

    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    private func addSubscribers() {
        $searchText
            .combineLatest(coinDataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedFilteredCoins in
                self?.allCoins = returnedFilteredCoins
            }
            .store(in: &cancellables)

        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(compactMapPortfolioCoins)
            .sink { [weak self] returnedCoins in
                self?.portfolioCoins = returnedCoins
            }
            .store(in: &cancellables)

        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map(convertMarketDataIntoStatistics)
            .sink { [weak self] returnedStats in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }

    func updatePortfolio(coin: Coin, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }

    func reloadData() {
        isLoading = true
        marketDataService.getData()
        coinDataService.getCoins()
        HapticManager.notification(notificationType: .success)
    }

    private func convertMarketDataIntoStatistics(marketData: MarketData?, portfolioCoins: [Coin]) -> [Statistic] {
        var stats: [Statistic] = []

        guard let data = marketData else { return stats }

        let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = Statistic(title: "24h Volume", value: data.volume)
        let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = getPorfolioStatistic(portfolioCoins: portfolioCoins)

        stats.append(contentsOf: [marketCap, volume, btcDominance, portfolio])

        return stats
    }

    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }

        let lowercasedText = text.lowercased()
        return coins.filter { coin in
            coin.name.lowercased().contains(lowercasedText) ||
                coin.symbol.lowercased().contains(lowercasedText) ||
                coin.id.lowercased().contains(lowercasedText)
        }
    }

    private func compactMapPortfolioCoins(coinModels: [Coin], portfolioEntities: [Portfolio]) -> [Coin] {
        return coinModels
            .compactMap { coin -> Coin? in
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                return coin.updateHoldings(amount: entity.amount)
            }
    }

    private func getPorfolioStatistic(portfolioCoins: [Coin]) -> Statistic {
        let portfolioValue = portfolioCoins.reduce(0) { $0 + ($1.currentHoldings ?? 0) }
        let previousValue = portfolioCoins.reduce(0) {
            let currentValue = $1.currentHoldingsValue
            let percentageChange = $1.priceChangePercentage24H ?? 0 / 100
            let previousValue = currentValue / (1 + percentageChange)
            return $0 + previousValue
        }
        let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100

        return Statistic(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
    }
}
