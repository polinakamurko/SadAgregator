//
//  FeedbackPhotoGalleryView.swift
//  SadAgregator
//
//  Created by Полина on 07.09.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI
import Alamofire

struct FeedbackPhotoGalleryView: View {
  
  @Environment(\.imageCache) var cache
  
  let imageUrlStrings: [String]
  
  private var imageUrls: [URL] {
    imageUrlStrings.map { URL(string: $0)! }
  }

  var body: some View {
    HStack {
      ForEach(0..<imageUrls.count, id: \.self) { index in
        AsyncImage(
          url: self.imageUrls[index],
          placeholder: Text("Loading"),
          cache: self.cache
        )
      }
    }
  }
}
