//
// Arrows.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Arrows: Codable {

    public var namePrev: String?
    public var idPrev: String?
    public var nameNext: String?
    public var idNext: String?

    public init(namePrev: String?, idPrev: String?, nameNext: String?, idNext: String?) {
        self.namePrev = namePrev
        self.idPrev = idPrev
        self.nameNext = nameNext
        self.idNext = idNext
    }

    public enum CodingKeys: String, CodingKey { 
        case namePrev = "name_prev"
        case idPrev = "id_prev"
        case nameNext = "name_next"
        case idNext = "id_next"
    }

}

