//
// GetVKAppID.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct GetVKAppID: Codable {

    public var appId: String?
    public var result: Int?
    public var speed: Int?

    public init(appId: String?, result: Int?, speed: Int?) {
        self.appId = appId
        self.result = result
        self.speed = speed
    }

    public enum CodingKeys: String, CodingKey { 
        case appId = "app_id"
        case result
        case speed
    }

}
