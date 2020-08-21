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
  
  @ObservedObject var viewModel: UploadViewModel
  
  var body: some View {
    VStack {
      Text("Выберите место выгрузки")
        .font(.headline)
        .padding()
      List {
        ForEach(0..<viewModel.groups.count, id: \.self) { index in
          UploadItemView(title: self.viewModel.groups[index].capt ?? "", isVk: self.viewModel.groups[index].isVk)
        }
      }
      .onAppear(perform: viewModel.getUploadGroups)
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

