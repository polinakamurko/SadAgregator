//
//  MasterTextView.swift
//  SadAgregator
//
//  Created by Полина on 09.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterTextView: View {
  
  @State var surchargeTitle = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Spacer()
      Text("Укажите % наценки на товар")
        .font(.title)
        .fontWeight(.bold)
      Text("Например, 5%")
        .font(.headline)
        .foregroundColor(Color(.lightGray))
      
      TextField("Введите % наценки", text: $surchargeTitle)
        .padding()
        .frame(maxWidth: .infinity)
        .background((Color(.systemGray6)))
        .cornerRadius(10)
      
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
        
        Button(action: {}) {
          VStack(alignment: .leading, spacing: 6) {
            HStack {
              Text("ГОТОВО")
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

struct MasterTextView_Previews: PreviewProvider {
  static var previews: some View {
    MasterTextView()
  }
}
