//
//  MainView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      VStack {
        List {
          Section(header: Text("Активность линий")) {
            ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
            ActivityItemView(number: 2, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
            ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
          }
          
          Section(header: Text("Активность поставщиков")) {
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
      .navigationBarTitle("Главная", displayMode: .inline)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
