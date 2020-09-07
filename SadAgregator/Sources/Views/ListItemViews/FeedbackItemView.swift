//
//  FeedbackItemView.swift
//  SadAgregator
//
//  Created by Полина on 06.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct FeedbackItemView: View {
  
  let feedback: Reviews
  
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .leading, spacing: 6) {
          if feedback.title != "" {
            Text(feedback.title ?? "")
              .padding(.top)
              .font(.system(size: 15, weight: .semibold))
          }
          HStack(spacing: 0) {
            Group {
              if feedback.rate != nil {
                HStack(spacing: 0) {
                  Group {
                    ForEach(0..<(feedback.filledStars )) { _ in
                      Image(systemName: "star.fill")
                        .padding(.horizontal, 2)
                    }
                    
                    if (feedback.hasHalfStart ) {
                      Image(systemName: "star.lefthalf.fill")
                        .padding(.horizontal, 2)
                    }
                    
                    ForEach(0..<(feedback.emptyStars )) { _ in
                      Image(systemName: "star")
                        .padding(.horizontal, 2)
                    }
                  }
                }
              }
            }
            .padding(.horizontal, 1.5)
            //            .padding(.bottom, 6)
          }
          .font(.system(size: 11))
          .foregroundColor(Color(red: 255/255, green: 204/255, blue: 71/255))
        }
        Spacer()
        VStack(alignment: .trailing, spacing: 0) {
          Text(feedback.dt ?? "")
          Text(feedback.author?.capitalized ?? "")
        }
        .font(.caption)
        .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
      }
      
      Text(feedback.text ?? "")
        .font(.system(size: 15))
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .multilineTextAlignment(.leading)
      
      FeedbackPhotoGalleryView(imageUrlStrings: feedback.imageUrls)
      
      Spacer()
      
      Text("Показать полностью")
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(.blue)
        .padding(.vertical, 8)
      
      Divider()
    }
  }
}

struct FeedbackItemView_Previews: PreviewProvider {
  static var previews: some View {
    FeedbackItemView(feedback: Reviews())
  }
}
