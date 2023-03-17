//
//  HapticManager.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 16/03/2023.
//

import SwiftUI

class HapticManager {
    private static let generator = UINotificationFeedbackGenerator()
    
    static func notification(notificationType: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(notificationType)
    }
}
