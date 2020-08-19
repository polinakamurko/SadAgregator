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
  @Published var posts = [Post]()
  
  let spotID: String
  
  init(spotID: String) {
    self.spotID = spotID
  }
  
  private var currentPage = 0
  
  func fetchSpot() {
    DefaultAPI.agrIntfActivityPointGet(aKey: userKey, aPointID: spotID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let spot = response {
        self.spot = spot
        self.posts = spot.posts ?? []
        self.totalActivity = spot.activity ?? TotalActivity()
        self.providers = spot.vends ?? []
      }
    }
  }
  
  func loadNextPage() {
    
    currentPage += 1
    
    DefaultAPI.agrIntfPointPostsPagingGet(aKey: userKey, aPointID: spotID, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let posts = response?.posts {
        self.posts.append(contentsOf: posts)
      }
    }
  }
}
