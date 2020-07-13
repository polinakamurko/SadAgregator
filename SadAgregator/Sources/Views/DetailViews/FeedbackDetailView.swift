//
//  FeedbackDetailView.swift
//  SadAgregator
//
//  Created by Полина on 03.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct FeedbackDetailView: View {
  
  @ObservedObject var viewModel: FeedbackViewModel
  
  var body: some View {
    List(viewModel.feedback) { feedbackItem in
      FeedbackItemView(feedback: feedbackItem)
    }
    .onAppear(perform: viewModel.fetchFeedback)
  }
}

struct FeedbackDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FeedbackDetailView(viewModel: FeedbackViewModel(providerID: "3"))
  }
}
