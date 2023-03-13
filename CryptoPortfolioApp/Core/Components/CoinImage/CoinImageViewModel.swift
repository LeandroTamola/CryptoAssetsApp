//
//  CoinImageViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 13/03/2023.
//

import Combine
import SwiftUI

final class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    private var cancellables = Set<AnyCancellable>()

    private let coin: Coin
    private let dataService: CoinImageService

    init(coin: Coin) {
        self.coin = coin
        dataService = CoinImageService(coin: coin)
        addSubscribers()
        isLoading = true
    }

    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
    }
}
