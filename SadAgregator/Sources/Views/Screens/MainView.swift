//
//  MainView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SectionTitleView: View {
  
  let title: String
  
  var showAllAction: (() -> Void)?
  
  init(_ title: String, showAllAction: (() -> Void)? = nil) {
    self.title = title
    self.showAllAction = showAllAction
  }
  
  var body: some View {
    HStack {
    Text(title)
      .font(.system(size: 22, weight: .bold))
    
      Spacer()
      
      if showAllAction != nil {
        Button(action: showAllAction!) {
          HStack {
            Text("См. все")
            Image(systemName: "chevron.right")
          }
          .font(.system(size: 15))
        }
      }
    }
  }
}

struct MainView: View {
  var body: some View {
    NavigationView {
      VStack {
        List {
          Section(header: Text("Активность линий")) {
            ActivityItemView()
            ActivityItemView()
            ActivityItemView()
          }
          
          Section(header: Text("Активность поставщиков")) {
            ActivityItemView()
            ActivityItemView()
            ActivityItemView()
          }
          
          Section(header: Text("Последние посты")) {
            PostItemView()
            PostItemView()
            PostItemView()
            PostItemView()
          }
        }
        .listStyle(GroupedListStyle())
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
