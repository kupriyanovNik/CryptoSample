//
//  HomeViewModel.swift
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {

    // MARK: - Property Wrappers

    @Published var allCoins: [NetworkCoinModel] = []
    @Published var topCoins: [NetworkCoinModel] = []
    
    @Published var showTopMovers: Bool = false

    // MARK: - Private Properties

    private let coinDataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()

    // MARK: - Inits

    init() {
        self.addSubscribers()
    }

    // MARK: - Internal Functions

    func addSubscribers() {
        coinDataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
                self?.prepareTopCoins()
            }
            .store(in: &cancellables)
    }

    // MARK: - Private  Functions

    private func prepareTopCoins() {
        let topMovers = self.allCoins.sorted {
            ($0.priceChangePercentage24H ?? 0) > ($1.priceChangePercentage24H ?? 0)
        }

        withAnimation() {
            self.topCoins = Array(topMovers.prefix(5))
        }
    }

}
