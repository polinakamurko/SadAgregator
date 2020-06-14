//
//  SearchField.swift
//  SadAgregator
//
//  Created by Полина on 09.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SearchField: View {
  
  @Binding var searchQuery: String
  @Binding var showCancelButton: Bool
  var imageSearchEnabled: Bool
  
  var body: some View {
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
      
      if searchQuery == "" && imageSearchEnabled {
        Button(action: {
          self.searchQuery = ""
        }) {
          Image(systemName: "photo.fill")
            .opacity(showCancelButton ? 0 : 1)
            .padding(.trailing, 8)
        }
        
      } else if searchQuery != "" {
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
  }
}
struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
      SearchField(searchQuery: .constant(""), showCancelButton: .constant(false), imageSearchEnabled: false)
    }
}
