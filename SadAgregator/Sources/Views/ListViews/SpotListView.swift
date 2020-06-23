//
//  SpotListView.swift
//  SadAgregator
//
//  Created by Полина on 22.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SpotListView: View {
  
  @ObservedObject var viewModel: SpotListViewModel
  
  var body: some View {
    List {
      ForEach(0..<viewModel.topSpots.count, id: \.self) { index in
        NavigationLink(destination: SpotView()) {
          ActivityItemView(
            number: index + 1,
            title: self.viewModel.topSpots[index].capt!,
            subtitle: self.viewModel.topSpots[index].lastAct!,
            disclosureText: self.viewModel.topSpots[index].posts!
          )
            .onAppear {
              let spot = self.viewModel.topSpots[index]
              if self.viewModel.topSpots.isLastItem(spot) {
                self.viewModel.fetchPage()
              }
          }
        }
      }
    }
    .onAppear(perform: viewModel.fetchPage)
  }
}

struct SpotListView_Previews: PreviewProvider {
  static var previews: some View {
    
    SpotListView(viewModel: SpotListViewModel())
  }
}
