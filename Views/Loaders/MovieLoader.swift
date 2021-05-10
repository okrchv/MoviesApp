//
//  MovieLoader.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 09.05.2021.
//

import SwiftUI

struct MovieLoader: View {
    @StateObject private var network = Network()
    
    var movieId: Int
    
    var body: some View {
        VStack {
            if let movie = network.movie,
               let credits = network.credits,
               let similarMovies = network.similarMovies,
               let config = network.configuration {
                MovieDetail(movie: movie, credits: credits, similarMovies: similarMovies.movies, config: config)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            network.loadMovie(movieId: movieId)
            network.loadCredits(movieId: movieId)
            network.loadSimilarMovies(movieId: movieId)
            network.loadConfiguration()
        }
    }
}

struct MovieLoader_Previews: PreviewProvider {
    static var previews: some View {
        MovieLoader(movieId: 578908)
    }
}
