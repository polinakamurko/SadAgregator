//
//  AnyTransition+Extensions.swift
//  SadAgregator
//
//  Created by Yura Istomin on 20.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI

extension AnyTransition {
  static var customNavbar: AnyTransition {
    AnyTransition
      .move(edge: .top)
      .combined(with: .opacity)
  }
}
