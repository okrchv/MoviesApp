//
//  FavoritesList.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 06.05.2021.
//

import SwiftUI

struct FavoritesList: View {
    var movies: [Movie]
    var credits: MovieCredits

    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
                    NavigationLink(
                        destination:
                            MovieLoader(movieId: movie.id)
                            .navigationTitle("")
                            .navigationBarTitleDisplayMode(.inline),
                        label: {
                            FavoriteItem(movie: movie)
                        })

                }
                .onDelete(perform: { indexSet in
                    
                })
                    
            }
            
            .navigationTitle("Watch later")
        }
    }
}

struct FavoritesList_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesList(movies: [
            Movie(id: 0, genres: [Movie.Genre(id: 0, name: "Drama")], title: "Mortal Kombat Legends: Scorpion's Revenge", posterPath: "", backdropPath: "", overview: "overview overview overview", releaseDate: Date()),
            Movie(id: 1, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie2", posterPath: "", backdropPath: "", overview: "overview overview overview", releaseDate: Date()),
            Movie(id: 2, genres: [Movie.Genre(id: 0, name: "Comedy")], title: "myMovie3", posterPath: "", backdropPath: "", overview: "overview overview overview", releaseDate: Date()),
            Movie(id: 3, genres: [Movie.Genre(id: 0, name: "Comedy")], title: "myMovie4", posterPath: "", backdropPath: "", overview: "overview overview overview", releaseDate: Date()),
            Movie(id: 4, genres: [Movie.Genre(id: 0, name: "Drama")], title: "myMovie5", posterPath: "", backdropPath: "", overview: "overview overview overview", releaseDate: Date())
        ],
        credits: MovieCredits(
            id: 0,
            cast: [MovieCredits.Actor(id: 0, name: "Edward Norton"),
                   MovieCredits.Actor(id: 1, name: "Brad Pitt"),
                   MovieCredits.Actor(id: 2, name: "Helena Bonham Carter")],
            crew: [MovieCredits.CrewMember(id: 0, name: "David Fincher"),
                   MovieCredits.CrewMember(id: 1, name: "Marc Cinquanta")]
        ))
    }
}
