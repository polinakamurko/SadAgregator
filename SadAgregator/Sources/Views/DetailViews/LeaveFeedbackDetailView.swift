//
//  LeaveFeedbackDetailView.swift
//  SadAgregator
//
//  Created by Полина on 03.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LeaveFeedbackDetailView: View {
  
  @State var feedbackTitle = ""
  @State var feedbackText = ""
  
  var body: some View {
    VStack {
      List {
        HStack {
          TextField("Заголовок отзыва", text: $feedbackTitle)
        }
        
        HStack {
          Text("Оценка")
          Spacer()
          Group {
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star.fill")
            Image(systemName: "star")
            Image(systemName: "star")
          }
          .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
        }
        
        TextView(text: $feedbackText)
          .padding(.horizontal)
          .frame(height: 196)
        
        
        Text("Добавить фото")
          .frame(maxWidth: .infinity)
          .font(.system(size: 17))
          .foregroundColor(.blue)
          .padding(.vertical, 8)
        
        Text("Отправить отзыв")
          .frame(maxWidth: .infinity)
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(.blue)
          .padding(.vertical, 8)
      }
      .listStyle(GroupedListStyle())
    }
  }
}

struct LeaveFeedbackDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LeaveFeedbackDetailView()
  }
}
