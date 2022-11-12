//
//  TabBatDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/08.
//

import Foundation
import UIKit

class TabBarDIContainer {
    func makeTabBarFlowCoordinator(navigationController: UINavigationController, loginRepository: LoginRepository, coordinator: TabBarCoordinatorDelegate) -> TabBarCoordinator {
        return TabBarCoordinator(navigationController: navigationController, loginRepository: loginRepository, dependencies: self, userInfoDIContainer: makeUserInfoDIContainer(), delegate: coordinator)
    }
    
    func makeUserInfoDIContainer() -> UserInfoDIContainer {
        return UserInfoDIContainer()
    }
    
}

extension TabBarDIContainer: TabBarCoordinatorDependencies {
    func makeTabBarController() -> TabBarController {
        let tabBarController = TabBarController.instantiateViewController()
        
        return tabBarController
    }
    
}
