//
//  MainViewModel.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var searchQuery = ""
  @Published var showCancelButton = false
  @Published var showActivity = false
  
  @Published private(set) var posts = [Post]()
  
  func fetchData() {
    DefaultAPI.agrIntfMainGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788") { (mainPageData, error) in
      if let error = error {
        print(error)
        return
      }
      
      self.posts = mainPageData?.posts ?? []
    }
  }
}
