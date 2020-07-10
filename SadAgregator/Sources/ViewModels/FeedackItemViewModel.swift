//
//  FeedackItemViewModel.swift
//  SadAgregator
//
//  Created by Полина on 06.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class FeedbackViewModel: ObservableObject {
    
  @Published var feedback = [Reviews]()
  
  let providerID: String
  
  private var currentPage = 0
  
  init(providerID: String) {
    self.providerID = providerID
  }
  
  func fetchFeedback() {
    currentPage += 1
    
    DefaultAPI.agrIntfGetVendRevsPagingGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aVendorID: providerID, aPage: "\(currentPage)") { response, error in
      if error != nil {
        print(error!)
        return
      }
      if let feedback = response?.revs {
        self.feedback.append(contentsOf: feedback)
      }
    }
  }
}
