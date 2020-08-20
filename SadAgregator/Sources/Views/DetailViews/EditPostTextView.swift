//
//  EditPostTextView.swift
//  SadAgregator
//
//  Created by Полина on 20.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct EditPostTextView: View {

  @State var postText = ""
  var text: String
  @Binding var isPresented: Bool
  
  var body: some View {
    VStack {
      Text("Редактировать текст")
        .font(.headline)
        .padding()
      
      TextView(text: $postText)
        .padding()
      
      Button(action: {}) {
        VStack(alignment: .leading, spacing: 6) {
          HStack {
            Text("Готово")
          }
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.blue)
        )
      }
      .padding()
      
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
      .padding(.horizontal)
    }
    .onAppear {
      self.postText = self.text
    }
  }
}
