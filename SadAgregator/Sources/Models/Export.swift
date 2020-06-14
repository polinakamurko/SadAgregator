//
//  Export.swift
//  SadAgregator
//
//  Created by Yura Istomin on 14.06.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import Foundation

public struct Export: Codable {

  public var aviable: String?
  public var fast: String?
  public var type: String?

    public init(aviable: String? = nil, fast: String? = nil, type: String? = nil) {
        self.aviable = aviable
        self.fast = fast
        self.type = type
    }

}
