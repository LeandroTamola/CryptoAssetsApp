//
//  ChartView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 22/03/2023.
//

import Charts
import SwiftUI

struct ChartView: View {
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let lineColor: Color
    @State private var trimPercentage: CGFloat = 0

    init(coin: Coin) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? .theme.green : .theme.red
    }

    var body: some View {
        chartView
            .frame(height: 200)
            .background(chartBackground)
            .overlay(chartYAxis, alignment: .leading)
            .font(.caption)
            .foregroundColor(.theme.secondaryText)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    withAnimation(.linear(duration: 2.0)) {
                        trimPercentage = 1
                    }
                }
            }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: dev.coin)
    }
}

extension ChartView {
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)

                    let yAxis = maxY - minY
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height

                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: trimPercentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor.opacity(0.50), radius: 10, x: 0.0, y: 10)
            .shadow(color: lineColor.opacity(0.20), radius: 10, x: 0.0, y: 20)
        }
    }

    private var chartBackground: some View {
        VStack {
            ForEach(0 ..< 6) { _ in
                Divider()
                Spacer()
            }
            Divider()
        }
    }

    private var chartYAxis: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            Text(((maxY + minY) / 2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
    }
}
