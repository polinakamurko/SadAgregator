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
  private var cancellable: AnyCancellable?
  private var cache: ImageCache?
  
  init(url: URL, cache: ImageCache? = nil) {
    self.url = url
    self.cache = cache
  }
  
  deinit {
    cancellable?.cancel()
  }
  
  func load() {
    if let image = cache?[url] {
      self.image = image
      return
    }
    
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .handleEvents(receiveOutput: { [weak self] in self?.cache($0) })
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
  }
  
  func cancel() {
    cancellable?.cancel()
  }
  
  private func cache(_ image: UIImage?) {
    image.map { cache?[url] = $0 }
  }
}
