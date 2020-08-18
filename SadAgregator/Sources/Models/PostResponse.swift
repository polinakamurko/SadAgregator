//
//  PostResponse.swift
//  SadAgregator
//
//  Created by Полина on 18.08.2020.
//  Copyright © 2020 Полина Камурко. All rights reserved.
//

import Foundation

public struct PostResponse: Codable {

    public var msg: String?
    public var result: Int?
    public var speed: Int?

    public init(msg: String?, result: Int?, speed: Int?) {
        self.msg = msg
        self.result = result
        self.speed = speed
    }
}
