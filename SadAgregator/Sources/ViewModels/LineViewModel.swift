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
  @Published var totalActivity = TotalActivity()
  @Published var posts = [Post]()
  
  let lineID: String
  init(lineID: String) {
    self.lineID = lineID
  }
  
  private var currentPage = 0
  
  func fetchLine() {
    DefaultAPI.agrIntfActivityLineGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aLineID: lineID) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let line = response {
        self.line = line
        self.posts = line.posts ?? []
        self.totalActivity = line.activity ?? TotalActivity()
      }
    }
  }
  
  func loadNextPage() {
    
    currentPage += 1
    
    DefaultAPI.agrIntfLinePostsPagingGet(aKey: userKey, aLineID: lineID, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let posts = response?.posts {
        self.posts.append(contentsOf: posts)
      }
    }
  }
}
