//
//  HomeView.swift
//

import SwiftUI

struct HomeView: View {

    // MARK: - Property Wrappers

    @ObservedObject var homeViewModel: HomeViewModel

    // MARK: - Body

    var body: some View {
        NavigationView {
            Group {
                if !homeViewModel.allCoins.isEmpty {
                    ScrollView(showsIndicators: false) {
                        TopMoversView(
                            homeViewModel: homeViewModel
                        )

                        Divider()
                            .padding(.horizontal)

                        AllCoinsView(
                            homeViewModel: homeViewModel
                        )
                    }
                } else {
                    ProgressView()
                }
            }
            .navigationTitle("Биржа")
        }
    }
}
