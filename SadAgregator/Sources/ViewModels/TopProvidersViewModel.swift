//
//  TopProvidersViewModel.swift
//  SadAgregator
//
//  Created by Полина on 25.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class TopProvidersViewModel: ObservableObject {
  
  @Published var topProviders = [ProviderItem]()
  @Published var query: String = "" {
    didSet {
      currentPage = 0
      topProviders = []
      fetchPage()
    }
  }
  
  @Published var helpText = ""
  @Published var presentSafariView = false
  
  @Published var helpURL = ""
  
  private var currentPage = 0
  
  func fetchPage() {
    currentPage += 1
    DefaultAPI.agrSrchVendorsTOPGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aQueryID: query, aPage: "\(currentPage)") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let items = response?.items {
        self.topProviders.append(contentsOf: items)
      }
      
      if let helpText = response?.help?.str {
        self.helpText = helpText
      }
      
      if let helpURL = response?.help?.url {
        self.helpURL = helpURL
      }
    }
  }
}
