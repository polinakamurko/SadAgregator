//
//  SpotView.swift
//  SadAgregator
//
//  Created by Полина on 23.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SpotView: View {
  
  @ObservedObject var viewModel: SpotViewModel
  
  var body: some View {
    VStack {
      HStack {
        HStack {
          Image(systemName: "arrow.left.circle.fill")
            .font(.headline)
          Text(viewModel.spot.arrows?.namePrev ?? "")
        }
        Spacer()
        HStack {
          Text(viewModel.spot.arrows?.nameNext ?? "")
          Image(systemName: "arrow.right.circle.fill")
            .font(.headline)
        }
      }
      .padding()
      .font(.subheadline)
      .foregroundColor(.blue)
      
      VStack {
        DetailedActivityView(totalActivity: $viewModel.totalActivity)
        .frame(maxWidth: .infinity)
        .padding()
        .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
      }
      
      VStack {
        HStack {
          Image(systemName: "exclamationmark.triangle")
            .font(.system(size: 30))
            .foregroundColor(Color(.systemRed))
            
          Text("Обращаем Ваше внимание, что по данному поставщику мы не предоставляем услуги выкупа")
            .font(.system(size: 13))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
        }
        .padding(.horizontal)
      }
      
      VStack(alignment: .leading) {
        HStack {
          Text("Арендаторы")
            .font(.system(size: 22, weight: .bold))
          Spacer()
        }
        
        VStack {
          HStack {
            Text("василиса еремина")
            Spacer()
            Group {
              Text("38 мин. назад")
              Image(systemName: "chevron.right")
            }
            .font(.subheadline)
            .foregroundColor(Color(UIColor.systemGray3))
          }
        }
        
        VStack(alignment: .leading, spacing: 5) {
          HStack(spacing: 0) {
            Group {
              Text("3.5")
                .padding(.trailing, 4)
              ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                  .padding(.horizontal, 2)
              }
            }
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(Color(UIColor.systemGray2))
          }
          
          HStack(spacing: 0) {
            Group {
              Image(systemName: "star.fill")
                .padding(.trailing, 4)
              
              Text("183 оценки")
                .padding(.trailing, 8)
              
              Image(systemName: "photo.fill.on.rectangle.fill")
                .padding(.trailing, 4)
              
              Text("13 фото")
            }
            .font(.system(size: 10))
            .foregroundColor(Color(UIColor.systemGray2))
          }
          
          HStack {
            Image("whatsapp")
            Text("8 919 769 69 16")
          }
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(Color(UIColor.systemGray6))
          .cornerRadius(13)
          
          Text("Нет уникального контента")
            .font(.system(size: 15))
            .foregroundColor(Color(UIColor.systemGray))
        }
      }
      .padding(.horizontal)
      
      List {
        Section(header: Text("Активность точек")) {
          ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
          ActivityItemView(number: 2, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
          ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        }
        
        Section(header: Text("Последние посты")) {
          ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
//          PostItemView()
//          PostItemView()
//          PostItemView()
//          PostItemView()
        }
      }
    }
    .onAppear(perform: viewModel.fetchSpot)
  }
}

struct SpotView_Previews: PreviewProvider {
  static var previews: some View {
    SpotView(viewModel: SpotViewModel(spotID: "1"))
  }
}
