//
//  LoginUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation

protocol LoginUseCase {
    func login(loginRepository: LoginRepository)
}

final class DefaultLoginUseCase: LoginUseCase {
    private var loginRepository: LoginRepository?

    func login(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
        loginRepository.login()
    }
}
