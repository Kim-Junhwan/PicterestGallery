//
//  TabBatDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/08.
//

import Foundation
import UIKit

class TabBarDIContainer {
    func makeTabBarFlowCoordinator(navigationController: UINavigationController, loginRepository: LoginRepository) -> TabBarCoordinator {
        return TabBarCoordinator(navigationController: navigationController, loginRepository: loginRepository)
    }
}
