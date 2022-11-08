//
//  LoginViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate {
    func successLogin()
}

protocol LoginViewModelInput {
    func didLogin(loginRepository: LoginRepository, vc: UIViewController?)
}

protocol LoginViewModelOutput {
    
}

protocol LoginViewModel: LoginViewModelInput, LoginViewModelOutput {}

final class DefaultLoginViewModel {
    
    private let loginUseCase: LoginUseCase
    private var loginRepository: LoginRepository?
    var delegate: LoginViewModelDelegate?
    
    init(loginUseCase: LoginUseCase, delegate: LoginViewModelDelegate) {
        self.loginUseCase = loginUseCase
        self.delegate = delegate
    }
}

extension DefaultLoginViewModel: LoginViewModel {
    
    func didLogin(loginRepository: LoginRepository, vc: UIViewController? = nil) {
        loginRepository.login(vc: vc) { [weak self] result in
            switch result {
            case .success(let user):
                print("ViewModel User:\(user)")
                self?.delegate?.successLogin()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
