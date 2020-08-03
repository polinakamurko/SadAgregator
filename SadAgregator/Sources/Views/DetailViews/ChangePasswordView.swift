//
//  ChangePasswordView.swift
//  SadAgregator
//
//  Created by Полина on 20.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ChangePasswordView: View {
  
  @State var oldPassword = ""
  @State var newPassword = ""
  
  var body: some View {
    VStack {
      HStack {
        TextField("Старый пароль", text: $oldPassword)
      }
      .padding(.top, 50)
      Divider()
      HStack {
        TextField("Новый пароль", text: $newPassword)
      }
      .padding(.top, 50)
      Divider()
      HStack {
        TextField("Повторите пароль", text: $newPassword)
      }
      .padding(.top, 50)
      Divider()
      
      Text("Изменить пароль")
      .frame(maxWidth: .infinity)
      .font(.system(size: 17, weight: .medium))
      .foregroundColor(.blue)
        .padding(.top, 20)
      .padding(.vertical, 8)
      
      Spacer()
    }
    .padding()
  }
}

struct ChangePasswordView_Previews: PreviewProvider {
  static var previews: some View {
    ChangePasswordView()
  }
}
