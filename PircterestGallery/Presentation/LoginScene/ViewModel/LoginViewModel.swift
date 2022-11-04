//
//  LoginViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginViewModelInput {
    func didLogin(loginRepository: LoginRepository, vc: UIViewController?)
}

protocol LoginViewModelOutput {
    
}

protocol LoginViewModel: LoginViewModelInput, LoginViewModelOutput {}

final class DefaultLoginViewModel {
    
    private let loginUseCase: LoginUseCase
    
    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
}

extension DefaultLoginViewModel: LoginViewModel {
    
    func didLogin(loginRepository: LoginRepository, vc: UIViewController? = nil) {
        loginUseCase.login(loginRepository: loginRepository, vc: vc)
    }
    
}
