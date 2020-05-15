//
//  MenuItemView.swift
//  SadAgregator
//
//  Created by Полина on 15.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MenuItemView: View {
  let imageName: String
  let mainText: String
  let detailedText: String
  
  init(imageName: String, mainText: String, detailedText: String = "") {
    self.imageName = imageName
    self.mainText = mainText
    self.detailedText = detailedText
  }
  
  var body: some View {
    HStack {
      Image(systemName: imageName)
      Text(mainText)
      Spacer()
      Text(detailedText)
        .foregroundColor(.gray)
      Image(systemName: "chevron.right")
        .foregroundColor(Color(UIColor.systemGray3))
    }
  }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
      MenuItemView(imageName: "person.crop.circle.badge.plus", mainText: "Новый поставщик")
    }
}
