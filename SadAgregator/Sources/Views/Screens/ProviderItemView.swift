//
//  ProviderItemView.swift
//  SadAgregator
//
//  Created by Полина on 30.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ProviderItemView: View {
  
  var provider: Providers
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(provider.name ?? "")
        Spacer()
        Group {
          Text(provider.act ?? "")
          Image(systemName: "chevron.right")
        }
        .font(.subheadline)
        .foregroundColor(Color(UIColor.systemGray3))
      }
      
      VStack(alignment: .leading, spacing: 5) {
        if provider.rating != nil {
          HStack(spacing: 0) {
            Group {
              Text(provider.rate ?? "0")
                .padding(.trailing, 4)
              ForEach(0..<provider.filledStars) { _ in
                Image(systemName: "star.fill")
                  .padding(.horizontal, 2)
              }
              
              if provider.hasHalfStart {
                Image(systemName: "star.lefthalf.fill")
                  .padding(.horizontal, 2)
              }
              
              ForEach(0..<provider.emptyStars) { _ in
                Image(systemName: "star")
                  .padding(.horizontal, 2)
              }
            }
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color(UIColor.systemGray2))
          }
        }
        
        HStack(spacing: 0) {
          Group {
            Image(systemName: "star.fill")
              .padding(.trailing, 4)
            
            Text(provider.reviews)
              .padding(.trailing, 8)
            
            Image(systemName: "photo.fill.on.rectangle.fill")
              .padding(.trailing, 4)
            
            Text("\(provider.imgs ?? 0) фото")
          }
          .font(.system(size: 10))
          .foregroundColor(Color(UIColor.systemGray2))
        }
        
        HStack {
          Image("whatsapp")
          Text(provider.ph ?? "Не указан")
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(13)
        
        Text("Нет уникального контента")
          .font(.system(size: 15))
          .foregroundColor(Color(UIColor.systemGray))
      }
    }
    .padding(.horizontal)
  }
  
}

struct ProviderItemView_Previews: PreviewProvider {
  static var previews: some View {
    ProviderItemView(provider: Providers(_id: 10, name: "василиса ермина", ph: "10 шт", rate: "3.5", revs: 0, imgs: 0, act: "", pop: 40))
  }
}
