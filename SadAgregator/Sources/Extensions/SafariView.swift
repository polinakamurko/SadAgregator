//
//  SafariView.swift
//  SadAgregator
//
//  Created by Полина on 13.07.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
  
  var url: URL?
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
    SFSafariViewController(url: url ?? URL(string: "apple.com")!)
  }
  
  func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) { }
  
}
