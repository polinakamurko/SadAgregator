//
//  Images.swift
//  SadAgregator
//
//  Created by Полина on 11.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import Foundation

public struct Images: Codable {
  
  public var imageId: String?
  public var image: String?
  public var sizes: [ImageSizes]?
  
  public init(imageId: String? = nil, image: String? = nil, sizes: [ImageSizes]? = nil) {
    self.imageId = imageId
    self.image = image
    self.sizes = sizes
  }
  
  public enum CodingKeys: String, CodingKey {
    case imageId = "img_id"
    case image = "img"
    case sizes
  }
}
