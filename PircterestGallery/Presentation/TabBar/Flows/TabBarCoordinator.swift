//
//  TabBarCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/07.
//

import Foundation
import UIKit

final class TabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var loginRepository: LoginRepository
    
    init(navigationController: UINavigationController, loginRepository: LoginRepository) {
        self.navigationController = navigationController
        self.loginRepository = loginRepository
    }
    
    func start() {
        let vc = TabBarController.create()
        navigationController.pushViewController(vc, animated: true)
        print("tabbarcoordinator \(loginRepository)")
    }
    
    
}
