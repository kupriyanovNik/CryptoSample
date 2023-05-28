//
//  AllCoinsView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI

struct AllCoinsView: View {
    @EnvironmentObject var viewModel: HomeViewModel
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
                ForEach(viewModel.coins) { coin in
                    CoinRowView(coin: coin)
                        .id(coin.id.hashValue)
                        .environmentObject(viewModel)
                }
            }
        }
        
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView()
            .environmentObject(HomeViewModel())
    }
}
