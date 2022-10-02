//
//  HomeView.swift
//  CryptoTrackMacSwiftUI
//
//  Created by Baris OZGEN on 2.10.2022.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
  

        NavigationView {
          SideMenuBarView()
            
            Text("Detail")
        }
        .navigationTitle(
            Text("Crypto Track MacOS")
        )
        .navigationViewStyle(.columns)
        .background(Color.theme.appBackgroundColor.preferredColorScheme(.dark))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
