//
//  Double+Ext.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import Foundation
import SwiftUI

extension Double {
    
    private var currencyFormatter: NumberFormatter  {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter: NumberFormatter  {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercent() -> String {
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
    
}
