//
//  TwitterTarget.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/23/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import Moya

enum TwitterTarget{
    case followers(count:Int)
    case tweets(handle:String, count:Int)
}

extension TwitterTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.twitter.com/1.1")! // will never fail safe to force unwrap
    }
    
    var path: String {
        switch self {
        case .followers:
            return "/followers/list.json"
        case .tweets:
            return "/statuses/user_timeline.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        switch self {
        case .followers(let count):
            return .requestParameters(parameters: ["count":count], encoding: URLEncoding.default)
        case .tweets(let handle, let count):
            return .requestParameters(parameters: ["screen_name":handle,"count":count], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}
