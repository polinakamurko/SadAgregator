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
      Text("Что именно Вы хотите сделать?")
        .font(.title)
        .fontWeight(.bold)
      Text("Выберите дальнейшее действие")
        .font(.headline)
      
      Button(action: {}) {
        VStack(alignment: .leading) {
          Text("Изменить настройки парсера")
            .font(.system(size: 17, weight: .semibold))
          Text("Настройки парсера будут изменены в соответствии с вашими требованиями.")
            .font(.system(size: 15))
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .foregroundColor(.blue)
        )
      }
      
      Button(action: {}) {
        VStack(alignment: .leading) {
          Text("Приостановить выгрузку")
            .font(.system(size: 17, weight: .semibold))
          Text("Выгрузка будет приостановлена.")
            .font(.system(size: 15))
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .foregroundColor(.blue)
        )
      }
    }
    .padding()
  }
}


struct MasterChoiceView_Previews: PreviewProvider {
  static var previews: some View {
    MasterChoiceView()
  }
}
