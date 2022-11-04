//
//  GoogleLoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/02.
//

import Foundation
import GoogleSignIn

final class GoogleLoginRepository: LoginRepository {
    
    let signInConfig = GIDConfiguration(clientID: "311803332457-sjfuh298vua7cas9heldk2528ksu0jni.apps.googleusercontent.com")
    func login(vc: UIViewController?) {
        guard let vc = vc else {return}
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: vc) { user, error in
            guard error == nil else { return }

            // If sign in succeeded, display the app's main content View.
          }
        
    }
    
    
}
