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
  
  var lineId: String?
  
  private var currentPage = 0
  
  init(lineId: String? = nil) {
    self.lineId = lineId
  }
  
  func fetchPage() {
    currentPage += 1
    
    if let lineId = lineId {
      DefaultAPI.agrIntfLinePointsPagingGet(aKey: userKey, aLineID: lineId, aPage: "\(currentPage)") { (response, error) in
             if error != nil {
               print(error!)
               return
             }
             
             self.topSpots.append(contentsOf: response?.pointsTop ?? [])
           }
    } else {
      DefaultAPI.agrIntfTopPointsPagingGet(aKey: userKey, aPage: "\(currentPage)") { (response, error) in
        if error != nil {
          print(error!)
          return
        }
        
        self.topSpots.append(contentsOf: response?.pointsTop ?? [])
      }
    }
  }
}
