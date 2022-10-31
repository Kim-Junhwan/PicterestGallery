//
//  LoginViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController, StoryboardInstatiable {
    
    var loginViewModel: LoginViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func create(loginViewModel: LoginViewModel) -> LoginViewController {
        let view = LoginViewController.instantiateViewController()
        view.loginViewModel = loginViewModel
        return view
    }
    
}
