//
// ChangeUserPassword.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct ChangeUserPassword: Codable {

    public var msg: String?
    public var result: Int?
    public var speed: Int?

    public init(msg: String?, result: Int?, speed: Int?) {
        self.msg = msg
        self.result = result
        self.speed = speed
    }


}

