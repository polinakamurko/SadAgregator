//
//  LineView.swift
//  SadAgregator
//
//  Created by Полина on 23.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LineView: View {
  
  @ObservedObject var viewModel: LineViewModel
  
  var body: some View {
    VStack {
      HStack {
        if viewModel.line.arrows?.idPrev != nil {
          NavigationLink(destination: LineView(viewModel: LineViewModel(lineID: viewModel.line.arrows?.idPrev ?? ""))) {
            HStack {
              Image(systemName: "arrow.left.circle.fill")
                .font(.headline)
              Text(viewModel.line.arrows?.namePrev ?? "")
            }
          }
        }
        Spacer()
        if viewModel.line.arrows?.idNext != nil {
          NavigationLink(destination: LineView(viewModel: LineViewModel(lineID: viewModel.line.arrows?.idNext ?? ""))) {
            HStack {
              Text(viewModel.line.arrows?.nameNext ?? "")
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
        
        Section {
          SectionTitleView("Активность точек", showAllView: SpotListView(viewModel: SpotListViewModel(lineId: viewModel.lineID)))
          ForEach(0..<viewModel.line.topSpots.count, id: \.self) { index in
            NavigationLink(destination: SpotView(viewModel: SpotViewModel(spotID: self.viewModel.line.topSpots[index].pointId!))) {
              ActivityItemView(
                number: index + 1,
                title: self.viewModel.line.topSpots[index].capt!,
                subtitle: self.viewModel.line.topSpots[index].lastAct!,
                disclosureText: self.viewModel.line.topSpots[index].posts!
              )
            }
          }
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
    }
    .navigationBarTitle(viewModel.line.capt ?? "")
    .onAppear(perform: viewModel.fetchLine)
  }
}


struct LineView_Previews: PreviewProvider {
  static var previews: some View {
    LineView(viewModel: LineViewModel(lineID: "1"))
  }
}

