//
// MyProviders.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct MyProviders: Codable {

    public var vends: [Providers]?
    public var result: Int?
    public var speed: Int?

    public init(vends: [Providers]? = nil, result: Int? = nil, speed: Int? = nil) {
        self.vends = vends
        self.result = result
        self.speed = speed
    }


}

