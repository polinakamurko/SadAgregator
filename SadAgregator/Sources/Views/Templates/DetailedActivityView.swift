//
//  DetailedActivityView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 21.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct DetailedActivityView: View {
  
  @Binding var totalActivity: TotalActivity
  
  var body: some View {
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
        Text(totalActivity.postsToday ?? "")
        Text(totalActivity.photosToday ?? "")
      }
      .font(.system(size: 17, weight: .bold))
      Spacer()
      VStack(spacing: 12) {
        Text("Вчера")
          .foregroundColor(.gray)
        Text(totalActivity.postsYesterday ?? "")
        Text(totalActivity.photosYesterday ?? "")
      }
    }
  }
}


struct DetailedActivityView_Previews: PreviewProvider {
  static var previews: some View {
    DetailedActivityView(totalActivity: .constant(TotalActivity(postsToday: "10",
                                                                postsYesterday: "15",
                                                                photosToday: "30",
                                                                photosYesterday: "45")))
  }
}
