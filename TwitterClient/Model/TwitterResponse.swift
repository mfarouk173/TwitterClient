//
//  TwitterResponse.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/23/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import RealmSwift

class TwitterResponse: Codable {
//    @objc dynamic var
    let users:[User]
    let nextCursor:Int
    let previousCursor:Int
    
    enum CodingKeys: String, CodingKey {
        case users
        case nextCursor = "next_cursor"
        case previousCursor = "previous_cursor"
    }
    
    init(users:[User],nextCursor:Int, previousCursor:Int){
        self.users = users
        self.nextCursor = nextCursor
        self.previousCursor = previousCursor
    }
}
