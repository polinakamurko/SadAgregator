//
// Peers.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Peers: Codable {

    public var type: String?
    public var peerId: String?
    public var capt: String?

    public init(type: String?, peerId: String?, capt: String?) {
        self.type = type
        self.peerId = peerId
        self.capt = capt
    }

    public enum CodingKeys: String, CodingKey { 
        case type
        case peerId = "peer_id"
        case capt
    }

}
