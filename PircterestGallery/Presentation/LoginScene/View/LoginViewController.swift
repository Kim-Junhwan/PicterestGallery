//
//  LoginViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController, StoryboardInstatiable {
    
    private var loginViewModel: LoginViewModel?
    private var kakaoLoginRepository: KakaoLoginRepository?
    private var googleLoginRepository: GoogleLoginRepository?
    
    @IBOutlet weak var loginButtonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func create(loginViewModel: LoginViewModel, kakaoLoginRepository: KakaoLoginRepository, googleLoginRepository: GoogleLoginRepository) -> LoginViewController {
        let view = LoginViewController.instantiateViewController()
        view.loginViewModel = loginViewModel
        view.kakaoLoginRepository = kakaoLoginRepository
        view.googleLoginRepository = googleLoginRepository
        return view
    }
    
    @IBAction func kakaoLoginButtonPressed(_ sender: UIButton) {
        guard let kakaoLoginRepository = kakaoLoginRepository else {return}
        loginViewModel?.didLogin(loginRepository: kakaoLoginRepository)
    }
    
    
    @IBAction func googleLoginButtonPressed(_ sender: UIButton) {
        guard let googleLoginRepository = googleLoginRepository else {return}
        loginViewModel?.didLogin(loginRepository: googleLoginRepository)
    }
}
