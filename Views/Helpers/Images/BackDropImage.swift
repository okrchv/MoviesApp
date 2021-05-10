//
//  BackDropImage.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 04.05.2021.
//

import SwiftUI

struct BackDropImage: View {
    private var url: URL

    init (config: Configuration, path: String) {
        self.url = URL(
            string: "\(config.images.secureBaseUrl)\(config.images.posterSizes.last!)\(path)"
        )!
    }
    
    var body: some View {
        AsyncImage(
            url: url,
            image: { Image(uiImage: $0).resizable() }
        )
        .aspectRatio(contentMode: .fill)
        .frame(height: 210)
        .overlay(TintOverlay())
    }
}

struct BackDropImage_Previews: PreviewProvider {
    static var previews: some View {
        BackDropImage(
            config: Configuration(
                images: Configuration.Images(
                    secureBaseUrl: "https://image.tmdb.org/t/p/",
                    backdropSizes: ["original"],
                    posterSizes: ["original"]
                )
            ),
            path: "/hbrXbVoE0NuA1ORoSGGYNASagrl.jpg"
        )
    }
}
