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
        HStack {
          Image(systemName: "arrow.left.circle.fill")
            .font(.headline)
          Text(viewModel.spot.arrows?.namePrev ?? "")
        }
        Spacer()
        HStack {
          Text(viewModel.spot.arrows?.nameNext ?? "")
          Image(systemName: "arrow.right.circle.fill")
            .font(.headline)
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
        
        HStack {
          Image(systemName: "exclamationmark.triangle")
            .font(.system(size: 30))
            .foregroundColor(Color(.systemRed))
          
          Text("Обращаем Ваше внимание, что по данному поставщику мы не предоставляем услуги выкупа")
            .font(.system(size: 13))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
        }
        .padding(.horizontal)
        .listRowInsets(EdgeInsets())
        
        HStack {
          Text("Арендаторы")
            .font(.system(size: 22, weight: .bold))
          Spacer()
        }
        
        ForEach(viewModel.providers) { provider in
          ProviderItemView(provider: provider)
            .listRowInsets(EdgeInsets())
        }
        
        ActivityItemView(number: 1, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        ActivityItemView(number: 2, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        
        ActivityItemView(number: 3, title: "Линия 30", subtitle: "17 мин. назад", disclosureText: "1436")
        //          PostItemView()
        //          PostItemView()
        //          PostItemView()
        //          PostItemView()
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
