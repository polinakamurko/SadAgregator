//
//  DetailItemView.swift
//  SadAgregator
//
//  Created by Полина on 15.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct DetailItemView: View {
  let systemImageName: String?
  let imageName: String?
  let mainText: String
  let detailedText: String
  let showChevron: Bool
  
  init(
    systemImageName: String? = nil,
    imageName: String? = nil,
    mainText: String,
    detailedText: String = "",
    showChevron: Bool = false
  ) {
    self.systemImageName = systemImageName
    self.imageName = imageName
    self.mainText = mainText
    self.detailedText = detailedText
    self.showChevron = showChevron
  }
  
  var body: some View {
    VStack {
      HStack {
        if systemImageName != nil {
          Image(systemName: systemImageName!)
            .padding(.trailing, 6)
          .frame(width: 28)
        } else if imageName != nil {
          Image(imageName!)
            .padding(.trailing, 6)
          .frame(width: 28)
        }
        Text(mainText)
        Spacer()
        Text(detailedText)
          .foregroundColor(.gray)
        if showChevron {
          Image(systemName: "chevron.right")
            .foregroundColor(Color(UIColor.systemGray3))
        }
      }
    }
  }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
      DetailItemView(systemImageName: "person.crop.circle.badge.plus", mainText: "Новый поставщик")
    }
}
