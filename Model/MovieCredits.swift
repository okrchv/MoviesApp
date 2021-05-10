//
//  MovieCredits.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 05.05.2021.
//

import Foundation

struct MovieCredits: Identifiable, Decodable {
    var id: Int
    var cast: [Actor]
    var crew: [CrewMember]
    
    struct Actor: Identifiable, Decodable {
        var id: Int
        var name: String
    }
    
    struct CrewMember: Identifiable, Decodable {
        var id: Int
        var name: String
    }
}
