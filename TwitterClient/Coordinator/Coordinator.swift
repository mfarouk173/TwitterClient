//
//  Coordinator.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import UIKit

class Coordinator: CoordinatorProtocol {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func start() {
        fatalError("Must be overriden!")
    }
    
}

protocol CoordinatorProtocol {
    func start()
}
