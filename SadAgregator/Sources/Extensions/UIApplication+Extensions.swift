//
//  UIApplication+Extensions.swift
//  SadAgregator
//
//  Created by Yura Istomin on 20.05.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import UIKit

extension UIApplication {
  func endEditing(_ force: Bool) {
    windows.filter { $0.isKeyWindow }.first?.endEditing(true)
  }
}
