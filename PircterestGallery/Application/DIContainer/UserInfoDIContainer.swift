//
//  UserInfoDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/12.
//

import Foundation
import UIKit

class UserInfoDIContainer {
    func makeLogOutUseCase(loginRepository: LoginRepository) -> LogoutUseCase {
        return DefaultLogoutUseCase(loginRepository: loginRepository)
    }
    
    func makeUserInfoCoordinator(navigationController: UINavigationController, loginRepository: LoginRepository) -> UserInfoFlowCoordinator {
        return UserInfoFlowCoordinator(navigationController: navigationController, loginRepository: loginRepository)
    }
    
    func makeUserInfoViewModel(loginRepository: LoginRepository, coordinator: TabBarCoordinator) -> UserInfoViewModel {
        return DefaultUserInfoViewModel(logoutUseCase: makeLogOutUseCase(loginRepository: loginRepository), delegate: coordinator, loginRepository: loginRepository)
    }
    
    func makeUserInfoViewController(loginRepository: LoginRepository, coordinator: TabBarCoordinator) -> UserInfoViewController {
        return UserInfoViewController.create(viewModel: makeUserInfoViewModel(loginRepository: loginRepository, coordinator: coordinator))
    }
}
