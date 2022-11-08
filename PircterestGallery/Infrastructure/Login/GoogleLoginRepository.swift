//
//  GoogleLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/02.
//

import Foundation
import GoogleSignIn

final class GoogleLoginRepository: LoginRepository {
    func login(vc: UIViewController?, completion: @escaping loginResult) {
        guard let vc = vc else {return}
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }
            // If sign in succeeded, display the app's main content View.
            guard let user = user else { return }
            self.userInfo = User.init(email: user.profile?.email ?? "")
            completion(.success(self.userInfo ?? User(email: "")))
          }
    }
    
    func autoLogin(completion: @escaping loginResult) {
        
    }
    
    let signInConfig = GIDConfiguration(clientID: "311803332457-sjfuh298vua7cas9heldk2528ksu0jni.apps.googleusercontent.com")
    var userInfo: User?
    
    func login(vc: UIViewController?) {
        guard let vc = vc else {return}
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }
            
            // If sign in succeeded, display the app's main content View.
            guard let user = user else { return }
            self.userInfo = User.init(email: user.profile?.email ?? "")
          }
    }
    
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
    
    func getUserInfo(completion: @escaping (User) -> ()) {
        guard let user = userInfo else { return }
        completion(user)
    }
}
