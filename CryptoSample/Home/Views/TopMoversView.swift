//
//  TopMoversView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI

struct TopMoversView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel

    var scrollProxy: ScrollViewProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            topMoversCoinInformationView
                .onTapGesture {
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    withAnimation {
                        self.viewModel.showTopMovers.toggle()
                    }
                }
            if self.viewModel.showTopMovers {
                topMoversItems
            }
        }
        .padding()
        .background(Color.clear)
    }
    private var topMoversCoinInformationView: some View {
        HStack(spacing: 5) {
            Text("Наибольший рост")
                .font(.headline)
            Image(systemName: "chevron.forward")
                .rotationEffect(Angle(degrees: self.viewModel.showTopMovers ? 90 : 0))
            Spacer()
        }
    }
    private var topMoversItems: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(viewModel.topCoins) { coin in
                    TopMoversItemView(coin: coin, scrollProxy: self.scrollProxy)
                        .environmentObject(viewModel)
                }
            }
        }
        .transition(.opacity)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
//        TopMoversView()
//            .environmentObject(HomeViewModel())
        Text("A")
    }
}
