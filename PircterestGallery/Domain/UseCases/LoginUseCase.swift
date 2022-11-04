//
//  LoginUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginUseCase {
    func login(loginRepository: LoginRepository, vc: UIViewController?)
}

final class DefaultLoginUseCase: LoginUseCase {
    private var loginRepository: LoginRepository?

    func login(loginRepository: LoginRepository, vc: UIViewController? = nil) {
        self.loginRepository = loginRepository
        if vc != nil {
            loginRepository.login(vc: vc)
        } else {
            loginRepository.login(vc: nil)
        }
    }
}
