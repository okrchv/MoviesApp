//
//  FavoriteItem.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 06.05.2021.
//

import SwiftUI

struct FavoriteItem: View {
    var movie: Movie

    var body: some View {
        HStack() {
//            PosterImage()
            VStack(alignment: .leading) {
                Text(movie.title)
                .foregroundColor(.primary)
                .font(.title2)
                
                HStack {
                    Text(movie.genres?.map({ $0.name }).joined(separator: ", ") ?? "")
                    Text("\u{2022}")
                    Text(DateFormatter.localizedString(from: movie.releaseDate, dateStyle: .medium, timeStyle: .none))
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
            }
            .lineLimit(4)
            
//            Spacer()
//            
//            FavoriteButton(isFavourite: .constant(true))
        }
        .frame(height: 150)
    }
}

struct FavoriteItem_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteItem(movie:
                        Movie(id: 0, genres: [Movie.Genre(id: 0, name: "Drama")], title: "Mortal Kombat Legends: Scorpion's Revenge", posterPath: "", backdropPath: "", overview: "", releaseDate: Date())
        )
    }
}
