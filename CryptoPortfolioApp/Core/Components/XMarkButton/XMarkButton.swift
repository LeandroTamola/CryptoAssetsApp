//
//  XMarkButton.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 15/03/2023.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismissSheet

    var body: some View {
        Button {
            dismissSheet()
        } label: {
            Image(systemName: "xmark")
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton()
    }
}
