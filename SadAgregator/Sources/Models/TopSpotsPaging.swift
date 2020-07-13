//
// TopSpotsPaging.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct TopSpotsPaging: Codable {

    public var anonymm: String?
    public var pointsTop: [TopSpot]?
    public var result: Int?
    public var speed: Int?

    public init(anonymm: String?, pointsTop: [TopSpot]?, result: Int?, speed: Int?) {
        self.anonymm = anonymm
        self.pointsTop = pointsTop
        self.result = result
        self.speed = speed
    }

    public enum CodingKeys: String, CodingKey { 
        case anonymm
        case pointsTop = "points_top"
        case result
        case speed
    }

}

