//
//  Double+Ext.swift
//

import Foundation

extension Double {

    // MARK: - Private Properties

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

    // MARK: - Internal Functions 

    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    
    func toPercent() -> String {
        return (numberFormatter.string(for: self) ?? "0.00") + "%"
    }
}
