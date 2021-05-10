//
//  ContentView.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case favorites
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            HomePage()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tab.home)

//            FavoritesList()
//                .tabItem {
//                    Label("Favorites", systemImage: "heart")
//                }
//                .tag(Tab.favorites)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
