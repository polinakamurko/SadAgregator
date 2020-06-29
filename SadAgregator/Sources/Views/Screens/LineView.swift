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
    VStack{
      HStack {
        HStack {
          Image(systemName: "arrow.left.circle.fill")
            .font(.headline)
          Text(viewModel.line.arrows?.namePrev ?? "")
        }
        Spacer()
        HStack {
          Text(viewModel.line.arrows?.nameNext ?? "")
          Image(systemName: "arrow.right.circle.fill")
            .font(.headline)
        }
      }
      .padding()
      .font(.subheadline)
      .foregroundColor(.blue)
      
      List {
        HStack {
          VStack(alignment: .leading, spacing: 12) {
            Text(" ")
            HStack {
              Image(systemName: "rectangle.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Посты")
                .fixedSize(horizontal: true, vertical: false)
            }
            HStack {
              Image(systemName: "photo.fill.on.rectangle.fill")
                .foregroundColor(Color(UIColor.systemGray3))
              Text("Фото")
            }
          }
          Spacer()
          VStack(spacing: 12) {
            Text("Сегодня")
              .foregroundColor(.gray)
            Text("31")
            Text("102")
          }
          .font(.system(size: 17, weight: .bold))
          Spacer()
          VStack(spacing: 12) {
            Text("Вчера")
              .foregroundColor(.gray)
            Text("27")
            Text("59")
          }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background((Color(red: 248/255, green: 248/255, blue: 249/255)))
        .listRowInsets(EdgeInsets())
        
        Section {
          SectionTitleView("Активность точек", showAllView: SpotListView(viewModel: SpotListViewModel()))
          ForEach(0..<viewModel.line.topSpots.count, id: \.self) { index in
            NavigationLink(destination: SpotView()) {
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
          
//          ForEach(0..<4, id: \.self) { _ in
//            PostItemView()
//              .listRowInsets(EdgeInsets())
//          }
        }
      }
    }
    .onAppear(perform: viewModel.fetchLine)
  }
}


struct LineView_Previews: PreviewProvider {
  static var previews: some View {
    LineView(viewModel: LineViewModel(lineID: "1"))
  }
}

