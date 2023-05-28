//
//  TopMoversItemView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var scrollProxy: ScrollViewProxy
    @EnvironmentObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            CoinImageView(imageURL: coin.image)
                .padding(.bottom, 8)
            coinInformationView
            Text("+"+(coin.priceChangePercentage24H ?? 0).toPercent())
                .font(.title2)
                .foregroundColor(.green)
        }
        .onTapGesture {
            dump("scroll to \(coin.id.hashValue)")
            withAnimation(.linear(duration: 2)) {
                scrollProxy.scrollTo(coin.id.hashValue)
                viewModel.scrolledItemID = coin.id.hashValue
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.spring()) {
                    self.viewModel.scrolledItemID = 0
                }
            }
        }
        .frame(width: 140, height: 140)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.3)
        }
    }
    private var coinInformationView: some View {
        HStack(spacing: 2) {
            Text(coin.symbol.uppercased())
                .font(.caption)
                .bold()
            Text(coin.currentPrice.toCurrency())
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}

struct TopMoversItemView_Previews: PreviewProvider {
    static var previews: some View {
//        TopMoversItemView(coin: .//))
        Text("asdgsf")
    }
}
