//
//  LoginCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation

final class LoginCoordinator: Coordinator {
    override func start() {
        let viewModel = LoginViewModel()
        guard let viewController = LoginViewController.instantiate(viewController: .loginViewController) else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}
