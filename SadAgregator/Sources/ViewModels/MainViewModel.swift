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
  
  @Published var activityText = ""
  @Published var totalActivity = TotalActivity()
  
  @Published private(set) var topLines = [TopLine]()
  @Published private(set) var topSpots = [TopSpot]()
  
  @Published private(set) var posts = [Post]()
  
  var currentPage = 0
  
  func fetchData() {
    DefaultAPI.agrIntfMainGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788") { (result, error) in
      if error != nil {
        return
      }
      
      self.currentPage = 1
      self.activityText = result?.activity ?? ""
      
      self.topLines = result?.linesActTop ?? []
      self.topSpots = result?.pointsTop ?? []
      self.posts = result?.posts ?? []
      
      if let totalActivity = result?.totalActivity {
        self.totalActivity = totalActivity
      }
    }
  }
  
  func loadNextPage() {
    currentPage += 1
    
    DefaultAPI.agrIntfMainPagingGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aPage: "\(currentPage)") { result, error in
      if error != nil {
        print(error!)
        return
      }
      
      if let posts = result?.posts {
        self.posts.append(contentsOf: posts)
      }
    }
  }
}
