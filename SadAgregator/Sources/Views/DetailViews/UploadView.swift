//
//  UploadView.swift
//  SadAgregator
//
//  Created by Полина on 16.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct UploadView: View {

  @Binding var isPresented: Bool
  
  var body: some View {
    VStack {
      Text("Выберите место выгрузки")
        .font(.headline)
        .padding()
      List {
        UploadItemView(title: "Название группы")
        UploadItemView(title: "Название группы")
        UploadItemView(title: "Название группы")
        UploadItemView(title: "Название группы")
      }
      
      Button(action: {
        self.isPresented = false
        
      }) {
        VStack(alignment: .leading, spacing: 6) {
          HStack {
            Text("Отмена")
          }
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color(.systemGray6))
        )
      }
      .padding()
    }
  }
}

