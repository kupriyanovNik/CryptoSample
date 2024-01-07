//
//  TopMoversItemView.swift
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {

    // MARK: - Property Wrappers

    @ObservedObject var homeViewModel: HomeViewModel

    // MARK: - Internal Properties

    let coin: NetworkCoinModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            CoinImageView(imageURL: coin.image)
                .padding(.bottom, 8)

            HStack(spacing: 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .bold()

                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text("+"+(coin.priceChangePercentage24H ?? 0).toPercent())
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.3)
        )
    }
}
