//
//  SpotView.swift
//  SadAgregator
//
//  Created by Полина on 23.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct SpotView: View {
  
  @ObservedObject var viewModel: SpotViewModel
  
  var body: some View {
    VStack {
      HStack {
        if viewModel.spot.arrows?.idPrev != nil {
          NavigationLink(destination: SpotView(viewModel: SpotViewModel(spotID: viewModel.spot.arrows?.idPrev ?? ""))) {
            HStack {
              Image(systemName: "arrow.left.circle.fill")
                .font(.headline)
              Text(viewModel.spot.arrows?.namePrev ?? "")
            }
          }
        }
        Spacer()
        if viewModel.spot.arrows?.idNext != nil {
          NavigationLink(destination: SpotView(viewModel: SpotViewModel(spotID: viewModel.spot.arrows!.idNext ?? ""))) {
            HStack {
              Text(viewModel.spot.arrows?.nameNext ?? "")
              Image(systemName: "arrow.right.circle.fill")
                .font(.headline)
            }
          }
        }
      }
      .padding()
      .font(.subheadline)
      .foregroundColor(.blue)
      
      List {
        DetailedActivityView(totalActivity: $viewModel.totalActivity)
          .frame(maxWidth: .infinity)
          .padding()
          .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
          .listRowInsets(EdgeInsets())
        
        if !(viewModel.spot.altertText ?? "").isEmpty {
          HStack {
            Image(systemName: "exclamationmark.triangle")
              .font(.system(size: 30))
              .foregroundColor(Color(.systemRed))
            
            Text(viewModel.spot.altertText!)
              .font(.system(size: 13))
              .multilineTextAlignment(.leading)
              .frame(maxWidth: .infinity, alignment: .leading)
              .padding(.leading, 8)
          }
          .padding(.horizontal)
          .listRowInsets(EdgeInsets())
        }
        
        HStack {
          Text("Арендаторы")
            .font(.system(size: 22, weight: .bold))
            .multilineTextAlignment(.leading)
          Spacer()
        }
        
        ForEach(viewModel.providers) { provider in
          NavigationLink(destination: ProviderView(viewModel: ProviderViewModel(providerID: "\(provider.id)"))) {
            ProviderItemView(provider: provider)
            
          }
          .listRowInsets(EdgeInsets())
        }
        
        Section {
          SectionTitleView<Text>("Последние посты")
          
          ForEach(viewModel.posts) { post in
            PostItemView(post: post)
              .listRowInsets(EdgeInsets())
              .onAppear {
                if self.viewModel.posts.isLastItem(post) {
                  self.viewModel.loadNextPage()
                }
            }
          }
        }
      }
      .onAppear(perform: viewModel.fetchSpot)
    }
  }
}

struct SpotView_Previews: PreviewProvider {
  static var previews: some View {
    SpotView(viewModel: SpotViewModel(spotID: "1"))
  }
}
