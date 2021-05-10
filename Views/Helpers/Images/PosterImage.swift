//
//  PosterImage.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 04.05.2021.
//

import SwiftUI

struct PosterImage: View {
    private var url: URL
    private var width: CGFloat
    private var height: CGFloat
    

    init (config: Configuration, path: String, width: CGFloat, height: CGFloat) {
        self.url = URL(
            string: "\(config.images.secureBaseUrl)\(config.images.posterSizes.first!)\(path)"
        )!
        self.width = width
        self.height = height
    }

    var body: some View {
        AsyncImage(
            url: url,
            image: { Image(uiImage: $0).resizable() }
        )
        .aspectRatio(contentMode: .fill)
        .frame(width: width, height: height)
        .cornerRadius(10)
    }
}

struct PosterImage_Previews: PreviewProvider {
    static var previews: some View {
        PosterImage(
            config: Configuration(
                images: Configuration.Images(
                    secureBaseUrl: "https://image.tmdb.org/t/p/",
                    backdropSizes: ["original"],
                    posterSizes: ["original"]
                )
            ),
            path: "/kwh9dYvZLn7yJ9nfU5sPj2h9O7l.jpg",
            width: 92,
            height: 138
        )
    }
}
