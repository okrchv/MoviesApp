//
//  Configuration.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 09.05.2021.
//

import Foundation

struct Configuration: Decodable  {
    var images: Images
    
    struct Images: Decodable {
        var secureBaseUrl: String
        var backdropSizes: [String]
        var posterSizes: [String]
    }
}
