//
//  MenuView.swift
//  SadAgregator
//
//  Created by Полина Камурко on 11.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MenuView: View {
  var body: some View {
    List {
      
      Section {
        HStack {
          VStack(alignment: .leading) {
            Text("Polina")
              .font(.system(size: 24, weight: .bold))
              .padding(.bottom, 2)
            Text("Перейти в настройки")
              .font(.system(size: 14))
              .foregroundColor(Color(UIColor.systemGray2))
          }
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
        .padding(.vertical, 8)
      }
      
      Section {
        MenuItemView(imageName: "person.2", mainText: "Избранные поставщики", detailedText: "7")
        MenuItemView(imageName: "rectangle.on.rectangle", mainText: "Избранные посты", detailedText: "57")
        MenuItemView(imageName: "person.crop.circle.badge.plus", mainText: "Новый поставщик")
      }
      
      Section {
        MenuItemView(imageName: "tray.and.arrow.up", mainText: "Парсер")
          .font(.system(size: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .medium))
          .listRowBackground(Color(red: 229/255, green: 242/255, blue: 255/255))
      }
      
      Section {
        MenuItemView(imageName: "questionmark.circle", mainText: "Задать вопрос")
        MenuItemView(imageName: "hand.thumbsup", mainText: "Помощь")
      }
      
      Section {
        MenuItemView(imageName: "square.and.arrow.up", mainText: "Выйти из аккаунта")
      }
      
    }
    .listStyle(GroupedListStyle())
    .environment(\.horizontalSizeClass, .regular)
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}


struct MenuItemView: View {
  let imageName: String
  let mainText: String
  let detailedText: String
  
  init(imageName: String, mainText: String, detailedText: String = "") {
    self.imageName = imageName
    self.mainText = mainText
    self.detailedText = detailedText
  }
  
  var body: some View {
    HStack {
      Image(systemName: imageName)
      Text(mainText)
      Spacer()
      Text(detailedText)
        .foregroundColor(.gray)
      Image(systemName: "chevron.right")
        .foregroundColor(Color(UIColor.systemGray3))
    }
  }
}
