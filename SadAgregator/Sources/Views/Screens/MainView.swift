//
//  MainView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MainView: View {
  
  @ObservedObject var viewModel: MainViewModel
  
  var body: some View {
    VStack {
      if !viewModel.showCancelButton {
        Text("Главная")
          .fontWeight(.semibold)
          .padding(.top)
          .transition(.customNavbar)
      }
      
      HStack { // Search Bar
        SearchField(
          searchQuery: $viewModel.searchQuery,
          showCancelButton: $viewModel.showCancelButton,
          imageSearchEnabled: true
        )
        
        if viewModel.showCancelButton {
          Button(action: cancelSearchEditing) {
            Text("Отмена").foregroundColor(Color(.systemBlue))
          }
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
              Button(action: {
                self.viewModel.showActivity.toggle()
              }) {
                Image(systemName: viewModel.showActivity ? "chevron.down" : "chevron.right")
                  .font(.system(size: 15, weight: .bold))
                  .foregroundColor(.blue)
              }
              .buttonStyle(BorderlessButtonStyle())
            }
            .padding(.horizontal)
            
            VStack {
              HStack {
                Image(systemName: "bolt.fill")
                Text("1048 поставщиков")
              }
              .font(.system(size: 13, weight: .bold))
              .foregroundColor(.blue)
              
              if viewModel.showActivity {
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
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
          }
          .listRowInsets(EdgeInsets())
          
          SectionTitleView("Активность линий", showAllAction: {
            // TODO: Add show all action
          })
          
          ForEach(0..<3, id: \.self) { index in
            NavigationLink(destination: LineView()) {
              ActivityItemView(number: index + 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
            }
          }
        }
        
        Section {
          SectionTitleView("Активность точек", showAllAction: {
            // TODO: Add show all action
          })
          ForEach(0..<3, id: \.self) { index in
            NavigationLink(destination: SpotView()) {
              ActivityItemView(number: index + 1, title: "Точка 30", subtitle: "17 мин. назад", disclosureText: "1436")
            }
          }
        }
        
        Section {
          SectionTitleView("Последние посты")
            
          ForEach(0..<4, id: \.self) { _ in
            PostItemView()
              .listRowInsets(EdgeInsets())
          }
        }
      }
    }
    .navigationBarTitle("Главная", displayMode: .inline)
    .navigationBarHidden(true)
    .onAppear(perform: fetchMain)
  }
  
  private func cancelSearchEditing() {
    UIApplication.shared.endEditing(true)
    viewModel.searchQuery = ""
    
    withAnimation {
      self.viewModel.showCancelButton = false
    }
  }
  
  private func fetchMain() {
    DefaultAPI.agrIntfMainGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788") { (mainPageData, error) in
      if let error = error {
        print(error)
        return
      }
      
      print(mainPageData)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel())
  }
}
