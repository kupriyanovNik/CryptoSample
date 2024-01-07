//
//  CryptoSampleApp.swift
//

import SwiftUI

@main
struct CryptoSampleApp: App {

    // MARK: - Property Wrappers

    @StateObject private var homeViewModel = HomeViewModel()

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            HomeView(
                homeViewModel: homeViewModel
            )
        }
    }
}
