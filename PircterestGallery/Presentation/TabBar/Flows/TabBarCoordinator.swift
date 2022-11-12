//
//  TabBarCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/07.
//

import Foundation
import UIKit

protocol TabBarCoordinatorDelegate {
    func showLoginView()
}

protocol TabBarCoordinatorDependencies {
    func makeTabBarController() -> TabBarController
}

final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var loginRepository: LoginRepository
    let dependencies: TabBarCoordinatorDependencies
    let userInfoDIContainer: UserInfoDIContainer
    var delegate: TabBarCoordinatorDelegate?
    
    init(navigationController: UINavigationController, loginRepository: LoginRepository, dependencies: TabBarCoordinatorDependencies, userInfoDIContainer: UserInfoDIContainer, delegate: TabBarCoordinatorDelegate) {
        self.navigationController = navigationController
        self.loginRepository = loginRepository
        self.dependencies = dependencies
        self.userInfoDIContainer = userInfoDIContainer
        self.delegate = delegate
    }
    
    func start() {
        navigationController.viewControllers = [setTabBarController()]
        //navigationController.pushViewController(setTabBarController(), animated: true)
        print("tabbarcoordinator \(loginRepository)")
    }
    
    private func setTabBarController() -> UITabBarController {
        let tabBarController = dependencies.makeTabBarController()
        
        let userInfoItem = UITabBarItem(title: "UserInfo", image: nil, tag: 0)
        
        let userInfoFlowCoordinator = userInfoDIContainer.makeUserInfoCoordinator(navigationController: navigationController, loginRepository: loginRepository)
        let userInfoViewController = userInfoDIContainer.makeUserInfoViewController(loginRepository: loginRepository, coordinator: self)
        userInfoFlowCoordinator.navigationController.tabBarItem = userInfoItem
        tabBarController.setViewControllers([userInfoViewController], animated: true)
        
        return tabBarController
    }
    
}

extension TabBarCoordinator: UserInfoViewModelDelegate {
    func successLogOut() {
        self.delegate?.showLoginView()
    }
}
