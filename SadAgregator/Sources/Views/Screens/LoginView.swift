//
//  LoginView.swift
//  SadAgregator
//
//  Created by Yura Istomin on 01.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  
  @State private var email = ""
  @State private var password = ""
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(spacing: 0) {
        Text("Агрегатор поставщиков рынка Садовод")
          .font(.headline)
          .padding(.vertical)
        
        VStack {
          Button(action: {}) {
            HStack {
              Image("vk_icon")
                .renderingMode(.template)
              Text("Войти через ВКонтакте")
                .fontWeight(.semibold)
            }
            .foregroundColor(.blue)
          }
          
          Button(action: {}) {
            HStack {
              Image("ok_icon")
                .renderingMode(.template)
              Text("Войти через Одноклассники")
                .fontWeight(.semibold)
            }
            .foregroundColor(.orange)
          }
        }
        .padding()
        
        HStack {
          Rectangle()
            .frame(height: 1)
            .padding(.horizontal)
          
          Text("или")
          
          Rectangle()
            .frame(height: 1)
            .padding(.horizontal)
        }
        .foregroundColor(Color(.systemGray3))
        .padding(.vertical)
        
        VStack {
          Text("Войти в аккаунт TK-SAD")
            .font(.headline)
            .padding(.vertical)
          
          TextField("Email", text: $email)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
          
          TextField("Пароль", text: $password)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
          
          Button(action: {}) {
            Text("Войти")
          }
          .buttonStyle(BorderedButtonStyle(color: .blue))
          .padding(.vertical)
          
          Divider()
          
          Button(action: {}) {
            Text("Забыли пароль")
          }
          .padding(8)
        }
        .padding()
        
        Spacer()
        
        Divider()
        
        HStack {
          Text("Нет аккаунта?")
          
          Button(action: {}) {
            Text("Зарегистрироваться")
          }
        }
        .padding()
      }
    }
    .navigationBarTitle("", displayMode: .inline)
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
