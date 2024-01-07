//
//  CoinDataService.swift
//

import Foundation
import Combine

class CoinDataService {

    // MARK: - Property Wrappers

    @Published var allCoins: [NetworkCoinModel] = []

    // MARK: - Private Properties

    private var coinSubscription: AnyCancellable?

    // MARK: - Inits

    init() {
        getCoins()
    }

    // MARK: - Private Functions 

    private func getCoins() {
        guard let url = URL(string: Strings.API.mainURL) else { return }
        
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [NetworkCoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion) { [weak self] returnedCoins in
                guard let self else { return }
                
                self.allCoins = returnedCoins
                self.coinSubscription?.cancel()
            }
    }

}
