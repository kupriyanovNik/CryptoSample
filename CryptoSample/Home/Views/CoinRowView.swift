//
//  CoinRowView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    let coin: Coin
    var body: some View {
        HStack {
            Text("\(Int(coin.marketCapRank ?? 1))")
                .font(.caption)
                .foregroundColor(.gray)
                .scaleEffect(self.viewModel.scrolledItemID == coin.id.hashValue ? 1.3 : 1)
            CoinImageView(imageURL: coin.image)
            coinInformationView
                .scaleEffect(self.viewModel.scrolledItemID == coin.id.hashValue ? 1.3 : 1)
            Spacer()
            coinPriceView
                .scaleEffect(self.viewModel.scrolledItemID == coin.id.hashValue ? 1.3 : 1)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    private var coinInformationView: some View {
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
    }
    private var coinPriceView: some View {
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
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("aboba")
        }
    }
}
