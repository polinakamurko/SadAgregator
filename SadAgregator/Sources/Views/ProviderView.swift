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
            }.padding(.top)
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
      .listRowInsets(EdgeInsets())
      }
      
      Section {
        MenuItemView(imageName: "vk_icon", mainText: "@club154574939", detailedText: "7")
        MenuItemView(systemImageName: "location", mainText: "Контейнер", detailedText: "57")
        MenuItemView(systemImageName: "phone", mainText: "Телефон", detailedText: "8 (912) 657 39 01")
        MenuItemView(systemImageName: "calendar", mainText: "Дата регистрации VK", detailedText: "17.05.1998")
        MenuItemView(systemImageName: "person.2", mainText: "Охват", detailedText: "1100 чел/сут")
      }
      
      Section {
        HStack {
          Text("Оценить поставщика")
          Spacer()
          Group {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
          }
          .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
        }
        MenuItemView(mainText: "Оставить отзыв")
        
      }
      
      Section {
        FeedbackItemView()
        FeedbackItemView()
        FeedbackItemView()
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

struct FeedbackItemView: View {
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 6) {
          Text("Хороший поставщик")
            .padding(.top)
            .font(.system(size: 15, weight: .semibold))
          HStack(spacing: 0) {
            Group{
              Image(systemName: "star.fill")
              Image(systemName: "star.fill")
              Image(systemName: "star.fill")
              Image(systemName: "star.lefthalf.fill")
              Image(systemName: "star")
            }
            .padding(.horizontal, 1.5)
            .padding(.bottom, 8)
          }
          .font(.system(size: 11))
          .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
        }
        Spacer()
        VStack(alignment: .trailing, spacing: 0) {
          Text("5 мая")
          Text("Valevko")
        }
        .font(.caption)
        .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
      }
      
      Text("Зайдя на линию 13, вы найдете множество товаров разных категорий. Большую часть здесь занимает продукция по уходу за собой. Также есть...")
        .font(.system(size: 15))
        .fixedSize(horizontal: false, vertical: true)
      
      HStack {
        Group {
          Image(systemName: "photo")
          Image(systemName: "photo")
          Image(systemName: "photo")
        }
        Spacer()
      }
      Text("Показать полностью")
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(.blue)
        .padding(.vertical, 8)
    }
  }
}
