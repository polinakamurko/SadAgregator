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
  
  init(url: URL) {
    self.url = url
  }
  
  deinit {
    cancellable?.cancel()
  }
  
  func load() {
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
  }
  
  func cancel() {
    cancellable?.cancel()
  }
}
