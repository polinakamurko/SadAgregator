//
//  HashtagSearchViewModel.swift
//  SadAgregator
//
//  Created by Yura Istomin on 23.10.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

class HashtagSearchViewModel: ObservableObject {
  
  @Published var foundPosts = [Post]()
  
  private var currentPage = 0

  
}
