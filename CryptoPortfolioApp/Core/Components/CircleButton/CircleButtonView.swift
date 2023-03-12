//
//  CircleButton.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle().fill(Color.theme.background))
            .shadow(
                color: Color.theme.accent.opacity(0.26),
                radius: 10)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonView(iconName: "info")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
