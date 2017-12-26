//
//  FollowerListCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift

protocol FollowerListCoordinatorDelegate {
    func showFollowerDetails(follower: User)
}

final class FollowerListCoordinator: Coordinator {
    var credential: OAuthSwiftCredential!
    override func start() {
        let viewModel = FollowerListViewModel(credential: credential)
        viewModel.coordinatorDelegate = self
        guard let viewController = FollowerListViewController.instantiate() else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FollowerListCoordinator: FollowerListCoordinatorDelegate {
    func showFollowerDetails(follower: User) {
        let coordinator = FollowerDetailsCoordinator(navigationController: navigationController)
        coordinator.credential = credential
        coordinator.follower = follower
        coordinator.start()
    }
}
