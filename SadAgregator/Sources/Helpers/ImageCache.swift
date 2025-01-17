//
//  ImageCache.swift
//  SadAgregator
//
//  Created by Yura Istomin on 16.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import UIKit
import SwiftUI

protocol ImageCache {
  subscript(_ url: URL) -> UIImage? { get set }
}

struct TemporaryImageCache: ImageCache {
  
  private let cache = NSCache<NSURL, UIImage>()
  
  subscript(_ key: URL) -> UIImage? {
    get { cache.object(forKey: key as NSURL) }
    set {
      newValue == nil ? cache.removeObject(forKey: key as NSURL) : cache.setObject(newValue!, forKey: key as NSURL)
    }
  }
}

struct ImageCacheKey: EnvironmentKey {
  static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues {
  var imageCache: ImageCache {
    get { self[ImageCacheKey.self] }
    set { self[ImageCacheKey.self] = newValue }
  }
}
