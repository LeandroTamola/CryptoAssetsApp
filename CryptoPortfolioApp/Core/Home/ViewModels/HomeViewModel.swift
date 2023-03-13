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
    @Published var statistics: [Statistic] = [
        Statistic(title: "Title", value: "value"),
        Statistic(title: "Title2", value: "value", percentageChange: 25),
        Statistic(title: "Title3", value: "value", percentageChange: -2),
        Statistic(title: "Portfolio", value: "value"),
        Statistic(title: "Portfolio2", value: "value", percentageChange: 25),
        Statistic(title: "Portfolio3", value: "value", percentageChange: -2),
    ]

    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    private func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] returnedFilteredCoins in
                self?.allCoins = returnedFilteredCoins
            }
            .store(in: &cancellables)
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
}
