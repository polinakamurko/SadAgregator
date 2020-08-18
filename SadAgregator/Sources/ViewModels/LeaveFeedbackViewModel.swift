//
//  LeaveFeedbackViewModel.swift
//  SadAgregator
//
//  Created by Полина on 18.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class LeaveFeedbackViewModel: ObservableObject {
  
  @Published var rate = 0 
  
  @Published var feedbackTitle = ""
  @Published var feedbackText = ""
  
  let providerID: String
  
  init(providerID: String) {
    self.providerID = providerID
  }
  
  func updateFeedback() {
    DefaultAPI.agrIntfReviewUpdateGet(aKey: userKey, avendID: providerID, aRating: "\(rate)", aTitle: feedbackTitle, aText: feedbackText, aImages: "")  { (response, error) in
      if error != nil {
        print(error!)
        return
      }
    }
  }
}
