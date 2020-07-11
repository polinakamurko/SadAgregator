//
//  PopularProviderItemView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 13.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct PopularProviderItemView: View {
  
  let index: Int
  let provider: ProviderItem
  
  var body: some View {
      VStack {
        HStack {
          
          Text("\(index)")
            .font(.system(size: 11, weight: .semibold, design: .rounded))
            .foregroundColor(.blue)
            .frame(width: 18, height: 18)
            .background(Color(UIColor.systemGray5))
            .cornerRadius(9)
          
          // Username
          VStack(alignment: .leading, spacing: 5) {
            Text(provider.capt ?? "")
              .bold()
            
            Button(action: {}) {
              HStack(spacing: 0) {
                Group {
                  Text(provider.name?.capitalized ?? "")
                    .padding(.trailing, 5)
                  
                  Image(systemName: "chevron.right")
                }
                .font(.system(size: 15))
                .foregroundColor(Color(UIColor.systemGray2))
              }
            }
          }
          
          Spacer()
          
          // Rating
//          VStack(alignment: .trailing, spacing: 5) {
//            HStack(spacing: 0) {
//              Group {
//                Text("3.5")
//                  .padding(.trailing, 4)
//                ForEach(0..<5) { _ in
//                  Image(systemName: "star.fill")
//                    .padding(.horizontal, 2)
//                }
//              }
//
//  .font(.system(size: 15, weight: .semibold))
//              .foregroundColor(Color(UIColor.systemGray2))
//            }
//
//            HStack(spacing: 0) {
//              Group {
//                Image(systemName: "star.fill")
//                  .padding(.trailing, 4)
//
//                Text("183 оценки")
//                  .padding(.trailing, 8)
//
//                Image(systemName: "photo.fill.on.rectangle.fill")
//                  .padding(.trailing, 4)
//
//                Text("13 фото")
//              }
//              .font(.system(size: 10))
//              .foregroundColor(Color(UIColor.systemGray2))
//            }
//          }
        }
        
        // Statistics
        VStack(spacing: 8) {
          Group {
            Text("Цена до \(provider.prices ?? ""), \(provider.pricesAvg ?? "")")
              .foregroundColor(.green)
              .frame(height: 34)
              .frame(maxWidth: .infinity)
              .background(Color(red: 239/255, green: 249/255, blue: 236/255))
            
            Text("Охват \(provider.popularity ?? "") чел/сутки")
              .foregroundColor(.blue)
              .frame(height: 34)
              .frame(maxWidth: .infinity)
              .background(Color(red: 226/255, green: 241/255, blue: 255/255))
          }
          .font(.system(size: 15, weight: .medium))
          .cornerRadius(10)
          
          Text(provider.dt ?? "")
            .font(.system(size: 15))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .foregroundColor(Color(UIColor.systemGray2))
        }
      }
  }
}

struct PopularProviderItemView_Previews: PreviewProvider {
  static var previews: some View {
    PopularProviderItemView(index: 1, provider: ProviderItem(name: "Азиз"))
  }
}
