//
// Answer.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct Answer: Codable {
  
  public var _id: Int?
  public var capt: String?
  public var rec: Int?
  public var hint: String?
  public var disabled: Int?
  
  public var answerId: String {
    if let answerId = _id {
      return "\(answerId)"
    } else {
      return UUID().uuidString
    }
  }
  
  public init(_id: Int?, capt: String?, rec: Int?, hint: String?, disabled: Int?) {
    self._id = _id
    self.capt = capt
    self.rec = rec
    self.hint = hint
    self.disabled = disabled
  }
  
  public enum CodingKeys: String, CodingKey {
    case _id = "id"
    case capt
    case rec
    case hint
    case disabled
  }
}

