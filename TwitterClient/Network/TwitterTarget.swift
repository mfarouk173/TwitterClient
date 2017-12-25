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
    case followers
}

extension TwitterTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.twitter.com/1.1")! // will never fail safe to force unwrap
    }
    
    var path: String {
        switch self {
        case .followers:
            return "/followers/list.json"
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
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
    
    
}