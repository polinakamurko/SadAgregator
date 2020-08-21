//
//  PostItemView.swift
//  SadAgregator
//
//  Created by Полина on 19.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PostItemView: View {
  
  @ObservedObject var viewModel: PostItemViewModel
  
  var onTagTap: (String) -> Void
  
  init(post: Post, onTagTap: @escaping (String) -> Void = { _ in }) {
    self.viewModel = PostItemViewModel(post: post)
    self.onTagTap = onTagTap
  }
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      VStack(alignment: .leading, spacing: 5) {
        HStack {
          Text(viewModel.post.vendorCapt ?? "")
            .font(.system(size: 20, weight: .bold))
          Spacer()
          if viewModel.post.price != nil {
            Text("\(viewModel.post.price!) руб.")
              .font(.system(size: 15, weight: .semibold))
              .foregroundColor(Color(red: 33/255, green: 150/255, blue: 83/255))
              .frame(width: 89, height: 30)
              .background(Color(red: 239/255, green: 249/255, blue: 236/255))
              .cornerRadius(15)
          }
        }
        
        NavigationLink(destination: ProviderView(viewModel: ProviderViewModel(providerID: viewModel.post.vendorId!))) {
          HStack {
            Text(viewModel.post.by?.capitalized ?? "")
            Image(systemName: "chevron.right")
          }
            
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
          //          .buttonStyle(BorderlessButtonStyle())
        }
        .buttonStyle(BorderlessButtonStyle())
        
        if (viewModel.post.sizes ?? []).isEmpty == false {
          HStack {
            Text("Размеры")
              .fontWeight(.medium)
              .fixedSize(horizontal: true, vertical: true)
            
            Group {
              ForEach(viewModel.post.sizes ?? [], id: \.self) { size in
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
            ForEach(viewModel.post.options ?? [], id: \.self) { option in
              Text(option)
                .onTapGesture {
                  self.onTagTap(option)
              }
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
            self.viewModel.showPostDescription.toggle()
          }) {
            Image(systemName: viewModel.showPostDescription ? "chevron.up" : "chevron.down")
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.trailing)
          }
        }
        .buttonStyle(BorderlessButtonStyle())
        .padding(.vertical, 8)
        .foregroundColor(Color(UIColor.darkGray))
        
        if viewModel.showPostDescription {
          VStack {
            Text(viewModel.post.cleanText)
              .padding([.horizontal, .bottom])
          }
        }
      }
      .background(Color(UIColor.systemGray6))
      .padding(.vertical, 8)
      .listRowInsets(EdgeInsets())
      
      // Photos
      PhotoGalleryView(imageUrlStrings: viewModel.post.imageUrls)
      
      HStack {
        Button(action: {
          self.openURL(URL(string: self.viewModel.post.vkPost ?? "https://www.apple.com")!)
        }) {
          VStack(alignment: .leading) {
            Text(viewModel.post.posted ?? "")
            Text("См. пост в ВК")
              .font(.system(size: 13, weight: .bold))
          }
        }
        .buttonStyle(BorderlessButtonStyle())
        .font(.system(size: 13))
        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
        
        Spacer()
        
        Group {
          Button(action: {
            self.viewModel.showEditTextView = true
          }) {
            Image(systemName:"line.horizontal.3")
              .sheet(isPresented: $viewModel.showEditTextView) {
                EditPostTextView(text: self.viewModel.post.text ?? "", isPresented: self.$viewModel.showEditTextView)
            }
          }
          .buttonStyle(BorderlessButtonStyle())
          
          Button(action: {
            self.viewModel.showUploadView = true
          }) {
            HStack(spacing: 2) {
              Image("vk_icon")
                .renderingMode(.template)
              Text("Выгрузить")
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(Color(red: 64/255, green: 137/255, blue: 222/255))
            .sheet(isPresented: $viewModel.showUploadView) {
              UploadView(isPresented: self.$viewModel.showUploadView, viewModel: UploadViewModel())
            }
          }
          .buttonStyle(BorderlessButtonStyle())
          
          Button(action: viewModel.likePost) {
            Image(systemName: viewModel.postIsLiked ? "heart.fill" : "heart")
              .foregroundColor(Color(.systemBlue))
          }
          .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.horizontal, 8)
        .frame(height: 32)
        .foregroundColor(Color(UIColor.darkGray))
        .background(Color(UIColor.systemGray6))
        .cornerRadius(10)
        
        
      }
      .padding()
      Divider()
    }
    .padding(.top)
  }
  
  func openURL(_ url: URL) {
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
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

