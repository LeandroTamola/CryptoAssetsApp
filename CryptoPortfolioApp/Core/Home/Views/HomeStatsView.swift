//
//  HomeStatsView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 13/03/2023.
//

import SwiftUI

struct HomeStatsView: View {
    @Binding var showPortfolio: Bool
    @EnvironmentObject var vm: HomeViewModel

    var body: some View {
        HStack(alignment: .top) {
            ForEach(vm.statistics) { statistic in
                StatisticView(statistic: statistic)
                    .frame(width: UIScreen.main.bounds.width / 3.2)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
        .transition(.move(edge: .leading))
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
    }
}
