//
//  MovieDetail.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 04.05.2021.
//

import SwiftUI

struct MovieDetail: View {
    var movie: Movie
    var credits: MovieCredits
    var similarMovies: [Movie]
    var config: Configuration

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                BackDropImage(config: config, path: movie.backdropPath)
                VStack(alignment: .leading) {
                    HStack(alignment: .bottom) {
                        PosterImage(config: config, path: movie.posterPath, width: 62, height: 93)
                            
                        VStack(alignment: .leading, spacing: 0) {
                            Text(movie.title).font(.title2)
                        }
                    }
                    HStack {
                        Text(movie.genres?.map({ $0.name }).joined(separator: ", ") ?? "")
                            .lineLimit(1)
                        Text("\u{2022}")
                        Text(DateFormatter.localizedString(from: movie.releaseDate, dateStyle: .medium, timeStyle: .none))
                        Spacer()
                        FavoriteButton(isFavourite: .constant(false))
                    }
                }
                .padding(.all, 15)
                .foregroundColor(Color.white)
            }
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.overview)
                    Group {
                        Text("Cast: ").bold() +
                            Text(credits.cast[0...4].map({ $0.name }).joined(separator: ", "))
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    
                    Group {
                        Text("Crew: ").bold() +
                            Text(credits.crew[0...4].map({ $0.name }).joined(separator: ", "))
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                }
                .padding(.all, 15)
            }
            MovieRow(title: "Similar Movies", movies: similarMovies, config: config)
        }
    }
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(
            movie:
                Movie(
                    id: 0,
                    genres: [
                        Movie.Genre(id: 0, name: "Drama"),
                        Movie.Genre(id: 1, name: "Comedy"),
                        Movie.Genre(id: 1, name: "Comedy")
                    ],
                    title: "Mortal Kombat Legends: Scorpion's Revenge",
                    posterPath: "/kwh9dYvZLn7yJ9nfU5sPj2h9O7l.jpg",
                    backdropPath: "/hbrXbVoE0NuA1ORoSGGYNASagrl.jpg",
                    overview: "After the vicious slaughter of his family by stone-cold mercenary Sub-Zero, Hanzo Hasashi is exiled to the torturous Netherrealm. There, in exchange for his servitude to the sinister Quan Chi, he’s given a chance to avenge his family – and is resurrected as Scorpion, a lost soul bent on revenge.",
                    releaseDate: Date()
                ),
            credits:
                MovieCredits(
                    id: 0,
                    cast: [MovieCredits.Actor(id: 0, name: "Edward Norton"),
                           MovieCredits.Actor(id: 1, name: "Brad Pitt"),
                           MovieCredits.Actor(id: 2, name: "Helena Bonham Carter")],
                    crew: [MovieCredits.CrewMember(id: 0, name: "David Fincher"),
                           MovieCredits.CrewMember(id: 1, name: "Marc Cinquanta")]
                ),
            similarMovies: [
                Movie(id: 0, genres: [], title: "myMovie", posterPath: "", backdropPath: "", overview: "", releaseDate: Date()),
                Movie(id: 1, genres: [], title: "myMovie2", posterPath: "", backdropPath: "", overview: "", releaseDate: Date()),
                Movie(id: 2, genres: [], title: "myMovie3", posterPath: "", backdropPath: "", overview: "", releaseDate: Date()),
                Movie(id: 3, genres: [], title: "myMovie4", posterPath: "", backdropPath: "", overview: "", releaseDate: Date()),
                Movie(id: 4, genres: [], title: "myMovie5", posterPath: "", backdropPath: "", overview: "", releaseDate: Date())
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
