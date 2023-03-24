//
//  SettingsView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 24/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var vm: SettingsViewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            List {
                userSection
                coinGeckoSection
            }
            .font(.body)
            .accentColor(.blue)
            .listStyle(.grouped)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private var userSection: some View {
        Section(header: Text("Leandro Támola")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was developed by Leandro Támola. It uses SwiftUI, MVVM architecture, Combine and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("👨🏻‍💻 Connect with me at Linkedin", destination: vm.linkedinURL)
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The data that it is used in this app comes from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.theme.accent)
            }
            .padding(.vertical)
            Link("🦎 Developed using CoinGecko Api", destination: vm.coinGeckoURL)
        }
    }
}
