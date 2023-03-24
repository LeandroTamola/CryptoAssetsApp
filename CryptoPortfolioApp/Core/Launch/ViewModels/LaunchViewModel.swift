//
//  LaunchViewModel.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 24/03/2023.
//

import SwiftUI

final class LaunchViewModel: ObservableObject {
    @Published var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @Published var showLoadingText: Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Published var counter: Int = 0
    @Published var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    init(showLaunchView: Binding<Bool>){
        _showLaunchView = showLaunchView
    }

    func onReceive() {
        if counter == loadingText.count - 1 {
            counter = 0
            loops += 1
        } else {
            counter += 1
        }
        if loops >= 1 {
            showLaunchView = false
        }
    }

    func startAnimation() {
        showLoadingText.toggle()
    }
}
