//
//  LoginViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginViewModelDelegate {
    func successLogin(loginRepository: LoginRepository)
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
        loginUseCase.excute(loginRepository: loginRepository, vc: vc) { [weak self] result in
            print("viewModel repository: \(loginRepository)")
            switch result {
            case .success(let user):
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set("\(loginRepository.self)".split(separator: ".").last! ?? "", forKey: "lastLoginRepository")
                self?.delegate?.successLogin(loginRepository: loginRepository)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
