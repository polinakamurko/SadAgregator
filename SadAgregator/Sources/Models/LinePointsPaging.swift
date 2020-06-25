//
// LinePointsPaging.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct LinePointsPaging: Codable {

    public var anonym: String?
    public var pointsTop: [TopSpot]?
    public var result: Int?
    public var speed: Int?

    public init(anonym: String?, pointsTop: [TopSpot]?, result: Int?, speed: Int?) {
        self.anonym = anonym
        self.pointsTop = pointsTop
        self.result = result
        self.speed = speed
    }

    public enum CodingKeys: String, CodingKey { 
        case anonym
        case pointsTop = "points_top"
        case result
        case speed
    }

}
