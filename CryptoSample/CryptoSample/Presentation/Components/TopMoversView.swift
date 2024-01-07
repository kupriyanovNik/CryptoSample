//
//  TopMoversView.swift
//

import SwiftUI

struct TopMoversView: View {

    // MARK: - Property Wrappers

    @ObservedObject var homeViewModel: HomeViewModel

    // MARK: - Body

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 5) {
                Text("Наибольший рост")
                    .font(.headline)

                Image(systemName: "chevron.forward")
                    .rotationEffect(Angle(degrees: self.homeViewModel.showTopMovers ? 90 : 0))
                Spacer()
            }
            .padding(.leading)
            .onTapGesture {
                showTopMovers()
            }

            if self.homeViewModel.showTopMovers {
                topMoversItems()
            }
        }
        .padding(.vertical)
        .background(Color.clear)
    }

    // MARK: - ViewBuilders

    @ViewBuilder func topMoversItems() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(homeViewModel.topCoins) { coin in
                    TopMoversItemView(
                        homeViewModel: homeViewModel,
                        coin: coin
                    )
                }
            }
            .padding(.horizontal)
        }
        .transition(.opacity)
    }

    // MARK: - Private Functions

    private func showTopMovers() {
        UIImpactFeedbackGenerator(style: .soft)
            .impactOccurred()

        withAnimation {
            self.homeViewModel.showTopMovers.toggle()
        }
    }
}
