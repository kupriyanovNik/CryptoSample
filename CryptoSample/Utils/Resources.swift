//
//  Resources.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 28.05.2023.
//

import Foundation

enum Resources {
    enum API: String {
        case mainURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    }
}
