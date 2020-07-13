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
      if !viewModel.inSearchMode {
        Text("Главная")
          .fontWeight(.semibold)
          .padding(.top)
          .transition(.customNavbar)
      }
      
      HStack { // Search Bar
        SearchField(
          searchQuery: $viewModel.searchQuery,
          showCancelButton: $viewModel.inSearchMode,
          imageSearchEnabled: true
        )
        
        if viewModel.inSearchMode {
          Button(action: cancelSearchEditing) {
            Text("Отмена").foregroundColor(Color(.systemBlue))
          }
        }
      }
      .padding(.horizontal)
      .padding(.vertical, 8)
      
      List {
        if !viewModel.inSearchMode {
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
            
            Section {
              SectionTitleView("Активность линий", showAllView: LineListView(viewModel: LineListViewModel()))
              ForEach(0..<viewModel.topLines.count, id: \.self) { index in
                NavigationLink(destination: LineView(viewModel: LineViewModel(lineID: self.viewModel.topLines[index].lineId!))) {
                  ActivityItemView(
                    number: index + 1,
                    title: self.viewModel.topLines[index].capt!,
                    subtitle: self.viewModel.topLines[index].lastAct!,
                    disclosureText: self.viewModel.topLines[index].posts!
                  )
                }
              }
            }
          }
          
          Section {
            SectionTitleView("Активность точек", showAllView: SpotListView(viewModel: SpotListViewModel()))
            ForEach(0..<viewModel.topSpots.count, id: \.self) { index in
              NavigationLink(destination: SpotView(viewModel: SpotViewModel(spotID: self.viewModel.topSpots[index].pointId!))) {
                ActivityItemView(
                  number: index + 1,
                  title: self.viewModel.topSpots[index].capt!,
                  subtitle: self.viewModel.topSpots[index].lastAct!,
                  disclosureText: self.viewModel.topSpots[index].posts!
                )
              }
            }
          }
        }
        Section {
          SectionTitleView<Text>("Последние посты")
          
          ForEach(viewModel.inSearchMode ? viewModel.searchPosts : viewModel.posts) { post in
            PostItemView(post: post)
              .listRowInsets(EdgeInsets())
              .onAppear {
                self.onPostShowed(post)
            }
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
      self.viewModel.inSearchMode = false
    }
  }
  
  private func fetchMain() {
    viewModel.fetchData()
  }
  
  private func onPostShowed(_ post: Post) {
    if viewModel.inSearchMode == false {
      if viewModel.posts.isLastItem(post) {
        viewModel.loadNextPage()
      }
    } else {
      if viewModel.searchPosts.isLastItem(post) {
        viewModel.loadNextPage()
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: MainViewModel())
  }
}
