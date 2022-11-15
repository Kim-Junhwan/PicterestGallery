//
//  LoginDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

final class LoginDIContainer {
    func makeLoginFlowCoordinator(window: UIWindow) -> LoginFlowCoordinator {
        return LoginFlowCoordinator(window: window, dependencies: self)
    }
    
    func makeLoginViewModel(coordinator: LoginFlowCoordinator) -> LoginViewModel {
        return DefaultLoginViewModel(loginUseCase: makeLoginUseCase(), delegate: coordinator)
    }
    
    func makeLogoutUseCase() -> LogoutUseCase {
        return DefaultLogoutUseCase()
    }
    
    func makeLoginUseCase() -> LoginUseCase {
        return DefaultLoginUseCase()
    }
    
    func makeKakaoLoginRepository() -> KakaoLoginRepository {
        return KakaoLoginRepository()
    }
    
    func makeGoogleLoginRepository() -> GoogleLoginRepository {
        return GoogleLoginRepository()
    }
}

extension LoginDIContainer: LoginFlowCoordinatorDependencies {
    func makeLoginViewController(coordinator: LoginFlowCoordinator) -> LoginViewController {
        LoginViewController.create(loginViewModel: makeLoginViewModel(coordinator: coordinator), kakaoLoginRepository: makeKakaoLoginRepository(), googleLoginRepository: makeGoogleLoginRepository())
    }
}
