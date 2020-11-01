//
//  MasterView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 25.10.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterView: View {
  
  @ObservedObject var viewModel: MasterViewModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Spacer()
      Text(viewModel.currentStep.capt ?? "")
        .font(.title)
        .fontWeight(.bold)
      Text(viewModel.currentStep.hint ?? "")
        .font(.headline)
        .foregroundColor(Color(.lightGray))
      
      if viewModel.currentStep.type == "simple_req" {
        MasterChoiceView(step: viewModel.currentStep)
      } else if viewModel.currentStep.type == "input_val" {
        MasterTextView(currentInput: SetInputValue())
      } else if viewModel.currentStep.type == "list_select" {
        MasterListView()
      }
      
      Spacer()
      Text(viewModel.currentStep.descr ?? "")
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.top)
      HStack() {
        
        if viewModel.currentStep.backStepId != nil {
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
        }
        
        NavigationLink(destination: MasterTextView(currentInput: SetInputValue())) {
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
