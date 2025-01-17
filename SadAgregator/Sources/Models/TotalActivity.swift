//
// TotalActivity.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct TotalActivity: Codable {
  
  public var postsToday: String?
  public var postsYesterday: String?
  public var photosToday: String?
  public var photosYesterday: String?
  
  public init(postsToday: String? = nil, postsYesterday: String? = nil, photosToday: String? = nil, photosYesterday: String? = nil) {
    self.postsToday = postsToday
    self.postsYesterday = postsYesterday
    self.photosToday = photosToday
    self.photosYesterday = photosYesterday
  }
  
  public enum CodingKeys: String, CodingKey {
    case postsToday = "post_today"
    case postsYesterday = "post_ystd"
    case photosToday = "photo_today"
    case photosYesterday = "photo_ystd"
  }
}
