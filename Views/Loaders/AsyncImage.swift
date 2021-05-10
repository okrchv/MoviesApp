//
//  AsyncImage.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 09.05.2021.
//

import SwiftUI

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader

    private let image: (UIImage) -> Image
 
    init(
        url: URL,
        @ViewBuilder image: @escaping (UIImage) -> Image = { Image(uiImage: $0) }
    ) {
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache).wrappedValue))
    }

    var body: some View {
        VStack {
            if let image = loader.image {
                self.image(image)
            }
        }
        .onAppear() {
            loader.load()
        }
    }
}

struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(
            url: URL(string: "https://image.tmdb.org/t/p/original/oBgWY00bEFeZ9N25wWVyuQddbAo.jpg")!,
            image: { Image(uiImage: $0).resizable() }
        )
    }
}
