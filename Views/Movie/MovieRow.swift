//
//  MovieRow.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 03.05.2021.
//

import SwiftUI

struct MovieRow: View {
    var title: String
    var movies: [Movie]
    var config: Configuration

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .padding(.horizontal, 15)
                .padding(.top, 5)
                .padding(.bottom, 0)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 15) {
                    ForEach(movies) { movie in
                        NavigationLink(
                            destination:
                                MovieLoader(movieId: movie.id)
                                .navigationTitle("")
                                .navigationBarTitleDisplayMode(.inline),
                            label: {
                                MovieItem(movie: movie, config: config)
                            })
                    }
                }
                .padding(.horizontal, 15)
            }
            .frame(height: 175)
        }
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(
            title: "Latest",
            movies: [
                Movie(id: 0, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie", posterPath: "/A1Gy5HX3DKGaNW1Ay30NTIVJqJ6.jpg", backdropPath: "", overview: "", releaseDate: Date()),
                 Movie(id: 1, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie2", posterPath: "/8XZI9QZ7Pm3fVkigWJPbrXCMzjq.jpg", backdropPath: "", overview: "", releaseDate: Date()),
                 Movie(id: 2, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie3", posterPath: "/3RE9DNBCvuso5OPZPg71ryntNjx.jpg", backdropPath: "", overview: "", releaseDate: Date()),
                 Movie(id: 3, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie4", posterPath: "", backdropPath: "", overview: "", releaseDate: Date()),
                 Movie(id: 4, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie5", posterPath: "", backdropPath: "", overview: "", releaseDate: Date())
            ],
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
