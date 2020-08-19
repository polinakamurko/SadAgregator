//
//  FavoriteProvidersView.swift
//  SadAgregator
//
//  Created by Полина on 30.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LikedPostsView: View {
  
  @ObservedObject var viewModel: LikedPostsViewModel
  
  var body: some View {
    VStack {
      List {
        ForEach(viewModel.likedPosts) { post in
            PostItemView(post: post)
              .padding(.vertical, 8)
              .listRowInsets(EdgeInsets())
            .onAppear {
              if self.viewModel.likedPosts.isLastItem(post) {
                self.viewModel.fetchPage()
              }
            }
          
        }
      }
      .onAppear(perform: viewModel.fetchLikedPosts)
    }
    .navigationBarTitle(Text("Избранные посты"), displayMode: .inline)
  }
}

struct LikedPostsView_Previews: PreviewProvider {
  static var previews: some View {
    LikedPostsView(viewModel: LikedPostsViewModel())
  }
}

