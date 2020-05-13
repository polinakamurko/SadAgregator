//
//  ContentView.swift
//  SadAgregator
//
//  Created by Полина Камурко on 08.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  
  
  var body: some View {
    TabView {
      Text("Main")
        .tabItem {
          Image(systemName: "house.fill")
        }
      
      PopularProvidersView()
        .tabItem {
          Image(systemName: "bolt.fill")
        }
      
      MenuView()
        .tabItem {
          Image(systemName: "line.horizontal.3")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
