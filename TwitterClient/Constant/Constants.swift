//
//  TwitterConstants.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation

struct Constants {
    struct Twitter {
        static let consumerKey = "bk8Zb9loMNm2D6Ko1WBQhjtnZ"
        static let consumerSecret = "iFCqylf6CizCefj36cigrTLHVtNiXJTDqqpDybAbZJbar8jTTV"
        static let requestTokenUrl = "https://api.twitter.com/oauth/request_token"
        static let authorizeUrl = "https://api.twitter.com/oauth/authorize"
        static let accessTokenUrl = "https://api.twitter.com/oauth/access_token"
        static let callbackUrl = "http://oauthswift.herokuapp.com/callback/eventtustwitter"
    }
    
    struct StoryboardName {
        static let main = "Main"
    }
}
