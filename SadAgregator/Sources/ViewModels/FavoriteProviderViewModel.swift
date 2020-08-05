//
//  FavoriteProviderViewModel.swift
//  SadAgregator
//
//  Created by Полина on 03.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class FavoriteProviderViewModel: ObservableObject {
  
  @Published var favoriteProviders = [Providers]()
  
  private var currentPage = 0
  
  func fetchFavoriteProviders() {
    
    currentPage = 1
    favoriteProviders = []
    
    DefaultAPI.agrClientMyVendorsGet(aKey: userKey, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let vends = response?.vends {
        self.favoriteProviders.append(contentsOf: vends)
      }
    }
  }
  
  func fetchPage() {
    
    currentPage += 1
    
    DefaultAPI.agrClientMyVendorsGet(aKey: userKey, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let vends = response?.vends {
        self.favoriteProviders.append(contentsOf: vends)
      }
    }
  }
}
