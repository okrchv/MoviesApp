//
//  MovieItem.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 29.04.2021.
//

import SwiftUI

struct MovieItem: View {
    var movie: Movie
    var config: Configuration

    var body: some View {
        VStack(alignment: .leading) {
            PosterImage(config: config, path: movie.posterPath, width: 92, height: 138)
            Text(movie.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .frame(width: 95, height: 170)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieItem(
            movie:
                    Movie(id: 0, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie", posterPath: "/A1Gy5HX3DKGaNW1Ay30NTIVJqJ6.jpg", backdropPath: "", overview: "", releaseDate: Date()),
            config: Configuration(
                images: Configuration.Images(
                    secureBaseUrl: "https://image.tmdb.org/t/p/",
                    backdropSizes: ["original"],
                    posterSizes: ["original"]
                )
            )
        )
    }
}
