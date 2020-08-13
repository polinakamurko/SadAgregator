//
//  PostItemView.swift
//  SadAgregator
//
//  Created by Полина on 19.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PostItemView: View {
  
  @State private var showPostDescription = false
  @State var showUploadView = false
  var post: Post
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      VStack(alignment: .leading, spacing: 5) {
        HStack {
          Text(post.vendorCapt ?? "")
            .font(.system(size: 20, weight: .bold))
          Spacer()
          if post.price != nil {
            Text("\(post.price!) руб.")
              .font(.system(size: 15, weight: .semibold))
              .foregroundColor(Color(red: 33/255, green: 150/255, blue: 83/255))
              .frame(width: 89, height: 30)
              .background(Color(red: 239/255, green: 249/255, blue: 236/255))
              .cornerRadius(15)
          }
        }
        
        NavigationLink(destination: ProviderView(viewModel: ProviderViewModel(providerID: post.vendorId!))) {
          HStack {
            Text(post.by?.capitalized ?? "")
            Image(systemName: "chevron.right")
          }
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
        }
        
        if (post.sizes ?? []).isEmpty == false {
          HStack {
            Text("Размеры")
              .fontWeight(.medium)
              .fixedSize(horizontal: true, vertical: true)
            
            Group {
              ForEach(post.sizes ?? [], id: \.self) { size in
                Text(size)
              }
            }
            .padding(.horizontal, 8)
            .frame(height: 24)
            .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
            .background(Color(red: 248/255, green: 248/255, blue: 249/255))
            .cornerRadius(12)
          }
        }
        HStack {
          Group {
            ForEach(post.options ?? [], id: \.self) { option in
              Text(option)
            }
          }
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(Color(UIColor.darkGray))
          .padding(.horizontal, 8)
          .frame(height: 32)
          .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
          .background(Color(UIColor.systemGray6))
          .cornerRadius(10)
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal)
      
      VStack(alignment: .leading) {
        ZStack {
          Text("Показать описание")
          Button(action: {
            self.showPostDescription.toggle()
          }) {
            Image(systemName: showPostDescription ? "chevron.up" : "chevron.down")
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.trailing)
          }
        }
        .buttonStyle(BorderlessButtonStyle())
        .padding(.vertical, 8)
        .foregroundColor(Color(UIColor.darkGray))
        
        if showPostDescription {
          VStack {
            Text(post.cleanText)
              .padding([.horizontal, .bottom])
          }
        }
      }
      .background(Color(UIColor.systemGray6))
      .padding(.vertical, 8)
      .listRowInsets(EdgeInsets())
      
      // Photos
      PhotoGalleryView(imageUrlStrings: post.imageUrls)
      
      HStack {
        VStack(alignment: .leading) {
          Text(post.posted ?? "")
          Text("См. пост в ВК")
          .font(.system(size: 13, weight: .bold))
        }
        .font(.system(size: 13))
        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
        
        Spacer()
       
        Group {
          Image(systemName:"line.horizontal.3")
          Button(action: {
            self.showUploadView = true
          }) {
            HStack(spacing: 2) {
              Image("vk_icon")
                .renderingMode(.template)
              Text("Выгрузить")
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 64/255, green: 137/255, blue: 222/255))
            .sheet(isPresented: $showUploadView) {
              UploadView()
            }
          }
          .buttonStyle(BorderlessButtonStyle())
          Image(systemName:"heart")
          
        }
        .padding(.horizontal, 8)
        .frame(height: 32)
        .foregroundColor(Color(UIColor.darkGray))
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
      
        
      }
      .padding()
    }
    .padding(.top)
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostItemView(post: Post(
      vendorCapt: "2Г-03",
      vendorId: "4892",
      pointId: "1007",
      vkPost: "https://vk.com/wall475869467_10120",
      price: "350",
      by: "изатулло сироджов",
      posted: "6 мин. назад",
      text: "новинки 350р 42-44-46 качество бомба ! ткань очень хорошая! юбки",
      sizes: [ "42", "44", "46"],
      options: ["Юбка"])
    )
  }
}

