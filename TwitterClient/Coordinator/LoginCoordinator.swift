//
//  LoginCoordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift

protocol LoginCoordinatorDelegate {
    func loginDidSuccess(credential:OAuthSwiftCredential)
    func loginDidFail(error:Error)
}
final class LoginCoordinator: Coordinator {
    override func start() {
        let viewModel = LoginViewModel()
        viewModel.coordinatorDelegate = self
        guard let viewController = LoginViewController.instantiate() else {
            return
        }
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func loginDidSuccess(credential:OAuthSwiftCredential) {
        let coordinator = FollowerListCoordinator(navigationController: navigationController)
        coordinator.credential = credential
        coordinator.start()
    }
    
    func loginDidFail(error:Error) {
        
    }
}
