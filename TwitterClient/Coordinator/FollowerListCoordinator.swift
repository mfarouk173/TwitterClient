//
//  FollowerListCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift

final class FollowerListCoordinator: Coordinator {
    var credential: OAuthSwiftCredential!
    override func start() {
        let viewModel = FollowerViewModel(credential: credential)
        guard let viewController = FollowerListViewController.instantiate() else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}
