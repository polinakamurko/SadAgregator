//
//  MasterChoiceView.swift
//  SadAgregator
//
//  Created by Полина on 04.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterChoiceView: View {
  
  @ObservedObject var viewModel: MasterViewModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Spacer()
      Text(viewModel.currentStep.capt ?? "")
        .font(.title)
        .fontWeight(.bold)
      Text(viewModel.currentStep.hint ?? "")
        .font(.headline)
      
      if viewModel.currentStep.type == "simple_req" {
        ForEach(viewModel.currentStep.answers, id: \.answerId) { answer in
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
      Spacer()
      Text("На этом шаге вы настраиваете")
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top)
      HStack() {
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Image(systemName: "arrow.left")
              Text("НАЗАД")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.blue)
          }
          .frame(width: 160, height: 36)
          .background(
            RoundedRectangle(cornerRadius: 17)
              .stroke(lineWidth: 2)
              .foregroundColor(.blue)
          )
        }
        
        NavigationLink(destination: MasterTextView()) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("ПРОДОЛЖИТЬ")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
          }
        }
        .frame(width: 160, height: 36)
        .background(
          RoundedRectangle(cornerRadius: 17)
            .foregroundColor(.blue)
        )
      }
      .frame(maxWidth: .infinity, alignment: .center)
    }
    .onAppear(perform: viewModel.fetchMaster)
    .frame(maxHeight: .infinity)
    .padding()
  }
}



struct MasterChoiceView_Previews: PreviewProvider {
  static var previews: some View {
    MasterChoiceView(viewModel: MasterViewModel())
  }
}
