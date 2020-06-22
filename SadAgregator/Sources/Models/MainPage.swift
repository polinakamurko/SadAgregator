//
// MainPage.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct MainPage: Codable {
  
  public var activity: String?
  public var totalActivity: TotalActivity?
  public var export: Export?
  public var linesActTop: [TopLine]?
  public var pointsTop: [TopSpot]?
  public var anonym: String?
  public var posts: [Post]?
  
  public var result: Int?
  public var speed: Int?
  
  public init(activity: String? = nil, totalActivity: TotalActivity? = nil, export: Export? = nil, linesActTop: [TopLine]? = nil, pointsTop: [TopSpot]? = nil, anonym: String? = nil, posts: [Post]? = nil, result: Int? = nil, speed: Int? = nil) {
    self.activity = activity
    self.totalActivity = totalActivity
    self.export = export
    self.linesActTop = linesActTop
    self.pointsTop = pointsTop
    self.anonym = anonym
    self.posts = posts
    self.result = result
    self.speed = speed
  }
  
  public enum CodingKeys: String, CodingKey {
    case activity
    case totalActivity = "total_activity"
    case export
    case linesActTop = "lines_act_top"
    case pointsTop = "points_top"
    case anonym
    case posts
    case result
    case speed
  }
}
