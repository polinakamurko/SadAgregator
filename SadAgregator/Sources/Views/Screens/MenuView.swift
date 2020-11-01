//
//  MenuView.swift
//  SadAgregator
//
//  Created by Полина Камурко on 11.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MenuView: View {
  
  @ObservedObject var viewModel: MenuViewModel
  
  var body: some View {
    List {
      Section {
        NavigationLink(destination:
          ProfileView(viewModel: ProfileViewModel())
        ) {
          VStack(alignment: .leading) {
            Text(viewModel.menuContent.name ?? "")
              .font(.system(size: 24, weight: .bold))
              .padding(.bottom, 2)
            Text("Перейти в настройки")
              .font(.system(size: 14))
              .foregroundColor(Color(UIColor.systemGray2))
          }
          .padding(.vertical, 8)
        }
      }
      
      Section {
        NavigationLink(destination: FavoriteProvidersView(viewModel: FavoriteProviderViewModel())
        ) {
          DetailItemView(systemImageName: "person.2", mainText: "Избранные поставщики", detailedText: viewModel.menuContent.favoriteProviders ?? "")
        }
        NavigationLink(destination: LikedPostsView(viewModel: LikedPostsViewModel())
        ) {
        DetailItemView(systemImageName: "rectangle.on.rectangle", mainText: "Избранные посты", detailedText: viewModel.menuContent.likedPosts ?? "")
        }
        DetailItemView(systemImageName: "person.crop.circle.badge.plus", mainText: "Новый поставщик")
      }
      
      Section {
        DetailItemView(systemImageName: "tray.and.arrow.up", mainText: "Парсер")
        NavigationLink(destination: MasterView(viewModel: MasterViewModel())) {
          DetailItemView(systemImageName: "wrench", mainText: "Мастер настройки")
        }
      }
      .font(.system(size: UIFont.preferredFont(forTextStyle: .body).pointSize, weight: .medium))
      .listRowBackground(Color(red: 229/255, green: 242/255, blue: 255/255))
      
      Section {
        DetailItemView(systemImageName: "questionmark.circle", mainText: "Задать вопрос")
        DetailItemView(systemImageName: "hand.thumbsup", mainText: "Помощь")
      }
      
      Section {
        NavigationLink(destination: LoginView()) {
          DetailItemView(systemImageName: "square.and.arrow.up", mainText: "Выйти из аккаунта")
        }
      }
    }
    .navigationBarTitle("")
    .navigationBarHidden(true)
    .listStyle(GroupedListStyle())
    .environment(\.horizontalSizeClass, .regular)
    .onAppear(perform: viewModel.fetchMenu)
  }
}

struct MenuView_Previews: PreviewProvider {
  static var previews: some View {
    MenuView(viewModel: MenuViewModel())
  }
}
