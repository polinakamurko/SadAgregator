//
//  ProviderView.swift
//  SadAgregator
//
//  Created by Полина on 15.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ProviderView: View {
  var body: some View {
    List {
      Section {
        VStack {
          HStack {
            Image("SellerPhoto")
              .frame(width: 60, height: 60)
            
            VStack(alignment: .leading, spacing: 5) {
              Text("Парфюмерия и косметика оптом")
                .font(.headline)
              HStack(spacing: 0) {
                Group {
                  Text("3.5")
                    .padding(.trailing, 4)
                  ForEach(0..<5) { _ in
                    Image(systemName: "star.fill")
                      .padding(.horizontal, 2)
                  }
                }
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color(UIColor.systemGray2))
              }
              
              HStack(spacing: 0) {
                Group {
                  Image(systemName: "star.fill")
                    .padding(.trailing, 4)
                  
                  Text("183 оценки")
                    .padding(.trailing, 8)
                  
                  Image(systemName: "photo.fill.on.rectangle.fill")
                    .padding(.trailing, 4)
                  
                  Text("13 фото")
                }
                .font(.system(size: 10))
                .foregroundColor(Color(UIColor.systemGray2))
              }
            }
          }
          
          ZStack {
            Color(UIColor.systemGray6)
              .frame(height: 34)
            Text("Условия сотрудничества")
            Image(systemName: "chevron.down")
              .frame(maxWidth: .infinity, alignment: .trailing)
              .padding(.trailing)
          }
          .foregroundColor(Color(UIColor.darkGray))
        }
      }
      Section {
        MenuItemView(imageName: "vk_icon", mainText: "@club154574939", detailedText: "7")
        MenuItemView(systemImageName: "location", mainText: "Контейнер", detailedText: "57")
        MenuItemView(systemImageName: "phone", mainText: "Номер телефона")
        MenuItemView(systemImageName: "calendar", mainText: "Дата регистрации VK")
        MenuItemView(systemImageName: "person.2", mainText: "Охват")
      }
    }
    .listStyle(GroupedListStyle())
  }
}


struct ProviderView_Previews: PreviewProvider {
  static var previews: some View {
    ProviderView()
  }
}
