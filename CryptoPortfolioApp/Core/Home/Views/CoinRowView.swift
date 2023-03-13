//
//  CoinRowView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin: Coin
    let showHoldingsColumn: Bool

    var body: some View {
        HStack(spacing: 0) {
            identifierColumn
            Spacer()
            if showHoldingsColumn {
                holdingsColumn
            }
            priceColumn
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
            .previewLayout(.sizeThatFits)
    }
}

extension CoinRowView {
    private var identifierColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)

            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)

            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading)
                .foregroundColor(.theme.accent)
        }
    }

    private var holdingsColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
        .foregroundColor(.theme.accent)
    }

    private var priceColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundColor(.theme.accent)
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundColor(coin.priceChangePercentage24H ?? 0 >= 0 ?
                    Color.theme.green :
                    Color.theme.red)
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
