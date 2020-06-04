//
//  LineView.swift
//  SadAgregator
//
//  Created by Полина on 23.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LineView: View {
  var body: some View {
    VStack{
      HStack {
        HStack {
          Image(systemName: "arrow.left.circle.fill")
            .font(.headline)
          Text("Линия 6")
        }
        Spacer()
        HStack {
          Text("Линия 8")
          Image(systemName: "arrow.right.circle.fill")
          .font(.headline)
        }
      }
    .padding()
      .font(.subheadline)
      .foregroundColor(.blue)
      
       VStack {
        HStack {
          VStack(alignment: .leading, spacing: 12) {
            Text(" ")
            HStack {
              Image(systemName: "rectangle.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Посты")
                .fixedSize(horizontal: true, vertical: false)
            }
            HStack {
              Image(systemName: "photo.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Фото")
            }
          }
          Spacer()
          VStack(spacing: 12) {
            Text("Сегодня")
              .foregroundColor(.gray)
            Text("31")
            Text("102")
          }
          .font(.system(size: 17, weight: .bold))
          Spacer()
          VStack(spacing: 12) {
            Text("Вчера")
              .foregroundColor(.gray)
            Text("27")
            Text("59")
          }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
      }
      
      List {
        Section(header: Text("Активность точек")) {
          ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
          ActivityItemView(number: 2, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
          ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        }
        
        Section(header: Text("Последние посты")) {
          PostItemView()
          PostItemView()
          PostItemView()
          PostItemView()
        }
      }
    }
  }
}


struct LineView_Previews: PreviewProvider {
  static var previews: some View {
    LineView()
  }
}
