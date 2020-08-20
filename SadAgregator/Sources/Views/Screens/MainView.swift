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
          .font(.headline)
          .padding(.top)
          .transition(.customNavbar)
      }
      
      MainSearchBar(
        searchQuery: $viewModel.searchQuery,
        searchModeEnabled: $viewModel.inSearchMode,
        cancelAction: cancelSearchEditing
      )
      
      // Search Results
      if viewModel.inSearchMode {
        HStack {
          ForEach(0..<viewModel.searchStatistics.count, id: \.self) { index in
            HStack {
              SearchStatisticsItemView(
                index: index + 1,
                title: self.viewModel.searchStatistics[index].type ?? "",
                number: self.viewModel.searchStatistics[index].cnt ?? ""
              )
              
              if index < self.viewModel.searchStatistics.count - 1 {
                Spacer()
              }
            }
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 4)
        .padding(.horizontal, 16)
        
        if viewModel.showHowSearchWorks {
          ZStack {
            Button(action: {
              self.viewModel.presentSafariView = true
            }) {
              Text(viewModel.helpText)
            }
            .sheet(isPresented: $viewModel.presentSafariView) {
              if self.viewModel.helpURL.isEmpty == false {
                SafariView(url: URL(string: self.viewModel.helpURL))
              } else {
                Text("Страница недоступна")
              }
            }
            
            HStack {
              Spacer()
              Button(action: {
                self.viewModel.showHowSearchWorks = false
                UserDefaults.standard.set(false, forKey: UserDefaultsKey.showHowMainSearchWorks.rawValue)
              }) {
                Image(systemName: "xmark")
              }
            }
          }
          .padding(.vertical, 6)
          .padding(.horizontal, 16)
          .padding(.bottom, 0)
          .frame(maxWidth: .infinity)
          .background(Color(red: 226/255, green: 241/255, blue: 255/255))
          .foregroundColor(Color(.systemBlue))
        }
      }
      
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
            PostItemView(post: post, onTagTap: { tag in
              self.viewModel.inSearchMode = true
              self.viewModel.searchQuery = tag
            })
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

struct MainSearchBar: View {
  
  @Binding var searchQuery: String
  @Binding var searchModeEnabled: Bool
  
  var cancelAction: () -> Void
  
  var body: some View {
    HStack { // Search Bar
      SearchField(
        searchQuery: $searchQuery,
        showCancelButton: $searchModeEnabled,
        imageSearchEnabled: true
      )
      
      if searchModeEnabled {
        Button(action: cancelAction) {
          Text("Отмена").foregroundColor(Color(.systemBlue))
        }
      }
    }
    .padding(.horizontal)
    .padding(.vertical, 8)
  }
}
