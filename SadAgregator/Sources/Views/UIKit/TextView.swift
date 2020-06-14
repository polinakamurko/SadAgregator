//
//  TextView.swift
//  SadAgregator
//
//  Created by Полина on 03.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
  
  @Binding var text: String
  
  func makeUIView(context: Context) -> UITextView {
    let textView = UITextView()
    textView.isScrollEnabled = true
    textView.isEditable = true
    textView.isUserInteractionEnabled = true
    return textView
  }
  
  func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = text
  }
  
}
