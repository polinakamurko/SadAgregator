//
//  PopularProvidersViewModel.swift
//  SadAgregator
//
//  Created by Полина on 25.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class PopularProvidersViewModel: ObservableObject {
  
  @Published var topProviders = [ProviderItem]()
  @Published var query: String = "" {
    didSet {
      currentPage = 0
      topProviders = []
      fetchPage()
    }
  }
  
  private var currentPage = 0
  
  func fetchPage() {
    currentPage += 1
    DefaultAPI.agrSrchVendorsTOPGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aQueryID: query, aPage: "\(currentPage)") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      self.topProviders.append(contentsOf: response?.items ?? [])
    }
  }
  
}
