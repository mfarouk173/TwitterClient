//
//  FollowerDetailsCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/26/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift

final class FollowerDetailsCoordinator: Coordinator {
    var credential: OAuthSwiftCredential!
    var follower:User!
    
    override func start() {
        let viewModel = FollowerViewModel(credential: credential,follower: follower)
        guard let viewController = FollowerDetailsViewController.instantiate() else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

