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
    
    func makeUserInfoCoordinator(loginRepository: LoginRepository, delegate: UserInfoFlowCoordinatorDelegate) -> UserInfoFlowCoordinator {
        return UserInfoFlowCoordinator(navigationController: UINavigationController(), dependencies: self, loginRepository: loginRepository, delegate: delegate)
    }
    
    private func makeUserInfoViewModel(loginRepository: LoginRepository, coordinator: UserInfoFlowCoordinator) -> UserInfoViewModel {
        return DefaultUserInfoViewModel(logoutUseCase: makeLogOutUseCase(loginRepository: loginRepository), delegate: coordinator, loginRepository: loginRepository)
    }
}

extension UserInfoDIContainer: UserInfoFlowCoordinatorDependencies {
    func makeUserInfoViewController(loginRepository: LoginRepository, coordinator: UserInfoFlowCoordinator) -> UserInfoViewController {
        return UserInfoViewController.create(viewModel: makeUserInfoViewModel(loginRepository: loginRepository, coordinator: coordinator))
    }
}
