//
//  ImageListFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/18.
//

import Foundation
import UIKit

protocol ImageListFlowCoordinatorDependencies {
    func makeImageListViewController() -> ImageListViewController
}

final class ImageListFlowCoordinator: TabBarChildCoordinator {
    var navigationController: UINavigationController
    var dependencies: ImageListFlowCoordinatorDependencies
    
    init(navigationController: UINavigationController, dependencies: ImageListFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let imageListViewController = dependencies.makeImageListViewController()
        navigationController.setViewControllers([imageListViewController], animated: true)
    }
    
    
}
