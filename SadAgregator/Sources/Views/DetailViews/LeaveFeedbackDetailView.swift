//
//  LeaveFeedbackDetailView.swift
//  SadAgregator
//
//  Created by Полина on 03.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LeaveFeedbackDetailView: View {
  
  @ObservedObject var viewModel: LeaveFeedbackViewModel
  
  
  
  var body: some View {
    VStack {
      HStack {
        TextField("Заголовок отзыва", text: $viewModel.feedbackTitle)
      }
      Divider()
      HStack {
        Text("Оценка")
        Spacer()
        Group {
          Image(systemName: viewModel.rate > 0 ? "star.fill" : "star")
            .onTapGesture {
              self.viewModel.rate = 1
          }
          Image(systemName: viewModel.rate > 1 ? "star.fill" : "star")
            .onTapGesture {
              self.viewModel.rate = 2
          }
          Image(systemName: viewModel.rate > 2 ? "star.fill" : "star")
            .onTapGesture {
              self.viewModel.rate = 3
          }
          Image(systemName: viewModel.rate > 3 ? "star.fill" : "star")
            .onTapGesture {
              self.viewModel.rate = 4
          }
          Image(systemName: viewModel.rate > 4 ? "star.fill" : "star")
            .onTapGesture {
              self.viewModel.rate = 5
          }
        }
        .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
      }
      Divider()
      
      TextField("Текст отзыва", text: $viewModel.feedbackText)
        .padding(.horizontal)
        .frame(height: 196)
      Divider()
      
      Button(action: {}) {
        Text("Добавить фото")
          .frame(maxWidth: .infinity)
          .font(.system(size: 17))
          .foregroundColor(.blue)
          .padding(.vertical, 8)
      }
      
      Divider()
      
      
      Button(action: {
        self.viewModel.updateFeedback()
      }) {
        Text("Отправить отзыв")
          .frame(maxWidth: .infinity)
          .font(.system(size: 17, weight: .medium))
          .foregroundColor(.blue)
          .padding(.vertical, 8)
      }
      Spacer()
    }
    .padding()
  }
}

struct LeaveFeedbackDetailView_Previews: PreviewProvider {
  static var previews: some View {
    LeaveFeedbackDetailView(viewModel: LeaveFeedbackViewModel(providerID: "1701"))
  }
}
