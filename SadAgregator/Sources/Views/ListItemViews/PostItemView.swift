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
  
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      VStack(alignment: .leading, spacing: 5) {
        HStack {
          Text("38-46")
            .font(.system(size: 20, weight: .bold))
          Spacer()
          Text("900 руб.")
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color(red: 33/255, green: 150/255, blue: 83/255))
            .frame(width: 89, height: 30)
            .background(Color(red: 239/255, green: 249/255, blue: 236/255))
            .cornerRadius(15)
        }
        
        HStack {
          Text("baby club")
          Image(systemName: "chevron.right")
        }
        .font(.system(size: 17, weight: .medium))
        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
        
        HStack {
          Text("Размеры")
            .fontWeight(.medium)
          Group {
            Text("42")
            Text("44")
            Text("46")
            Text("48")
            Text("50")
          }
          .padding(.horizontal, 8)
          .frame(height: 24)
          .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
          .background(Color(red: 248/255, green: 248/255, blue: 249/255))
          .cornerRadius(12)
        }
        HStack {
          Group {
            Text("Опт")
            Text("В размер")
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
            Text("Джинсы черные\nРазмеры 42, 44, 46, 48\n900 руб")
              .padding([.horizontal, .bottom])
          }
        }
      }
      .background(Color(UIColor.systemGray6))
      .padding(.vertical, 8)
      .listRowInsets(EdgeInsets())
      
      HStack {
        VStack(alignment: .leading) {
          Text("17 мин. назад")
          Text("См. пост в ВК")
          .font(.system(size: 13, weight: .bold))
        }
        .font(.system(size: 13))
        .foregroundColor(Color(red: 174/255, green: 174/255, blue: 178/255))
        
        Spacer()
       
        Group {
          Image(systemName:"line.horizontal.3")
          HStack(spacing: 2) {
            Image("vk_icon")
              .renderingMode(.template)
            Text("Выгрузить")
          }
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(Color(red: 64/255, green: 137/255, blue: 222/255))
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
    PostItemView()
  }
}

