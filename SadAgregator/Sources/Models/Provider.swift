//
// Provider.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

public struct Provider: Codable {
  
  public var anonym: String?
  public var vendId: String?
  public var vendLike: String?
  public var name: String?
  public var img: String?
  public var phone: String?
  public var placeId: String?
  public var myRate: String?
  public var place: String?
  public var vkLink: String?
  public var pop: String?
  public var regDt: String?
  public var terms: String?
  public var export: Export?
  public var revsInfo: ReviewsInfo?
  public var posts: [Post]?
  public var result: Int?
  public var speed: Int?
  
  public var phoneNumber: String {
    if let phone = phone, phone.isEmpty == false {
      return "\(phone)"
    } else {
      return "Не указан"
    }
  }
  
  var cleanTerms: String? {
    terms?.replacingOccurrences(of: "<br>", with: "\n")
  }
  
  public var providerIsLiked: Bool {
    vendLike == "1"
  }
  
  public init(anonym: String? = nil, vendId: String? = nil, vendLike: String? = nil, name: String? = nil, img: String? = nil, phone: String? = nil, placeId: String? = nil, myRate: String? = nil, place: String? = nil, vkLink: String? = nil, pop: String? = nil, regDt: String? = nil, terms: String? = nil, export: Export? = nil, revsInfo: ReviewsInfo? = nil, posts: [Post]? = nil, result: Int? = nil, speed: Int? = nil) {
    self.anonym = anonym
    self.vendId = vendId
    self.name = name
    self.img = img
    self.phone = phone
    self.placeId = placeId
    self.vkLink = vkLink
    self.pop = pop
    self.regDt = regDt
    self.terms = terms
    self.export = export
    self.revsInfo = revsInfo
    self.posts = posts
    self.result = result
    self.speed = speed
  }
  
  public enum CodingKeys: String, CodingKey {
    case anonym
    case vendId = "vend_id"
    case vendLike = "vend_like"
    case name
    case img
    case phone
    case placeId = "place_id"
    case myRate = "my_rate"
    case place
    case vkLink = "vk_link"
    case pop
    case regDt = "reg_dt"
    case terms
    case export
    case revsInfo = "revs_info"
    case posts
    case result
    case speed
  }
  
}

