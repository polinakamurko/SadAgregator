//
//  MainViewModel.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class MainViewModel: ObservableObject {
  
  @Published var searchQuery = "" {
    didSet {
      currentPage = 0
      searchPosts = []
      fetchData()
    }
  }
  
  @Published var inSearchMode = false
  @Published var showActivity = false
  
  @Published var activityText = ""
  @Published var totalActivity = TotalActivity()
  
  @Published private(set) var topLines = [TopLine]()
  @Published private(set) var topSpots = [TopSpot]()
  
  @Published private(set) var posts = [Post]()
  @Published private(set) var searchPosts = [Post]()
  
  var currentPage = 0
  
  func fetchData() {
    if inSearchMode == false {
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
    } else {
      DefaultAPI.agrSrchGetSearchPageGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aQuery: searchQuery, aPage: "\(currentPage)")  { (result, error) in
        if error != nil {
          return
        }
        
        if let posts = result?.posts {
          print("Search query: \(self.searchQuery)\nCurrent page: \(self.currentPage)\nPosts: \(posts)")
          self.searchPosts.append(contentsOf: posts)
        }
      }
    }
  }
  
  func loadNextPage() {
    currentPage += 1
    
    if inSearchMode == false {
      DefaultAPI.agrIntfMainPagingGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aPage: "\(currentPage)") { result, error in
        if error != nil {
          print(error!)
          return
        }
        
        if let posts = result?.posts {
          self.posts.append(contentsOf: posts)
        }
      }
    } else {
      DefaultAPI.agrSrchGetSearchPageGet(aKey: "QGFxjSgglyMSDxQhEYmdPJJ103618788", aQuery: searchQuery, aPage: "\(currentPage)")  { (result, error) in
        if error != nil {
          return
        }
        
        if let posts = result?.posts {
          print("Search query: \(self.searchQuery)\nCurrent page: \(self.currentPage)\nPosts: \(posts)")
          self.searchPosts.append(contentsOf: posts)
        }
      }
    }
    
  }
}
