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
            Text("Перейти в настройки")
              .font(.system(size: 14))
              .foregroundColor(Color(UIColor.systemGray2))
          }
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
      }
      
      Section {
        HStack {
          Image(systemName: "person.2")
          Text("Избранные поставщики")
          Spacer()
          Text("7")
            .foregroundColor(.gray)
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
        
        HStack {
          Image(systemName: "rectangle.on.rectangle")
          Text("Избранные посты")
          Spacer()
          Text("57")
            .foregroundColor(.gray)
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
        
        HStack {
          Image(systemName: "person.crop.circle.badge.plus")
          Text("Новый поставщик")
          Spacer()
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
      }
    }
  .listStyle(GroupedListStyle())
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView()
  }
}

