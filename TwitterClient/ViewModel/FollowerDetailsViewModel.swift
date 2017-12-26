//
//  FollowerDetailsViewModel.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/26/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import Moya
import OAuthSwift

class FollowerDetailsViewModel {
    private var provider: MoyaProvider<TwitterTarget>?
    private var credential: OAuthSwiftCredential
    var follower:User?
    
    init(credential: OAuthSwiftCredential, follower:User) {
        self.credential = credential
        self.follower = follower
    }
    
    func getTweets(completion:@escaping (_ tweets: [Tweet]?)->()) {
        
    }
}

