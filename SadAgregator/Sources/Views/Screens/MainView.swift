//
//  MainView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MainView: View {
  
  @State private var searchQuery = ""
  @State private var showCancelButton = false
  
  var body: some View {
    NavigationView {
      VStack {
        if !showCancelButton {
          Text("Главная")
            .fontWeight(.semibold)
            .padding(.top)
            .transition(.customNavbar)
        }
        
        HStack { // Search Bar
          HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Поиск", text: $searchQuery, onEditingChanged: { isEditing in
              withAnimation {
                self.showCancelButton = true
              }
            }, onCommit: {
              print("onCommit")
            })
              .foregroundColor(.primary)
            
            if searchQuery == "" {
              Button(action: {
                self.searchQuery = ""
              }) {
                Image(systemName: "photo.fill")
                  .opacity(showCancelButton ? 0 : 1)
                  .padding(.trailing, 8)
              }
            
            } else {
              Button(action: {
                self.searchQuery = ""
              }) {
                Image(systemName: "xmark.circle.fill")
                  .opacity(searchQuery == "" ? 0 : 1)
              }
            }
          }
          .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
          .foregroundColor(.secondary)
          .background(Color(.secondarySystemBackground))
          .cornerRadius(10.0)
          
          if showCancelButton {
            Button("Отмена") {
              UIApplication.shared.endEditing(true)
              self.searchQuery = ""
              withAnimation {
                self.showCancelButton = false
              }
            }
            .foregroundColor(Color(.systemBlue))
          }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
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
      .navigationBarHidden(true)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
