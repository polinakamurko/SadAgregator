//
//  MasterViewModel.swift
//  SadAgregator
//
//  Created by Yura Istomin on 22.10.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class MasterViewModel: ObservableObject {

  @Published var currentStep = GetStep()
  
  func fetchMaster() {
    
    DefaultAPI.agrAssistGetStepGet(aKey: userKey, aStep: "") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let currentStep = response {
        self.currentStep = currentStep
      }
    }
  }

}
