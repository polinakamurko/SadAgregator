//
//  BlueInfoView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 21.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct BlueInfoView: View {
  
  let iconName = "bolt.fill"
  
  @Binding var text: String
  
  var body: some View {
    HStack {
      Image(systemName: iconName)
      Text(text)
    }
    .font(.system(size: 13, weight: .bold))
    .foregroundColor(.blue)
  }
}


struct BlueInfoView_Previews: PreviewProvider {
  static var previews: some View {
    BlueInfoView(text: .constant("1029 поставщиков"))
  }
}
