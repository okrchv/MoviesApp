//
//  EnvironmentValues+ImageCache.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 09.05.2021.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue = ImageCache()
}

extension EnvironmentValues {
    var imageCache: ImageCache {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}
