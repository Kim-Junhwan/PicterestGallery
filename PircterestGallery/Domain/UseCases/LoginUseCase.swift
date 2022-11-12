//
//  LoginUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol LoginUseCase {
    func excute(loginRepository: LoginRepository, vc: UIViewController?, completion: @escaping (Result<User, Error>)->())
}

protocol LogoutUseCase {
    func excute(completion: @escaping (Bool)->())
}

final class DefaultLoginUseCase: LoginUseCase {
    private var loginRepository: LoginRepository?

    func excute(loginRepository: LoginRepository, vc: UIViewController? = nil, completion: @escaping (Result<User, Error>)->()) {
        self.loginRepository = loginRepository
        self.loginRepository?.login(vc: vc, completion: { result in
            switch result {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

final class DefaultLogoutUseCase: LogoutUseCase {
    private var loginRepository: LoginRepository?
    
    init(loginRepository: LoginRepository? = nil) {
        self.loginRepository = loginRepository
    }
    
    func excute(completion: @escaping (Bool)->()) {
        loginRepository?.logout(completion: { isLogOutSuccess in
            if isLogOutSuccess {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
    
}
