//
//  LineViewModel.swift
//  SadAgregator
//
//  Created by Полина on 29.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class LineViewModel: ObservableObject {
  
  @Published var line = Line()
  let lineID: String
  init(lineID: String) {
    self.lineID = lineID
  }
  
  func fetchLine() {
    DefaultAPI.agrIntfActivityLineGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aLineID: lineID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let unwrapped = response {
        self.line = unwrapped
      }
    }
  }
}
