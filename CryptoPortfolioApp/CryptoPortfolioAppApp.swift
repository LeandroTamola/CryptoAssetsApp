//
//  CryptoPortfolioAppApp.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import SwiftUI

@main
struct CryptoPortfolioAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
