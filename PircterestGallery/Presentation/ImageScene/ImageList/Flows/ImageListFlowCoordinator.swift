//
//  ImageListFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/18.
//

import Foundation
import UIKit

final class ImageListFlowCoordinator: TabBarChildCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let imageListViewController = ImageListViewController.instantiateViewController()
        navigationController.setViewControllers([imageListViewController], animated: true)
    }
    
    
}
