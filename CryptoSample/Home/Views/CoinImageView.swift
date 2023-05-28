//
//  CoinImageView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 28.05.2023.
//

import SwiftUI
import Kingfisher

struct CoinImageView: View {
    let imageURL: String
    var body: some View {
        KFImage
            .url(URL(string: imageURL))
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .cornerRadius(5)
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView(imageURL: "")
    }
}
