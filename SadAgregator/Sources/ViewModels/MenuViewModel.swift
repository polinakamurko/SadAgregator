//
//  MenuViewModel.swift
//  SadAgregator
//
//  Created by Полина on 05.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
  
  @Published var menuContent = UserKey()
  
  func fetchMenu() {
    DefaultAPI.agrClientCheckKeysGet(aKey: userKey){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let menuContent = response {
        self.menuContent = menuContent
      }
    }
  }
}
