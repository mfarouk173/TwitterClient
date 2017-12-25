//
//  Insta.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit

protocol Instantiatable {
    static var viewControllerId:ViewContollerId { get }
    static func instantiate() -> Self?
}

extension Instantiatable where Self: UIViewController {
    static func instantiate() -> Self? {
        let storyboard = UIStoryboard(name: Constants.StoryboardName.main, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: Self.viewControllerId.rawValue) as? Self
    }
}
