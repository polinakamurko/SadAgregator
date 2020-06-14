//
//  MasterListView.swift
//  SadAgregator
//
//  Created by Полина on 09.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterListView: View {
  
  @State var searchQuery = ""
  @State var showCancelButton = false
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Spacer()
      Text("Выбрите стену для автоматического наполнения")
        .font(.title)
        .fontWeight(.bold)
      Text("Автовыгрузка для ВКонтакте")
        .font(.headline)

      SearchField(searchQuery: $searchQuery, showCancelButton: $showCancelButton, imageSearchEnabled: false)
      
      
      
      Spacer()
      Text("На этом шаге вы настраиваете")
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top)
      HStack() {
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Image(systemName: "arrow.left")
              Text("НАЗАД")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.blue)
          }
          .frame(width: 160, height: 36)
          .background(
            RoundedRectangle(cornerRadius: 17)
              .stroke(lineWidth: 2)
              .foregroundColor(.blue)
          )
        }
        
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("ГОТОВО")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
          }
          .frame(width: 160, height: 36)
          .background(
            RoundedRectangle(cornerRadius: 17)
              .foregroundColor(.blue)
          )
        }
      }
      .frame(maxWidth: .infinity, alignment: .center)
    }
    .frame(maxHeight: .infinity)
    .padding()
  }
}


struct MasterListView_Previews: PreviewProvider {
  static var previews: some View {
    MasterListView()
  }
}
