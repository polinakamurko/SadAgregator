//
//  PhotoGalleryView.swift
//  PhotoGallery
//
//  Created by Полина on 05.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI
import Alamofire

struct PhotoGalleryView: View {
  
  @Environment(\.imageCache) var cache
  
  let imageUrlStrings: [String]
  
  private var imageUrls: [URL] {
    imageUrlStrings.map { URL(string: $0)! }
  }
  
  var body: some View {
    VStack {
      if imageUrls.count == 1 {
        AsyncImage(
          url: imageUrls[0],
          placeholder: Text("Loading"),
          cache: cache
        )
      }
      
      if imageUrls.count == 2 {
        HStack {
          AsyncImage(
            url: imageUrls[0],
            placeholder: Text("Loading"),
            cache: cache
          )
          AsyncImage(
            url: imageUrls[1],
            placeholder: Text("Loading"),
            cache: cache
          )
        }
      }
      
      if imageUrls.count == 3 {
        HStack {
          AsyncImage(
            url: imageUrls[0],
            placeholder: Text("Loading"),
            cache: cache
          )
          
          VStack {
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[2],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
        }
      }
      
      if imageUrls.count == 4 {
        HStack {
          AsyncImage(
            url: imageUrls[1],
            placeholder: Text("Loading"),
            cache: cache
          )
          
          VStack {
            ForEach(2..<4, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 5 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
          HStack {
            ForEach(2..<5, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 6 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
          HStack {
            ForEach(2..<6, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 7 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
          HStack {
            ForEach(2..<7, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 8 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
          HStack {
            ForEach(2..<8, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 9 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            VStack {
              AsyncImage(
                url: imageUrls[1],
                placeholder: Text("Loading"),
                cache: cache
              )
              AsyncImage(
                url: imageUrls[2],
                placeholder: Text("Loading"),
                cache: cache
              )
            }
          }
          HStack {
            ForEach(3..<9, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
      
      if imageUrls.count == 10 {
        VStack {
          HStack {
            AsyncImage(
              url: imageUrls[0],
              placeholder: Text("Loading"),
              cache: cache
            )
            AsyncImage(
              url: imageUrls[1],
              placeholder: Text("Loading"),
              cache: cache
            )
          }
          HStack {
            ForEach(2..<5, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
          HStack {
            ForEach(5..<10, id: \.self) { index in
              AsyncImage(
                url: self.imageUrls[index],
                placeholder: Text("Loading"),
                cache: self.cache
              )
            }
          }
        }
      }
    }
  }
}

struct PhotoGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoGalleryView(imageUrlStrings: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
  }
}
