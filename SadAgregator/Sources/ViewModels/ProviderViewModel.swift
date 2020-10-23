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
  @Published var posts = [Post]()
  @Published var rate = 0 {
    didSet {
      if rate > 0 {
        updateRate()
      }
    }
  }
  @Published var presentSafariView = false
  
  let providerID: String
  
  init(providerID: String) {
    self.providerID = providerID
  }
  
  private var currentPage = 0
  
  func fetchProvider() {
    DefaultAPI.agrIntfVendorCardGet(aKey: userKey, aVendorID: providerID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let provider = response {
        self.provider = provider
        self.posts = provider.posts ?? []
        self.providerIsLiked = provider.providerIsLiked
        
        if let reviews = provider.revsInfo?.revs {
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
  
  func loadNextPage() {
    
    currentPage += 1
    
    DefaultAPI.agrIntfGetVendPostsPagingGet(aKey: userKey, aVendorID: providerID, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let posts = response?.posts {
        self.posts.append(contentsOf: posts)
      }
    }
  }
  
  private func updateRate() {
    DefaultAPI.agrIntfRateUpdateGet(aKey: userKey, aVendID: providerID, aRate: "\(rate)") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
    }
  }
}

