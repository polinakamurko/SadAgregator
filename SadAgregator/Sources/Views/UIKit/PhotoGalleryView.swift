//
//  PhotoGalleryView.swift
//  PhotoGallery
//
//  Created by Полина on 05.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PhotoGalleryView: View {
  
  let images: [String]
  
  var body: some View {
    VStack {
      if images.count == 1 {
        Image(images[0])
          .resizable()
          .aspectRatio(contentMode: .fit)
          .background(Color.black)
      }
      
      if images.count == 2 {
        HStack {
          Image(images[0])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.black)
          Image(images[1])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.black)
        }
      }
      
      if images.count == 3 {
        HStack {
          Image(images[0])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.black)
          
          VStack {
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[2])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
        }
      }
      
      if images.count == 4 {
        HStack {
          Image(images[0])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.black)
          
          VStack {
            ForEach(2..<4, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 5 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
          HStack {
            ForEach(2..<5, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 6 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
          HStack {
            ForEach(2..<6, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 7 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
          HStack {
            ForEach(2..<7, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 8 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
          HStack {
            ForEach(2..<8, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 9 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            VStack {
              Image(images[1])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
              Image(images[2])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
          HStack {
            ForEach(3..<9, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
      
      if images.count == 10 {
        VStack {
          HStack {
            Image(images[0])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
            Image(images[1])
              .resizable()
              .aspectRatio(contentMode: .fit)
              .background(Color.black)
          }
          HStack {
            ForEach(2..<5, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
          HStack {
            ForEach(5..<10, id: \.self) { index in
              Image(self.images[index])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Color.black)
            }
          }
        }
      }
    }
  }
}

struct PhotoGalleryView_Previews: PreviewProvider {
  static var previews: some View {
    PhotoGalleryView(images: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"])
  }
}
