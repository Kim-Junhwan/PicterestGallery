//
//  LoginDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

final class LoginDIContainer {
    func makeLoginFlowCoordinator(navigationController: UINavigationController) -> Coordinator {
        return LoginFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    func makeLoginViewModel() -> LoginViewModel {
        return DefaultLoginViewModel(loginUseCase: makeLoginUseCase())
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
    func makeLoginViewController() -> LoginViewController {
        LoginViewController.create(loginViewModel: makeLoginViewModel(), kakaoLoginRepository: makeKakaoLoginRepository(), googleLoginRepository: makeGoogleLoginRepository())
    }
}
