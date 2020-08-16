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
  
  private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
  
  @Published var image: UIImage?
  
  private let url: URL
  private var cancellable: AnyCancellable?
  private var cache: ImageCache?
  
  private(set) var isLoading = false
  
  init(url: URL, cache: ImageCache? = nil) {
    self.url = url
    self.cache = cache
  }
  
  deinit {
    cancellable?.cancel()
  }
  
  func load() {
    guard !isLoading else { return }
    
    if let image = cache?[url] {
      self.image = image
      return
    }
    
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .subscribe(on: Self.imageProcessingQueue)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .handleEvents(
        receiveSubscription: { [weak self] _ in self?.onStart() },
        receiveOutput: { [weak self] in self?.cache($0) },
        receiveCompletion: { [weak self] _ in self?.onFinish() },
        receiveCancel: { [weak self] in self?.onFinish() }
      )
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
  }
  
  func cancel() {
    cancellable?.cancel()
  }
  
  private func cache(_ image: UIImage?) {
    image.map { cache?[url] = $0 }
  }
  
  func onStart() {
    isLoading = true
  }
  
  func onFinish() {
    isLoading = false
  }
}
