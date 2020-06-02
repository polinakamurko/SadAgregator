//
//  RootView.swift
//  SadAgregator
//
//  Created by Полина Камурко on 08.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct RootView: View {
  
  var body: some View {
    TabView {
      NavigationView {
        MainView()
      }
      .tabItem {
          Image(systemName: "house.fill")
            .font(.system(size: 20))
      }
      
      PopularProvidersView()
        .tabItem {
          Image(systemName: "bolt.fill")
            .font(.system(size: 20))
      }
      NavigationView {
        MenuView()
      }
      .tabItem {
        Image(systemName: "line.horizontal.3")
          .font(.system(size: 20))
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
  }
}
