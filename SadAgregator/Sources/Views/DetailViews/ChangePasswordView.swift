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
      TextView(text: $oldPassword)
        .padding(.horizontal)
        .frame(height: 196)
      Divider()
      
      TextView(text: $newPassword)
        .padding(.horizontal)
        .frame(height: 196)
      Divider()
      
      TextView(text: $newPassword)
        .padding(.horizontal)
        .frame(height: 196)
      Divider()
      
      
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
