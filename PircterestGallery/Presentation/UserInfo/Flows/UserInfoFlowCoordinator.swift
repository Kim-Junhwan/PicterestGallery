//
//  UserInfoFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/12.
//

import Foundation
import UIKit

protocol UserInfoFlowCoordinatorDependencies {
    
}

final class UserInfoFlowCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let loginRepository: LoginRepository
    
    init(navigationController: UINavigationController, loginRepository: LoginRepository) {
        self.navigationController = navigationController
        self.loginRepository = loginRepository
    }
    
    func start() {
        
    }
    
    
}
