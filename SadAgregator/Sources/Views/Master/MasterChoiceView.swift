//
//  MasterChoiceView.swift
//  SadAgregator
//
//  Created by Полина on 04.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct MasterChoiceView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Spacer()
      Text("Что именно Вы хотите сделать?")
        .font(.title)
        .fontWeight(.bold)
      Text("Выберите дальнейшее действие")
        .font(.headline)
      
      Button(action: {}) {
        VStack(alignment: .leading, spacing: 6) {
          Text("Изменить настройки парсера")
            .font(.system(size: 17, weight: .semibold))
          Text("Настройки парсера будут изменены в соответствии с вашими требованиями.")
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
      
      Button(action: {}) {
        VStack(alignment: .leading, spacing: 6) {
          Text("Приостановить выгрузку")
            .font(.system(size: 17, weight: .semibold))
          Text("Выгрузка будет приостановлена.")
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
    .frame(maxHeight: .infinity)
    .padding()
  }
}



struct MasterChoiceView_Previews: PreviewProvider {
  static var previews: some View {
    MasterChoiceView()
  }
}
