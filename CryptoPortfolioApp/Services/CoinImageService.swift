//
//  CoinImageService.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 13/03/2023.
//

import Combine
import SwiftUI

final class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin

    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
    }

    func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }

        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
