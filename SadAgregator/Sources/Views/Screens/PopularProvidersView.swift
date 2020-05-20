//
//  PopularProvidersView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 13.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PopularProvidersView: View {
  
  @State private var searchQuery = ""
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          TextField("Поиск", text: $searchQuery)
            .padding(.horizontal)
            .frame(height: 36)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
          
//          Button(action: {}) {
//            Image(systemName: "photo.fill")
//              .foregroundColor(.gray)
//          }
//          .padding(.leading, 8)
        }
        .padding([.top, .leading, .trailing])
        
        List {
          ForEach(0..<8) { index in
            NavigationLink(destination: ProviderView()) {
              PopularProviderItemView(index: index + 1)
              .padding(.vertical, 8)
            }
          }
        }
      }
      .navigationBarTitle("Популярность поставщиков", displayMode: .inline)
    }
  }
}

struct PopularProvidersView_Previews: PreviewProvider {
  static var previews: some View {
    PopularProvidersView()
  }
}
