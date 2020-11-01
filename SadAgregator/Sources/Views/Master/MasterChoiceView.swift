//
//  MasterChoiceView.swift
//  SadAgregator
//
//  Created by Полина on 04.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterChoiceView: View {
  
  @ObservedObject var step: GetStep
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      
      if step.type == "simple_req" {
        ForEach(step.answers, id: \.answerId) { answer in
          Button(action: {}) {
            VStack(alignment: .leading, spacing: 6) {
              Text(answer.capt ?? "")
                .font(.system(size: 17, weight: .semibold))
              Text(answer.hint ?? "")
                .font(.system(size: 15))
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color(.darkGray))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 10)
                .foregroundColor((Color(.systemGray6)))
            )
          }
        }
      }
    }
  }
}
