//
//  KakaoLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth
import KakaoSDKCommon

enum loginError: Error {
    case networkError
    case tokkenError
}

class KakaoLoginRepository: LoginRepository {
    func login(vc: UIViewController?, completion: @escaping loginResult) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            kakaoAppLogin { result in
                if result {
                    self.getUserInfo(vc: nil) { user in
                        completion(.success(user))
                    }
                } else {
                    completion(.failure(loginError.networkError))
                }
            }
        } else {
            kakaoAccountLogin { result in
                if result {
                    self.getUserInfo(vc: nil) { user in
                        completion(.success(user))
                    }
                }
            }
        }
        
    }
    
    func autoLogin(completion: @escaping loginResult) {
        if (AuthApi.hasToken()) {
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                        completion(.failure(error))
                    }
                    else {
                        //기타 에러
                        completion(.failure(error))
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    self.getUserInfo(vc: nil) { user in
                        completion(.success(user))
                    }
                }
            }
        }
        else {
            //로그인 필요
        }
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
    
    func getUserInfo(vc: UIViewController?, completion: @escaping (User) -> ()) {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                //do something
                completion(User(email: user?.kakaoAccount?.name ?? ""))
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
}
