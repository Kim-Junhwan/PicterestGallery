//
//  KakaoLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import KakaoSDKUser

enum loginError: Error {
    case networkError
    case tokkenError
}

class KakaoLoginRepository: LoginRepository {
    
    func login(vc: UIViewController?, completion: @escaping loginResult) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            kakaoAppLogin { result in
                if result {
                    self.getUserInfo { user in
                        completion(.success(user))
                    }
                } else {
                    completion(.failure(loginError.networkError))
                }
            }
        } else {
            kakaoAccountLogin { result in
                if result {
                    self.getUserInfo { user in
                        completion(.success(user))
                    }
                }
            }
        }
        
    }
    
    func autoLogin(completion: @escaping loginResult) {
        
    }
    
    func kakaoAppLogin(completion: @escaping (Bool)->()) {
        UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
            if let error = error {
                print(error)
                completion(false)
            }
            else {
                print("loginWithKakaoTalk() success.")
                
                //do something
                _ = oauthToken
                completion(true)
            }
        }
    }
    
    func kakaoAccountLogin(completion: @escaping (Bool)->()){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    completion(false)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                    completion(true)
                }
            }
    }
    
    func getUserInfo(completion: @escaping(User)->()) {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                completion(User(email: user?.kakaoAccount?.email ?? ""))
            }
        }
    }
    
    func logout() {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    func autoLogin() {
    }
}
