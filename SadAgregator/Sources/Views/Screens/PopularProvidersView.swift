//
//  PopularProvidersView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 13.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PopularProvidersView: View {
  
  @ObservedObject var viewModel: PopularProvidersViewModel
  
  @State private var searchQuery = ""
  @State private var showCancelButton = false
  
  var body: some View {
    NavigationView {
      VStack {
        if !showCancelButton {
          Text("Популярность поставщиков")
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
            }).foregroundColor(.primary)
            
            Button(action: {
              self.searchQuery = ""
            }) {
              Image(systemName: "xmark.circle.fill").opacity(searchQuery == "" ? 0 : 1)
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
        .padding(.top, 8)
        
        List {
          ForEach(0..<viewModel.topProviders.count, id: \.self) { index in
            NavigationLink(destination: ProviderView()) {
              PopularProviderItemView(index: index + 1, provider: self.viewModel.topProviders[index])
                .padding(.vertical, 8)
            }
            .onAppear {
              let provider = self.viewModel.topProviders[index]
              if self.viewModel.topProviders.isLastItem(provider) {
                self.viewModel.fetchPage()
              }
            }
          }
        }
        .onAppear(perform: viewModel.fetchPage)
        .resignKeyboardOnDragGesture()
      }
      .navigationBarTitle("", displayMode: .inline)
      .navigationBarHidden(true)
    }
  }
}

struct PopularProvidersView_Previews: PreviewProvider {
  static var previews: some View {
    PopularProvidersView(viewModel: PopularProvidersViewModel())
  }
}
