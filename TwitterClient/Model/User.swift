//
//  User.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation

class User: Codable {
    let id:Int
    let profileImageUrl:String
    let name:String
    let handle:String
    let bio:String
    let backgroundImageUrl:String?
//    tweets status
    
    enum CodingKeys: String, CodingKey {
        case id
        case profileImageUrl = "profile_image_url_https"
        case name
        case handle = "screen_name"
        case bio = "description"
        case backgroundImageUrl = "profile_background_image_url_https"
    }
    
    init(id:Int, profileImageUrl:String, name:String, handle:String, bio:String, backgroundImageUrl:String?){
        self.id = id
        self.profileImageUrl = profileImageUrl
        self.name = name
        self.handle = handle
        self.bio = bio
        self.backgroundImageUrl = backgroundImageUrl
    }
}
