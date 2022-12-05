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
    
    var window: UIWindow
    var loginViewController: LoginViewController?
    
    let dependencies: LoginFlowCoordinatorDependencies
    var delegate: LoginFlowCoordinatorDelegate?
    
    init(window: UIWindow, dependencies: LoginFlowCoordinatorDependencies) {
        self.window = window
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeLoginViewController(coordinator: self)
        self.window.rootViewController = vc
        loginViewController = vc
    }
}

extension LoginFlowCoordinator: LoginViewModelDelegate {
    func successLogin(loginRepository: LoginRepository) {
        delegate?.showTabBarView(loginRepository: loginRepository)
    }
    
}
