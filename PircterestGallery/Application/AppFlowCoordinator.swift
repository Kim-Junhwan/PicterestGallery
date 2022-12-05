//
//  AppFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

final class AppFlowCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var window: UIWindow
    private let appDIContainer: AppDIContainer
    var isLoggedIn: Bool = false
    var loginRepository: LoginRepository?
    
    init(window: UIWindow, appDIContainer: AppDIContainer) {
        self.window = window
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        print(UserDefaults.standard.bool(forKey: "isLoggedIn"))
        print(UserDefaults.standard.string(forKey: "lastLoginRepository"))
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            let loginRepositoryString = UserDefaults.standard.string(forKey: "lastLoginRepository")
            
            switch loginRepositoryString {
            case "KakaoLoginRepository":
                loginRepository = KakaoLoginRepository()
            case "GoogleLoginRepository":
                loginRepository = GoogleLoginRepository()
            default:
                print("error \(loginRepositoryString)")
            }
            guard let loginRepository = loginRepository else { return }
            loginRepository.autoLogin(completion: { result in
                switch result {
                case.success(_):
                    print("AUTOLOGIN SUCCESS")
                    self.showTabBarView(loginRepository: loginRepository)
                case .failure(_):
                    self.showAuthentication()
                }
            })
        } else {
            showAuthentication()
        }
    }
    
    func showAuthentication() {
        print("SHOW LOGIN")
        let loginDIContainer = appDIContainer.makeLoginDIContainer()
        let flow = loginDIContainer.makeLoginFlowCoordinator(window: window)
        flow.delegate = self
        flow.start()
    }
    
}

extension AppFlowCoordinator: LoginFlowCoordinatorDelegate {
    func showTabBarView(loginRepository: LoginRepository) {
        print("SHOW TABBAR")
        let tabBarDIContainer = appDIContainer.makeTabBarDIContainer()
        let flow = tabBarDIContainer.makeTabBarFlowCoordinator(window: window, loginRepository: loginRepository, coordinator: self)
        flow.start()
    }
}

extension AppFlowCoordinator: TabBarCoordinatorDelegate {
    func showLoginView() {
        showAuthentication()
    }
}
