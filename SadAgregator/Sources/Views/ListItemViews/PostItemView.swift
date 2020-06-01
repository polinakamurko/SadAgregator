//
//  PostItemView.swift
//  SadAgregator
//
//  Created by Полина on 19.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PostItemView: View {
  
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
          .foregroundColor(Color(red: 142/255, green: 142/255, blue: 147/255))
          .padding(.horizontal, 8)
          .frame(height: 32)
          .foregroundColor(Color(red: 58/255, green: 58/255, blue: 60/255))
          .background(Color(red: 248/255, green: 248/255, blue: 249/255))
          .cornerRadius(10)
        }
      }
      .frame(maxWidth: .infinity)
      .padding(.horizontal)
      
      VStack(alignment: .leading) {
        ZStack {
          Text("Показать описание")
          Image(systemName: "chevron.down")
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
        }
        .padding(.vertical, 8)
        .foregroundColor(Color(UIColor.darkGray))
        
        Text("Джинсы черные\nРазмеры 42, 44, 46, 48\n900 руб")
          .padding([.horizontal, .bottom])
      }
      .background(Color(UIColor.systemGray6))
    }
    .padding(.vertical, 8)
    .listRowInsets(EdgeInsets())
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostItemView()
  }
}
