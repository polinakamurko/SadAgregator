//
//  MainView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      VStack {
        ScrollView(.vertical) {
          HStack {
            Text("Активность линий")
              .font(.system(size: 22, weight: .bold))
            
            Spacer()
            
            Button(action: {}) {
              HStack {
                Text("См. все")
                Image(systemName: "chevron.right")
              }
              .font(.system(size: 15))
            }
          }
          
          Group {
            ActivityItemView()
            ActivityItemView()
            ActivityItemView()
          }
          
          HStack {
            Text("Активность поставщиков")
              .font(.system(size: 22, weight: .bold))
            
            Spacer()
            
            Button(action: {}) {
              HStack {
                Text("См. все")
                Image(systemName: "chevron.right")
              }
              .font(.system(size: 15))
            }
          }
          
          Group {
            ActivityItemView()
            ActivityItemView()
            ActivityItemView()
          }
          
          Text("Последние посты")
            .font(.system(size: 22, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
          
          Spacer()
        }
        .padding(.top)
        .padding(.horizontal)
      }
      .navigationBarTitle("Главная", displayMode: .inline)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
