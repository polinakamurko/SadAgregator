//
//  AsyncImage.swift
//  SadAgregator
//
//  Created by Yura Istomin on 16.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
  
  @ObservedObject private var loader: ImageLoader
  private let placeholder: Placeholder?
  
  init(url: URL, placeholder: Placeholder? = nil) {
    loader = ImageLoader(url: url)
    self.placeholder = placeholder
  }
  
  var body: some View {
    image
      .onAppear(perform: loader.load)
      .onDisappear(perform: loader.cancel)
  }
  
  private var image: some View {
    placeholder
  }
}
