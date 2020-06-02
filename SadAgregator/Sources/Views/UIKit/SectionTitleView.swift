//
//  SectionTitleView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 20.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SectionTitleView: View {
  
  let title: String
  
  var showAllAction: (() -> Void)?
  
  init(_ title: String, showAllAction: (() -> Void)? = nil) {
    self.title = title
    self.showAllAction = showAllAction
  }
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: 22, weight: .bold))
      
      Spacer()
      
      if showAllAction != nil {
        Button(action: showAllAction!) {
          HStack {
            Text("См. все")
            Image(systemName: "chevron.right")
          }
          .font(.system(size: 15))
        }
        .buttonStyle(BorderlessButtonStyle())
      }
    }
  }
}

struct SectionTitleView_Previews: PreviewProvider {
  static var previews: some View {
    SectionTitleView("Text", showAllAction: {})
  }
}
