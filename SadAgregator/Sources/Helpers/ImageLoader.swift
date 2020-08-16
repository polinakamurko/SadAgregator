//
//  ImageLoader.swift
//  SadAgregator
//
//  Created by Yura Istomin on 16.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
  
  @Published var image: UIImage?
  private let url: URL
  
  init(url: URL) {
    self.url = url
  }
  
  func load() {
    
  }
  
  func cancel() {
    
  }
}
