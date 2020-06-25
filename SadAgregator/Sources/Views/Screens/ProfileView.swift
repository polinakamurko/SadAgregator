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
        Group {
          DetailItemView(mainText: "Имя", detailedText: "Юрий")
          DetailItemView(mainText: "Телефон", detailedText: "+7 912 557 18 93")
          DetailItemView(mainText: "Email", detailedText: "yura@mail.ru")
          DetailItemView(mainText: "Пароль", detailedText: "Изменить")
          DetailItemView(mainText: "Код партнера", detailedText: "Некий код")
          DetailItemView(mainText: "Автовыгрузка ВК", showChevron: true)
          DetailItemView(mainText: "Автовыгрузка ОК", showChevron: true)
        }
        .padding(.vertical, 8)
      }
      
      Section {
        
        Button(action: {}) {
          HStack{
            Image("vk_icon")
              .renderingMode(.template)
            Text("Подключить выгрузку")
              .fontWeight(.medium)
          }
        }
        .buttonStyle(BorderedButtonStyle(color: .blue))
        .padding(.top)
        
        Text("Подключите Ваш аккаунт ВКонтакте для публикации товаров поставщиков на своей стене")
          .font(.footnote)
          .multilineTextAlignment(.center)
          .foregroundColor(.gray)
          .frame(maxWidth: .infinity)
        
        Button(action: {}) {
          HStack{
            Image("ok_icon")
              .renderingMode(.template)
            Text("Подключить выгрузку")
              .fontWeight(.medium)
          }
        }
        .buttonStyle(BorderedButtonStyle(color: .orange))
        .padding(.top)
        
        Text("Подключите Ваш аккаунт Одноклассников для публикации товаров поставщиков в своей ленте")
          .font(.footnote)
          .multilineTextAlignment(.center)
          .foregroundColor(.gray)
          .frame(maxWidth: .infinity)
      }
    }
    .navigationBarTitle("Профиль", displayMode: .inline)
    .onAppear {
//      UITableView.appearance().separatorStyle = .none
    }
    .onDisappear {
//      UITableView.appearance().separatorStyle = .singleLine
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
