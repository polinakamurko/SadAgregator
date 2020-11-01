//
//  MasterTextView.swift
//  SadAgregator
//
//  Created by Полина on 09.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterTextView: View {
  
  @ObservedObject var currentInput: SetInputValue
  @State var surchargeTitle = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      ForEach(currentInput.newInput, id: \.placeHolder) { input in
        TextField(input.placeHolder ?? "", text: self.$surchargeTitle)
          .padding()
          .frame(maxWidth: .infinity)
          .background((Color(.systemGray6)))
          .cornerRadius(10)
      }
      HStack() {
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("Передумала")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
          }
          .frame(maxWidth: .infinity)
          .frame(height: 44)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .foregroundColor(.blue)
          )
        }
        
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("Готово")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.blue)
          }
          .frame(maxWidth: .infinity)
          .frame(height: 44)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .foregroundColor(Color(.systemGray6))
          )
        }
      }
      .frame(maxWidth: .infinity, alignment: .center)
      
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
        NavigationLink(destination: MasterListView()) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("ПРОДОЛЖИТЬ")
            }
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)
          }
          .frame(width: 160, height: 36)
          .background(
            RoundedRectangle(cornerRadius: 17)
              .foregroundColor(.blue)
          )
        }
      }
      .frame(maxWidth: .infinity, alignment: .center)
    }
    .frame(maxHeight: .infinity)
    .padding()
  }
}
