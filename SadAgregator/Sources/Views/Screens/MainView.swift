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
          Section {
            VStack {
              HStack {
                Text("Активность")
                  .font(.system(size: 22, weight: .bold))
                Spacer()
                Image(systemName: "chevron.down")
                  .font(.system(size: 15, weight: .bold))
                  .foregroundColor(.blue)
              }
              .padding(.horizontal)
              
              VStack {
                HStack {
                  Image(systemName: "bolt.fill")
                  Text("1048 поставщиков")
                }
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.blue)
                
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
                    Text("2253")
                    Text("10783")
                  }
                  .font(.system(size: 17, weight: .bold))
                  Spacer()
                  VStack(spacing: 12) {
                    Text("Вчера")
                      .foregroundColor(.gray)
                    Text("2253")
                    Text("10783")
                  }
                }
              }
              .frame(maxWidth: .infinity)
              .padding()
              .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
            
              ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
                .padding(.horizontal)
            }
            .listRowInsets(EdgeInsets())
            
            
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
