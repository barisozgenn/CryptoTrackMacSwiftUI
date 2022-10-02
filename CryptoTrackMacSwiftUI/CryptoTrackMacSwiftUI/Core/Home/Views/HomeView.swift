//
//  HomeView.swift
//  CryptoTrackMacSwiftUI
//
//  Created by Baris OZGEN on 2.10.2022.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var marketVideModel : MarketViewModel
    
    var body: some View {
  

        NavigationView {
          SideMenuBarView()
                .frame(idealWidth: 120)
            
            
           PortfolioView()
        }
        .navigationTitle(
            Text("Crypto Track MacOS")
        )
        .background(Color.theme.appBackgroundColor.preferredColorScheme(.dark))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
