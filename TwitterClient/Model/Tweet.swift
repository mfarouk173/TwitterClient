//
//  Tweet.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation

class Tweet: Codable {
  
    let id: Int?
    let text: String?
    let retweetCount: Int?
    let favoriteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case retweetCount = "retweet_count"
        case favoriteCount = "favorite_count"
    }
    
    init(id:Int, text:String?,retweetCount:Int?,favoriteCount:Int?) {
        self.id = id
        self.text = text
        self.retweetCount = retweetCount
        self.favoriteCount = favoriteCount
    }
}

