//
//  UploadItemView.swift
//  SadAgregator
//
//  Created by Полина on 16.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct UploadItemView: View {
  
  var title: String
  var isVk: Bool
  
  @State private var showChooseButton = false
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        
        Button(action: {
          self.showChooseButton.toggle()
        }) {
          HStack {
            Image(isVk ? "vk_icon" : "ok_icon")
              .renderingMode(.template)
            Text(title)
              .font(showChooseButton ? Font.body.weight(.bold) : Font.body)
          }
        }
        Spacer()
        
        if showChooseButton == true {
          Button(action: {
            
          }) {
            Text("Выбрать")
              .font(.system(size: 12, weight: .regular))
              .foregroundColor(.white)
              .frame(width: 52)
              .padding(.horizontal)
              .padding(.vertical, 4)
              .background(Color.blue)
              .cornerRadius(12)
          }
        }
      }
      .font(.system(size: 17, weight: .regular))
      .foregroundColor(isVk ? Color(red: 64/255, green: 137/255, blue: 222/255) : Color(red: 237/255, green: 129/255, blue: 43/255))
      Divider()
    }
  }
}

struct UploadItemView_Previews: PreviewProvider {
  static var previews: some View {
    UploadItemView(title: "Название группы", isVk: true)
  }
}
