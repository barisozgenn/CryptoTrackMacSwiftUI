//
//  CryptoTrackMacSwiftUIApp.swift
//  CryptoTrackMacSwiftUI
//
//  Created by Baris OZGEN on 2.10.2022.
//

import SwiftUI

@main
struct CryptoTrackMacSwiftUIApp: App {
    @StateObject var marketViewModel = MarketViewModel()
    @StateObject var portfolioViewModel = PortfolioViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(marketViewModel)
                .environmentObject(portfolioViewModel)
                
        }
       .windowStyle(.hiddenTitleBar)
    }
}
