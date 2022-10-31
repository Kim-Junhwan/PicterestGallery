//
//  LoginFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorDependencies {
    func makeLoginViewController() -> LoginViewController
}

final class LoginFlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var loginViewController: LoginViewController?
    
    let dependencies: LoginFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: LoginFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeLoginViewController()
        navigationController.pushViewController(vc, animated: true)
        loginViewController = vc
    }
    
    
}
