//
//  ContentView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Primary Text")
                    .foregroundColor(Color.theme.accent)
                    .font(.headline)
                Text("Secondary Text")
                    .foregroundColor(Color.theme.secondaryText)
                    .font(.headline)
                Text("Red Text")
                    .foregroundColor(Color.theme.red)
                    .font(.headline)
                Text("Green Text").foregroundColor(Color.theme.green)
                    .font(.headline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
