//
//  CoinRowView.swift
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {

    // MARK: - Property Wrappers

    @ObservedObject var homeViewModel: HomeViewModel

    // MARK: - Internal Properties

    let coin: NetworkCoinModel

    // MARK: - Body 

    var body: some View {
        HStack {
            Text("\(Int(coin.marketCapRank ?? 1))")
                .font(.caption)
                .foregroundColor(.gray)

            CoinImageView(imageURL: coin.image)

            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)

            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text((coin.priceChangePercentage24H ?? 0).toPercent())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor( (coin.priceChangePercentage24H ?? 0) == 0 ? .primary : (coin.priceChangePercentage24H ?? 0) > 0 ? .green : .red )
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}
