//
//  ProviderViewModel.swift
//  SadAgregator
//
//  Created by Полина on 02.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class ProviderViewModel: ObservableObject {
  
  @Published var provider = Provider()
  
  let providerID: String
  init(providerID: String) {
    self.providerID = providerID
  }
  
  func fetchProvider() {
    DefaultAPI.agrIntfVendorCardGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aVendorID: providerID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let unwrapped = response {
        self.provider = unwrapped
      }
    }
  }
}

