//
//  HomeViewModel.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var topCoins: [Coin] = []
    
    @Published var showTopMovers: Bool = false
    
    @Published var scrolledItemID = 0
    
    private let coinDataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.coins = returnedCoins
                self?.prepareTopCoins()
            }
            .store(in: &cancellables)
    }
    
    func prepareTopCoins() {
        DispatchQueue.main.async {
            let topMovers = self.coins.sorted(by: { $0.priceChangePercentage24H ?? 0 > $1.priceChangePercentage24H ?? 0 })
            withAnimation(.spring()) {
                self.topCoins = Array(topMovers.prefix(5))
            }
        }
    }
    
}
