//
//  UserInfoFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/12.
//

import Foundation
import UIKit

protocol UserInfoFlowCoordinatorDelegate {
    func goLoginView()
}

protocol UserInfoFlowCoordinatorDependencies {
    func makeUserInfoViewController(loginRepository: LoginRepository, coordinator: UserInfoFlowCoordinator) -> UserInfoViewController
}

final class UserInfoFlowCoordinator: TabBarChildCoordinator {
    var navigationController: UINavigationController
    var loginRepository: LoginRepository
    var dependencies: UserInfoFlowCoordinatorDependencies
    var delegate: UserInfoFlowCoordinatorDelegate
    
    init(navigationController: UINavigationController, dependencies: UserInfoFlowCoordinatorDependencies, loginRepository: LoginRepository, delegate: UserInfoFlowCoordinatorDelegate) {
        self.navigationController = navigationController
        self.dependencies = dependencies
        self.loginRepository = loginRepository
        self.delegate = delegate
    }
    
    func start() {
        let userInfoController = dependencies.makeUserInfoViewController(loginRepository: loginRepository, coordinator: self)
        navigationController.setViewControllers([userInfoController], animated: true)
    }
}

extension UserInfoFlowCoordinator: UserInfoViewModelDelegate {
    func successLogOut() {
        delegate.goLoginView()
    }
}
