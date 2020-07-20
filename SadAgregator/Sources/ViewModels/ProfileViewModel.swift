//
//  ProfileViewModel.swift
//  SadAgregator
//
//  Created by Полина on 15.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
  
  @Published var user: UserProfile?
  
  func fetchProfile() {
    DefaultAPI.agrClientGetProfileGet(aKey:  "VOHCXiRrkonTQNIIFyRlVQL108838058") { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let user = response?.user {
        self.user = user
      }
    }
  }
}
