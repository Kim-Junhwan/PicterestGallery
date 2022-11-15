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
    var window: UIWindow
    var loginRepository: LoginRepository
    let dependencies: TabBarCoordinatorDependencies
    let userInfoDIContainer: UserInfoDIContainer
    var delegate: TabBarCoordinatorDelegate?
    
    init(window: UIWindow, loginRepository: LoginRepository, dependencies: TabBarCoordinatorDependencies, userInfoDIContainer: UserInfoDIContainer, delegate: TabBarCoordinatorDelegate) {
        self.window = window
        self.loginRepository = loginRepository
        self.dependencies = dependencies
        self.userInfoDIContainer = userInfoDIContainer
        self.delegate = delegate
    }
    
    func start() {
        window.rootViewController = setTabBarController()
        //navigationController.pushViewController(setTabBarController(), animated: true)
        print("tabbarcoordinator \(loginRepository)")
    }
    
    private func setTabBarController() -> UITabBarController {
        let tabBarController = dependencies.makeTabBarController()
        
        let userInfoItem = UITabBarItem(title: "UserInfo", image: nil, tag: 0)
        let imageListItem = UITabBarItem(title: "Image", image: nil, tag: 1)
        
        //let userInfoFlowCoordinator = userInfoDIContainer.makeUserInfoCoordinator(navigationController: navigationController, loginRepository: loginRepository)
        let userInfoViewController = userInfoDIContainer.makeUserInfoViewController(loginRepository: loginRepository, coordinator: self)
        
        let imageListViewController = ImageListViewController()
        
        //userInfoFlowCoordinator.navigationController.tabBarItem = userInfoItem
        tabBarController.setViewControllers([userInfoViewController, imageListViewController], animated: true)
        
        return tabBarController
    }
    
}

extension TabBarCoordinator: UserInfoViewModelDelegate {
    func successLogOut() {
        self.delegate?.showLoginView()
    }
}
