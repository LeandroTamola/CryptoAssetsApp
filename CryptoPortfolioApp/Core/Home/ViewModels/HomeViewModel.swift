//
//  HomeViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
