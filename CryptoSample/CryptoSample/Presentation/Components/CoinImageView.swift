//
//  CoinImageView.swift
//

import SwiftUI
import Kingfisher

struct CoinImageView: View {

    // MARK: - Intrenal Properties

    let imageURL: String

    // MARK: - Body
    
    var body: some View {
        KFImage
            .url(URL(string: imageURL))
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .cornerRadius(5)
    }
}
