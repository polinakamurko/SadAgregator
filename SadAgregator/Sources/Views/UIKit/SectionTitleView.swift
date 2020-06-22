//
//  SectionTitleView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 20.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SectionTitleView<Destination>: View where Destination: View {
  
  let title: String
  
  let showAllDestinationView: Destination?
  
  init(_ title: String, showAllView: Destination? = nil) {
    self.title = title
    self.showAllDestinationView = showAllView
  }
  
  var body: some View {
    HStack {
      Text(title)
        .font(.system(size: 22, weight: .bold))
      
      Spacer()
      
      if showAllDestinationView != nil {
        NavigationLink(destination: showAllDestinationView!) {
          HStack {
            Text("См. все")
            Image(systemName: "chevron.right")
          }
          .font(.system(size: 15))
        }
        .buttonStyle(BorderlessButtonStyle())
      }
      
//      if showAllAction != nil {
//        Button(action: showAllAction!) {
//          HStack {
//            Text("См. все")
//            Image(systemName: "chevron.right")
//          }
//          .font(.system(size: 15))
//        }
//        .buttonStyle(BorderlessButtonStyle())
//      }
    }
    .padding(.top, 8)
  }
}

struct SectionTitleView_Previews: PreviewProvider {
  static var previews: some View {
    SectionTitleView<SpotListView>("Text", showAllView: SpotListView(viewModel: SpotListViewModel()))
  }
}
