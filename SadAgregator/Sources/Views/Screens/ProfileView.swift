//
//  ProfileView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 01.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  var body: some View {
    List {
      Section {
        DetailItemView(mainText: "Имя", detailedText: "Юрий")
        DetailItemView(mainText: "Телефон", detailedText: "+7 912 557 18 93")
        DetailItemView(mainText: "Email", detailedText: "yura@mail.ru")
        DetailItemView(mainText: "Пароль", detailedText: "Изменить")
      }
      
      Section {
        
        Button(action: {}) {
          HStack{
            Image("vk_icon")
              .renderingMode(.template)
            Text("Подключить выгрузку")
          }
        }
        .buttonStyle(BorderedButtonStyle(color: .blue))
        
        Text("Подключите Ваш аккаунт ВКонтакте для публикации товаров поставщиков на своей стене")
        
        Text("Подключите Ваш аккаунт Одноклассников для публикации товаров поставщиков в своей ленте")
      }
    }
    .onAppear {
      UITableView.appearance().separatorStyle = .none
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
