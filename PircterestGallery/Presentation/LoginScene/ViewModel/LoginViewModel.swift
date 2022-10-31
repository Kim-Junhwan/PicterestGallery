//
//  LoginViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation

protocol LoginViewModelInput {
    func didLogin(loginRepository: LoginRepository)
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
    
    func didLogin(loginRepository: LoginRepository) {
        loginRepository.login()
    }
    
}
