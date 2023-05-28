//
//  HomeView.swift
//  CryptoSample
//
//  Created by Никита Куприянов on 27.05.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        if !viewModel.coins.isEmpty {
            mainView
        } else {
            ProgressView()
        }
    }
    private var mainView: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    TopMoversView(scrollProxy: proxy)
                        .environmentObject(viewModel)
                    Divider()
                        .padding(.horizontal)
                    AllCoinsView()
                        .environmentObject(viewModel)
                }
            }
            .navigationTitle("Биржа")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
