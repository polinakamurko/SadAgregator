//
// ErrorModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public struct ErrorModel: Codable {


    public var message: String

    public var code: Int
    public init(message: String, code: Int) { 
        self.message = message
        self.code = code
    }

}
