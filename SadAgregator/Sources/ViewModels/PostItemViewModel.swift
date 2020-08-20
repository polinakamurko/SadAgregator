//
//  File.swift
//  SadAgregator
//
//  Created by Полина on 20.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class PostItemViewModel: ObservableObject {
  @Published var showPostDescription: Bool = false
  @Published var showUploadView: Bool = false
  @Published var showEditTextView: Bool = false
  @Published var postIsLiked: Bool
  
  
  @Published var post: Post
  
  init(post: Post) {
    self.post = post
    self.postIsLiked = post.isLiked
  }
  
  func likePost() {
    
    postIsLiked.toggle()
    
    let newStatus = postIsLiked ? "1" : "0"
    post.like = newStatus
    
    DefaultAPI.agrUtilsPostLikeGet(aKey: userKey, aPostID: post.id, aStatus: newStatus) { (response, error) in
      if error != nil {
        print(error!)
        return
      }
    }
  }
}
