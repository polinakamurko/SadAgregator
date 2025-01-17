//
// GetMyReview.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct GetMyReview: Codable {

    public var revId: String?
    public var rate: String?
    public var text: String?
    public var imgs: [ReviewImages]?
    public var result: Int?
    public var speed: Int?

    public init(revId: String?, rate: String?, text: String?, imgs: [ReviewImages]?, result: Int?, speed: Int?) {
        self.revId = revId
        self.rate = rate
        self.text = text
        self.imgs = imgs
        self.result = result
        self.speed = speed
    }

    public enum CodingKeys: String, CodingKey { 
        case revId = "rev_id"
        case rate
        case text
        case imgs
        case result
        case speed
    }

}

