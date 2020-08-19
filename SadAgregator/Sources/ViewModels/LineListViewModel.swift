//
//  LineListViewModel.swift
//  SadAgregator
//
//  Created by Полина on 23.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class LineListViewModel: ObservableObject {
  
  @Published var topLines = [TopLine]()
    
  private var currentPage = 0
  
  func fetchPage() {
    currentPage += 1
    DefaultAPI.agrIntfTopLinesGet(aKey: userKey) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      self.topLines.append(contentsOf: response?.linesActTop ?? [])
    }
  }
}
