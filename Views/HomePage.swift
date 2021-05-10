//
//  HomePage.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 06.05.2021.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView() {
            ScrollView(.vertical, showsIndicators: false) {
                CategoryLoader(category: .nowPlaying)
                CategoryLoader(category: .popular)
                CategoryLoader(category: .topRated)
                CategoryLoader(category: .upcoming)
            }
            .navigationTitle("Movies")
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
