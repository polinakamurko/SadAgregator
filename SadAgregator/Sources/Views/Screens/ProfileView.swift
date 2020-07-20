//
//  ProfileView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 01.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  
  @ObservedObject var viewModel: ProfileViewModel
  
  var body: some View {
    List {
      Group {
        DetailItemView(mainText: "Имя", detailedText: viewModel.user?.name ?? "")
        DetailItemView(mainText: "Телефон", detailedText: viewModel.user?.phone ?? "")
        DetailItemView(mainText: "Email", detailedText: viewModel.user?.email ?? "")
        DetailItemView(mainText: "Код партнера", detailedText: viewModel.user?.partnerCode ?? "")
        DetailItemView(mainText: "Ссылка на оплату", detailedText: viewModel.user?.payUrl ?? "")
        
        if viewModel.user?.vkToken == "EXISTS" {
          DetailItemView(mainText: "Автовыгрузка ВК", detailedText: viewModel.user?.autoVk ?? "")
          DetailItemView(mainText: "Осталось дней ВК", detailedText: viewModel.user?.vkExpirationDate ?? "")
        }
        
        if viewModel.user?.okToken == "EXISTS" {
          DetailItemView(mainText: "Автовыгрузка ОК")
          DetailItemView(mainText: "Осталось дней ОК", detailedText: viewModel.user?.okExpirationDate ?? "")
        }
        DetailItemView(mainText: "Настройки", detailedText: viewModel.user?.settings ?? "")
      }
      .padding(.vertical, 8)
      
      if viewModel.user?.vkToken != "EXISTS" {
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
      }
      
      if viewModel.user?.okToken != "EXISTS" {
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
    .onAppear(perform: viewModel.fetchProfile)
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
    ProfileView(viewModel: ProfileViewModel())
  }
}
