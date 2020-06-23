//
//  SpotListViewModel.swift
//  SadAgregator
//
//  Created by Полина on 22.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class SpotListViewModel: ObservableObject {
  
  @Published var topSpots = [TopSpot]()
    
  private var currentPage = 0
  
  func fetchPage() {
    currentPage += 1
    DefaultAPI.agrIntfTopPointsPagingGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aPage: "\(currentPage)") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      self.topSpots.append(contentsOf: response?.pointsTop ?? [])
    }
  }
}
