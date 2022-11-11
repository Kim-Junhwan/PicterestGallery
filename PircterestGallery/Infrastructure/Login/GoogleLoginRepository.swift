//
//  GoogleLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/02.
//

import Foundation
import GoogleSignIn

class GoogleLoginRepository: LoginRepository {
    
    func login(vc: UIViewController?, completion: @escaping loginResult) {
        guard let vc = vc else {return}
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }
            // If sign in succeeded, display the app's main content View.
            guard let user = user else { return }
            completion(.success(User(email: "")))
          }
    }
    
    func autoLogin(completion: @escaping loginResult) {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
              // Show the app's signed-out state.
                completion(.failure(loginError.tokkenError))
            } else {
              // Show the app's signed-in state.
                completion(.success(User(email: "")))
            }
          }
    }
    
    let signInConfig = GIDConfiguration(clientID:  (Bundle.main.infoDictionary?["GOOGLE_NATIVE_APP_KEY"] ?? "") as! String )
    
    func logout() {
        
    }
    
    func autoLogin() {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
              // Show the app's signed-out state.
            } else {
              // Show the app's signed-in state.
            }
          }
    }
    
    func getUserInfo(vc: UIViewController?, completion: @escaping (User) -> ()) {
        guard let vc = vc else {return}
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }
            guard let user = user else { return }

            let emailAddress = user.profile?.email
            completion(.init(email: emailAddress ?? ""))
        }
    }
}
