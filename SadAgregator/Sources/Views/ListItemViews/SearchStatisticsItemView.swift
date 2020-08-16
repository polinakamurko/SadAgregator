//
//  SearchStatisticsItemView.swift
//  SadAgregator
//
//  Created by Полина on 13.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SearchStatisticsItemView: View {
  
  let index: Int
  let title: String
  let number: String
  
  init(index: Int, title: String, number: String) {
    self.index = index
    self.number = number
    
    switch title {
    case "today":
      self.title = "Сегодня"
    case "ystd":
      self.title = "Вчера"
    default:
      self.title = "Другое"
    }
  }
  
  var body: some View {
    HStack {
      Text(title)
      Text(number)
    }
    .font(Font.footnote.bold())
    .padding(.horizontal, 8)
    .frame(height: 24)
    .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
    .cornerRadius(12)
  }
}

struct SearchStatisticsItemView_Previews: PreviewProvider {
    static var previews: some View {
      SearchStatisticsItemView(index: 1, title: "Сегодня:", number: "79")
    }
}
