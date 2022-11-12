//
//  LoginFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginFlowCoordinatorDelegate {
    func showTabBarView(loginRepository: LoginRepository)
}

protocol LoginFlowCoordinatorDependencies {
    func makeLoginViewController(coordinator: LoginFlowCoordinator) -> LoginViewController
}

final class LoginFlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var loginViewController: LoginViewController?
    
    let dependencies: LoginFlowCoordinatorDependencies
    var delegate: LoginFlowCoordinatorDelegate?
    
    init(navigationController: UINavigationController, dependencies: LoginFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeLoginViewController(coordinator: self)
        navigationController.viewControllers = [vc]
        //navigationController.pushViewController(vc, animated: true)
        loginViewController = vc
    }
}

extension LoginFlowCoordinator: LoginViewModelDelegate {
    func successLogin(loginRepository: LoginRepository) {
        delegate?.showTabBarView(loginRepository: loginRepository)
    }
    
}
