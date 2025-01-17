//
// UserKey.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct UserKey: Codable {
  
  public var key: String?
  public var anonym: String?
  public var imgHashSrv: String?
  public var imgHashSrch: String?
  public var name: String?
  public var favoriteProviders: String?
  public var likedPosts: String?
  public var settings: String?
  public var message: Message?
  public var result: Int?
  public var speed: Int?
  
  public init(key: String? = nil, anonym: String? = nil, imgHashSrv: String? = nil, imgHashSrch: String? = nil, name: String? = nil, favoriteProviders: String? = nil, likedPosts: String? = nil, settings: String? = nil, message: Message? = nil, result: Int? = nil, speed: Int? = nil) {
    self.key = key
    self.anonym = anonym
    self.imgHashSrv = imgHashSrv
    self.imgHashSrch = imgHashSrch
    self.name = name
    self.favoriteProviders = favoriteProviders
    self.likedPosts = likedPosts
    self.settings = settings
    self.message = message
    self.result = result
    self.speed = speed
  }
  
  public enum CodingKeys: String, CodingKey {
    case key
    case anonym
    case imgHashSrv = "img_hash_srv"
    case imgHashSrch = "img_hash_srch"
    case name
    case favoriteProviders = "lk_vends"
    case likedPosts = "lk_posts"
    case settings
    case message
    case result
    case speed
  }
}
