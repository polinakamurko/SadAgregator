//
//  LineListView.swift
//  SadAgregator
//
//  Created by Полина on 23.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LineListView: View {
  
  @ObservedObject var viewModel: LineListViewModel
  
  var body: some View {
    List {
      ForEach(0..<viewModel.topLines.count, id: \.self) { index in
        NavigationLink(destination: LineView(viewModel: LineViewModel(lineID: self.viewModel.topLines[index].lineId!))) {
          ActivityItemView(
            number: index + 1,
            title: self.viewModel.topLines[index].capt!,
            subtitle: self.viewModel.topLines[index].lastAct!,
            disclosureText: self.viewModel.topLines[index].posts!
          )
//            .onAppear {
//              let spot = self.viewModel.topLines[index]
//              if self.viewModel.topLines.isLastItem(spot) {
//                self.viewModel.fetchPage()
//              }
//          }
        }
      }
    }
    .onAppear(perform: viewModel.fetchPage)
  }
}

struct LineListView_Previews: PreviewProvider {
  static var previews: some View {
    
    LineListView(viewModel: LineListViewModel())
  }
}
