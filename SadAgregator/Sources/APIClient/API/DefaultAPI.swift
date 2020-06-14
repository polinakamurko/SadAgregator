//
// DefaultAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire



open class DefaultAPI {
    /**
     Returns an updated user key
     - parameter aKey: (query) Old key 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func agrClientCheckKeysGet(aKey: String, completion: @escaping ((_ data: UserKey?,_ error: Error?) -> Void)) {
        agrClientCheckKeysGetWithRequestBuilder(aKey: aKey).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Returns an updated user key
     - GET /agr_client.CheckKeys
     - examples: [{contentType=application/json, example={
  "result" : 0,
  "img_hash_srch" : "img_hash_srch",
  "anonym" : "anonym",
  "img_hash_srv" : "img_hash_srv",
  "key" : "key",
  "speed" : 6
}}]
     - parameter aKey: (query) Old key 

     - returns: RequestBuilder<UserKey> 
     */
    open class func agrClientCheckKeysGetWithRequestBuilder(aKey: String) -> RequestBuilder<UserKey> {
        let path = "/agr_client.CheckKeys"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "AKey": aKey
        ])

        let requestBuilder: RequestBuilder<UserKey>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Main page data
     - parameter aKey: (query) Token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func agrIntfMainGet(aKey: String, completion: @escaping ((_ data: MainPage?,_ error: Error?) -> Void)) {
        agrIntfMainGetWithRequestBuilder(aKey: aKey).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Main page data
     - GET /agr_intf.Main
     - examples: [{contentType=application/json, example={
  "result" : 1,
  "lines_act_top" : [ {
    "capt" : "capt",
    "line_id" : "line_id",
    "posts" : "posts",
    "last_act" : "last_act"
  }, {
    "capt" : "capt",
    "line_id" : "line_id",
    "posts" : "posts",
    "last_act" : "last_act"
  } ],
  "points_top" : [ {
    "point_id" : "point_id",
    "capt" : "capt",
    "posts" : "posts",
    "last_act" : "last_act"
  }, {
    "point_id" : "point_id",
    "capt" : "capt",
    "posts" : "posts",
    "last_act" : "last_act"
  } ],
  "activity" : "activity",
  "total_activity" : {
    "photo_ystd" : "photo_ystd",
    "post_today" : "post_today",
    "photo_today" : "photo_today",
    "post_ystd" : "post_ystd"
  },
  "anonym" : "anonym",
  "posts" : [ {
    "point_id" : "point_id",
    "images" : [ {
      "w" : 0,
      "h" : 6,
      "n" : "n"
    }, {
      "w" : 0,
      "h" : 6,
      "n" : "n"
    } ],
    "like" : "like",
    "vk_post" : "vk_post",
    "posted" : "posted",
    "sizes" : [ "sizes", "sizes" ],
    "price" : "price",
    "vendor_id" : "vendor_id",
    "by" : "by",
    "options" : [ "options", "options" ],
    "id" : "id",
    "text" : "text",
    "views" : "views",
    "vendor_capt" : "vendor_capt"
  }, {
    "point_id" : "point_id",
    "images" : [ {
      "w" : 0,
      "h" : 6,
      "n" : "n"
    }, {
      "w" : 0,
      "h" : 6,
      "n" : "n"
    } ],
    "like" : "like",
    "vk_post" : "vk_post",
    "posted" : "posted",
    "sizes" : [ "sizes", "sizes" ],
    "price" : "price",
    "vendor_id" : "vendor_id",
    "by" : "by",
    "options" : [ "options", "options" ],
    "id" : "id",
    "text" : "text",
    "views" : "views",
    "vendor_capt" : "vendor_capt"
  } ],
  "speed" : 5
}}]
     - parameter aKey: (query) Token 

     - returns: RequestBuilder<MainPage> 
     */
    open class func agrIntfMainGetWithRequestBuilder(aKey: String) -> RequestBuilder<MainPage> {
        let path = "/agr_intf.Main"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
                        "AKey": aKey
        ])

        let requestBuilder: RequestBuilder<MainPage>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
