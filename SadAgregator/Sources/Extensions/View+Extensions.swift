//
//  View+Extensions.swift
//  SadAgregator
//
//  Created by Yura Istomin on 20.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

struct ResignKeyboardOnDragGesture: ViewModifier {
  var gesture = DragGesture().onChanged { _ in
    UIApplication.shared.endEditing(true)
  }
  
  func body(content: Content) -> some View {
    content.gesture(gesture)
  }
}

extension View {
  func resignKeyboardOnDragGesture() -> some View {
    modifier(ResignKeyboardOnDragGesture())
  }
}
