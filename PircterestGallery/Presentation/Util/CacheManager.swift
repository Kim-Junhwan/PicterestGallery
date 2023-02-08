//
//  CacheManager.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/02/08.
//

import Foundation
import UIKit

public class CacheManager {
    
    static let shared = CacheManager()
    
    private let cacheStorage: NSCache<NSString, UIImage> = NSCache()
    
    func getCacheImage(id: String) -> UIImage? {
        return cacheStorage.object(forKey: NSString(string: id))
    }
    
    func saveCacheImage(id: String, _ image: UIImage) {
        cacheStorage.setObject(image, forKey: NSString(string: id))
    }
}
