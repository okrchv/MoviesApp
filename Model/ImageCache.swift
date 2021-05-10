//
//  ImageCache.swift
//  MSI 2021
//
//  Created by Oleh Kiurchev on 09.05.2021.
//

import UIKit

struct ImageCache {
    private let cache: NSCache<NSURL, UIImage>
        
    init () {
        self.cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100 // 100 items
        cache.totalCostLimit = 1024 * 1024 * 100 // 100 MB
    }
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set { newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL) }
    }
}


