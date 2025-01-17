//
// TopLine.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct TopLine: Codable, Identifiable {
  
  public var lineId: String?
  public var posts: String?
  public var capt: String?
  public var lastAct: String?
  
  public var id: String {
    lineId ?? UUID().uuidString
  }
  
  public init(lineId: String? = nil, posts: String? = nil, capt: String? = nil, lastAct: String? = nil) {
    self.lineId = lineId
    self.posts = posts
    self.capt = capt
    self.lastAct = lastAct
  }
  
  public enum CodingKeys: String, CodingKey {
    case lineId = "line_id"
    case posts
    case capt
    case lastAct = "last_act"
  }
}
