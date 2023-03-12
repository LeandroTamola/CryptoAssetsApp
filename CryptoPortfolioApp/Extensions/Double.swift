//
//  Double.swift
//  CryptoPortfolioApp
//
//  Created by Leandro Támola on 12/03/2023.
//

import Foundation

extension Double {
    /// Converts a Double into a currency with 2 decimal places
    /// ```
    /// Convert 1234.56 = $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }

    /// Converts a Double into a currency as a String with 2 to 6 decimal places
    /// ```
    /// Convert 1234.56 = "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a currency with 2 to 6 decimal places
    /// ```
    /// Convert 1234.56 = $1,234.56
    /// Convert 12.3456 = $12.23456
    /// Convert 0.123456 = $0.12345
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }

    /// Converts a Double into a currency as a String with 2 to 6 decimal places
    /// ```
    /// Convert 1234.56 = "$1,234.56"
    /// Convert 12.3456 = "$12.3456"
    /// Convert 0.123456 = "$0.12345"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }

    /// Converts a Double into a String representation
    /// ```
    /// Convert 1.23456 = "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }

    /// Converts a Double into a String representation with percentage symbol
    /// ```
    /// Convert 1.23456 = "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
