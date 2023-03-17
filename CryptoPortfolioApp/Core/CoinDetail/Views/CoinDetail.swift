//
//  CoinDetail.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 16/03/2023.
//

import SwiftUI

struct DetailLoadingView: View {
    @Binding var coin: Coin?
    var body: some View {
        ZStack {
            if let coin = coin {
                CoinDetail(coin: coin)
            }
        }
    }
}

struct CoinDetail: View {
    let coin: Coin

    var body: some View {
        ZStack {
            Text(coin.name)
        }
    }
}

struct CoinDetail_Previews: PreviewProvider {
    static var previews: some View {
        DetailLoadingView(coin: .constant(dev.coin))
    }
}
