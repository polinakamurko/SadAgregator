//
//  BorderedButtonStyle.swift
//  SadAgregator
//
//  Created by Yura Istomin on 01.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct BorderedButtonStyle: ButtonStyle {
  
  var color: Color
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(color)
      .frame(height: 52)
      .frame(maxWidth: .infinity)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .stroke(color, lineWidth: 2)
      )
  }
}
