//
//  ActivityItemView.swift
//  SadAgregator
//
//  Created by Полина on 13.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ActivityItemView: View {
  var body: some View {
    HStack {
      Text("1")
        .font(.system(size: 11))
        .foregroundColor(.blue)
        .frame(width: 18, height: 18)
        .background(Color(UIColor.systemGray5))
        .cornerRadius(9)
      
      VStack(alignment: .leading) {
        Text("Линия 30")
        Text ("17 мин. назад")
          .font(.system(size: 15))
          .foregroundColor(.gray)
      }
      
      Spacer()
      Group {
        Image(systemName: "rectangle.fill.on.rectangle.fill")
        Text("1436")
        Image(systemName: "chevron.right")
      }
      .foregroundColor(Color(UIColor.systemGray3))
    }
    .padding(.vertical)
  }
}

struct ActivityItemView_Previews: PreviewProvider {
  static var previews: some View {
    ActivityItemView()
  }
}
