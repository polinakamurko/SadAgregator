//
//  ActivityItemView.swift
//  SadAgregator
//
//  Created by Полина on 13.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ActivityItemView: View {
  
  let number: Int
  let title, subtitle, disclosureText: String
  
  var body: some View {
    HStack {
      Text("\(number)")
        .font(.system(size: 11))
        .foregroundColor(.blue)
        .frame(width: 18, height: 18)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(9)
        .padding(.trailing, 6)
      
      VStack(alignment: .leading) {
        Text(title)
        Text (subtitle)
          .font(.system(size: 15))
          .foregroundColor(.gray)
      }
      
      Spacer()
      Group {
        Image(systemName: "rectangle.fill.on.rectangle.fill")
        Text(disclosureText)
//        Image(systemName: "chevron.right")
      }
      .foregroundColor(Color(UIColor.systemGray3))
    }
    .padding(.vertical, 8)
  }
}

struct ActivityItemView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
  }
}
