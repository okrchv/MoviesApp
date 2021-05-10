//
//  CategoryLoader.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 08.05.2021.
//

import SwiftUI

struct CategoryLoader: View {
    @StateObject private var network = Network()
    
    var category: MoviesListCategory
        
    var body: some View {
        VStack {
            if let category = network.category,
               let config = network.configuration {
                MovieRow(title: categoryName(self.category), movies: category.movies, config: config)
            }
        }
        .onAppear {
            network.loadCategory(category: category)
            network.loadConfiguration()
        }
    }
}

private func categoryName(_ category: MoviesListCategory) -> String {
    switch category {
    case .nowPlaying: return "Now Playing"
    case .popular: return "Popular"
    case .topRated: return "Top Rated"
    case .upcoming: return "Upcoming"
    }
}

struct CategoryLoader_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLoader(category: .nowPlaying)
    }
}
