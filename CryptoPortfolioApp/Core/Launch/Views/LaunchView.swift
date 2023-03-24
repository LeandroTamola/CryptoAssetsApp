//
//  LaunchView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 24/03/2023.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "Loading your portfolio...".map { String($0) }
    @State private var showLoadingText: Bool = false
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool

    var body: some View {
        ZStack {
            Color.theme.launchBackgroundColor
                .ignoresSafeArea()

            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            ZStack {
                if showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(loadingText.indices, id: \.self) { index in
                            Text(loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.theme.launchAccentColor)
                                .offset(y: counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.2)))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            withAnimation {
                showLoadingText.toggle()
            }
        }
        .onReceive(timer) { _ in
            withAnimation(.spring()) {
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
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
