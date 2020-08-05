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
  
  @Published var reviews = [Reviews]()
  
  @Published var providerIsLiked = false
  
  let providerID: String
  
  init(providerID: String) {
    self.providerID = providerID
  }
  
  func fetchProvider() {
    DefaultAPI.agrIntfVendorCardGet(aKey: userKey, aVendorID: providerID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let unwrapped = response {
        self.provider = unwrapped
        self.providerIsLiked = unwrapped.providerIsLiked
        
        if let reviews = unwrapped.revsInfo?.revs {
          self.reviews = reviews
        }
      }
    }
  }
  
  func likeProvider() {
    let newStatus = providerIsLiked ? "0" : "1"
    
    DefaultAPI.agrUtilsVendorLikeGet(aKey: userKey, aVendID: providerID, aStatus: newStatus) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      DispatchQueue.main.async {
        self.providerIsLiked.toggle()
      }
    }
  }
}

