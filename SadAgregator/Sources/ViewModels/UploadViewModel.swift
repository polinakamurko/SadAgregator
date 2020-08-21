//
//  UploadViewModel.swift
//  SadAgregator
//
//  Created by Полина on 21.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class UploadViewModel: ObservableObject {
  
  @Published var groups = [Peers]()
  
  func getUploadGroups() {
    DefaultAPI.agrIntfExportPeersGet(aKey: userKey) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      self.groups = response?.peers ?? []
    }
  }
}
