//
//  MarketDataService.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 15/03/2023.
//

import Combine
import Foundation

class MarketDataService {
    @Published var marketData: MarketData?
    var marketDataSubscription: AnyCancellable?

    init() {
        getData()
    }

    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }

        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
