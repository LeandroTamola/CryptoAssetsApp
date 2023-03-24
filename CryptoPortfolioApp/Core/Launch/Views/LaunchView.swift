//
//  LaunchView.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 24/03/2023.
//

import SwiftUI

struct LaunchView: View {
    @StateObject private var vm: LaunchViewModel

    init(showLaunchView: Binding<Bool>) {
        _vm = StateObject(wrappedValue: LaunchViewModel(showLaunchView: showLaunchView))
    }

    var body: some View {
        ZStack {
            Color.theme.launchBackgroundColor
                .ignoresSafeArea()

            Image("logo")
                .resizable()
                .frame(width: 100, height: 100)
            ZStack {
                if vm.showLoadingText {
                    HStack(spacing: 0) {
                        ForEach(vm.loadingText.indices, id: \.self) { index in
                            Text(vm.loadingText[index])
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(.theme.launchAccentColor)
                                .offset(y: vm.counter == index ? -5 : 0)
                        }
                    }
                    .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.2)))
                }
            }
            .offset(y: 70)
        }
        .onAppear {
            withAnimation {
                vm.startAnimation()
                
            }
        }
        .onReceive(vm.timer) { _ in
            withAnimation(.spring()) {
                vm.onReceive()
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
