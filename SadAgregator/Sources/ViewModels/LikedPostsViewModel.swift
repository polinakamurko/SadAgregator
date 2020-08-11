//
//  LikedPostsViewModel.swift
//  SadAgregator
//
//  Created by Полина on 10.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class LikedPostsViewModel: ObservableObject {
  
  @Published var likedPosts = [Post]()
  
  private var currentPage = 0
  
  func fetchLikedPosts() {
    
    currentPage = 1
    likedPosts = []
    
    DefaultAPI.agrClientMyPostsGet(aKey: userKey, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
       if let posts = response?.posts {
             self.likedPosts.append(contentsOf: posts)
           }
    }
  }
  
  func fetchPage() {
    
    currentPage += 1
    
    DefaultAPI.agrClientMyPostsGet(aKey: userKey, aPage: "\(currentPage)"){ (response, error) in
      if error != nil {
        print(error!)
        return
      }
      
      if let posts = response?.posts {
        self.likedPosts.append(contentsOf: posts)
      }
    }
  }
}
