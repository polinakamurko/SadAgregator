//
//  FeedbackDetailView.swift
//  SadAgregator
//
//  Created by Полина on 03.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct FeedbackDetailView: View {
  var body: some View {
    List {
      FeedbackItemView()
      FeedbackItemView()
      FeedbackItemView()
    }
  }
}

struct FeedbackDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FeedbackDetailView()
  }
}
