//
//  FavoriteProvidersView.swift
//  SadAgregator
//
//  Created by Полина on 30.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct FavoriteProvidersView: View {
  
  @ObservedObject var viewModel: FavoriteProviderViewModel
  
  var body: some View {
    VStack {
      List {
        ForEach(viewModel.favoriteProviders) { provider in
          NavigationLink(destination: ProviderView(viewModel: ProviderViewModel(providerID: "\(provider.id)"))) {
            ProviderItemView(provider: provider)
              .padding(.vertical, 8)
            .onAppear {
              if self.viewModel.favoriteProviders.isLastItem(provider) {
                self.viewModel.fetchPage()
              }
            }
          }
        }
      }
      .onAppear(perform: viewModel.fetchFavoriteProviders)
    }
  }
}

struct FavoriteProvidersView_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteProvidersView(viewModel: FavoriteProviderViewModel())
  }
}
