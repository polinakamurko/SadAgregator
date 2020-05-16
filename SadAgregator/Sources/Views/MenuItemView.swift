//
//  MenuItemView.swift
//  SadAgregator
//
//  Created by Полина on 15.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MenuItemView: View {
  let systemImageName: String?
  let imageName: String?
  let mainText: String
  let detailedText: String
  
  init(systemImageName: String? = nil, imageName: String? = nil, mainText: String, detailedText: String = "") {
    self.systemImageName = systemImageName
    self.imageName = imageName
    self.mainText = mainText
    self.detailedText = detailedText
  }
  
  var body: some View {
    HStack {
      if systemImageName != nil {
        Image(systemName: systemImageName!)
      } else if imageName != nil {
        Image(imageName!)
      }
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
      MenuItemView(systemImageName: "person.crop.circle.badge.plus", mainText: "Новый поставщик")
    }
}
