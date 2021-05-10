//
//  Movie.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 04.05.2021.
//

import Foundation

struct Movie: Identifiable, Decodable {
    var id: Int
    var genres: [Genre]?
    var title: String
    var posterPath: String
    var backdropPath: String
    var overview: String
    var releaseDate: Date
    
    struct Genre: Identifiable, Decodable {
        var id: Int
        var name: String
    }
}
