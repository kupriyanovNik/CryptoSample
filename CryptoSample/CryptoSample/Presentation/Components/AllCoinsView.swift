//
//  AllCoinsView.swift
//

import SwiftUI

struct AllCoinsView: View {

    // MARK: - Property Wrappers

    @ObservedObject var homeViewModel: HomeViewModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            Text("Валюты")
                .font(.headline)
                .padding()

            HStack {
                Text("Валюта")

                Spacer()

                Text("Цена")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)

            VStack {
                ForEach(homeViewModel.allCoins) { coin in
                    CoinRowView(
                        homeViewModel: homeViewModel,
                        coin: coin
                    )
                    .id(coin.id.hashValue)
                }
            }
        }
        
    }
}
