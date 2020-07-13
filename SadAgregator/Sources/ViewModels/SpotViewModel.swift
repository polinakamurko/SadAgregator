//
//  SpotViewModel.swift
//  SadAgregator
//
//  Created by Полина on 30.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class SpotViewModel: ObservableObject {
  
  @Published var spot = Spot()
  @Published var totalActivity = TotalActivity()
  @Published var providers = [Providers]()
  
  let spotID: String
  
  init(spotID: String) {
    self.spotID = spotID
  }
  
  func fetchSpot() {
    DefaultAPI.agrIntfActivityPointGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aPointID: spotID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let unwrapped = response {
        self.spot = unwrapped
        self.totalActivity = unwrapped.activity ?? TotalActivity()
        self.providers = unwrapped.vends ?? []
      }
    }
  }
}
