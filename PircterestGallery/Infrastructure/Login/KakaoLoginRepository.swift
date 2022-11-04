//
//  KakaoLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import KakaoSDKUser

class KakaoLoginRepository: LoginRepository {
    
    func login(vc: UIViewController?) {
        if !kakaoTalkLogin() {
            kakaoAccountLogin()
        }
    }
    
    func kakaoTalkLogin() -> Bool {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
            return true
        } else {
            return false
        }
    }
    
    func kakaoAccountLogin() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    
}
