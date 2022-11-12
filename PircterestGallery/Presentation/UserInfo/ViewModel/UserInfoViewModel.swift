//
//  UserInfoViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/12.
//

import Foundation

protocol UserInfoViewModelDelegate {
    func successLogOut()
}

protocol UserInfoViewModelInput {
    func didLogOut()
}

protocol UserInfoViewModelOutput {
    
}

protocol UserInfoViewModel: UserInfoViewModelInput, UserInfoViewModelOutput {}

final class DefaultUserInfoViewModel: UserInfoViewModel {

    private let logoutUseCase: LogoutUseCase
    var delegate: UserInfoViewModelDelegate?
    let loginRepository: LoginRepository
    var userProfile: String {
        get {
             return getUserInfo()
        }
    }
    
    init(logoutUseCase: LogoutUseCase, delegate: UserInfoViewModelDelegate, loginRepository: LoginRepository) {
        self.logoutUseCase = logoutUseCase
        self.delegate = delegate
        self.loginRepository = loginRepository
    }
    
    func didLogOut() {
        logoutUseCase.excute { isLogOutSuccess in
            if isLogOutSuccess {
                print("LOGOUT VIEWMODEL")
                UserDefaults.standard.set(false, forKey: "isLoggedIn")
                UserDefaults.standard.set(nil, forKey: "lastLoginRepository")
                self.delegate?.successLogOut()
            }
        }
    }
    
    func getUserInfo() -> String {
        loginRepository.getUserInfo(vc: <#T##UIViewController?#>, completion: <#T##(User) -> ()#>)
        return
    }
    
}
