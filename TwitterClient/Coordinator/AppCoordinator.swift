//
//  AppCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation

final class AppCoordinator: Coordinator {
    var isLoggedin = false
    override func start() {
        if !isLoggedin {
            let coordinator = LoginCoordinator(navigationController: self.navigationController)
            coordinator.start()
            childCoordinators.append(coordinator)
        } else {
            
        }
    }
}
