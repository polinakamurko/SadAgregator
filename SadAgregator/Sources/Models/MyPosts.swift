//
// MyPosts.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



public struct MyPosts: Codable {

    public var export: Export?
    public var posts: [Post]?
    public var result: Int?
    public var speed: Int?

    public init(export: Export?, posts: [Post]?, result: Int?, speed: Int?) {
        self.export = export
        self.posts = posts
        self.result = result
        self.speed = speed
    }


}
