//
//  Movie.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 28.04.2021.
//

import Foundation

struct MoviesList: Decodable {
    var movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}


