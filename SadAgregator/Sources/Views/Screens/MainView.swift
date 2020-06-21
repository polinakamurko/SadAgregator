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
              BlueInfoView(text: $viewModel.activityText)
              
              if viewModel.showActivity {
                DetailedActivityView(totalActivity: $viewModel.totalActivity)
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
            
          ForEach(viewModel.posts) { post in
            PostItemView(
              providerTitle: post.providerTitle,
              price: post.price,
              providerName: post.providerName,
              text: post.cleanText ?? ""
            ).listRowInsets(EdgeInsets())
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
    viewModel.fetchData()
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel())
  }
}
