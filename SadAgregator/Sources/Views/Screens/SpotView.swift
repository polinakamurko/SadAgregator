//
//  SpotView.swift
//  SadAgregator
//
//  Created by Полина on 23.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SpotView: View {
  var body: some View {
    VStack {
      HStack {
        HStack {
          Image(systemName: "arrow.left.circle.fill")
            .font(.headline)
          Text("6-68")
        }
        Spacer()
        HStack {
          Text("6-70")
          Image(systemName: "arrow.right.circle.fill")
            .font(.headline)
        }
      }
      .padding()
      .font(.subheadline)
      .foregroundColor(.blue)
      
      VStack {
        HStack {
          VStack(alignment: .leading, spacing: 12) {
            Text(" ")
            HStack {
              Image(systemName: "rectangle.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Посты")
                .fixedSize(horizontal: true, vertical: false)
            }
            HStack {
              Image(systemName: "photo.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Фото")
            }
          }
          Spacer()
          VStack(spacing: 12) {
            Text("Сегодня")
              .foregroundColor(.gray)
            Text("4")
            Text("9")
          }
          .font(.system(size: 17, weight: .bold))
          Spacer()
          VStack(spacing: 12) {
            Text("Вчера")
              .foregroundColor(.gray)
            Text("16")
            Text("33")
          }
        }
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
            .font(.system(size: 15))
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
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
          PostItemView()
          PostItemView()
          PostItemView()
          PostItemView()
        }
      }
    }
  }
}

struct SpotView_Previews: PreviewProvider {
  static var previews: some View {
    SpotView()
  }
}
