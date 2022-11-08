//
//  AppFlowCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

final class AppFlowCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") {
            let loginRepository = UserDefaults.standard.value(forKey: "loginRepository") as? LoginRepository
            loginRepository?.autoLogin(completion: { result in
                switch result {
                case.success(let uer):
                    self.showTabBarView()
                case .failure(let error):
                    self.showAuthentication()
                }
            })
            showTabBarView()
        } else {
            showAuthentication()
        }
    }
    
    func showAuthentication() {
        let loginDIContainer = appDIContainer.makeLoginDIContainer()
        let flow = loginDIContainer.makeLoginFlowCoordinator(navigationController: navigationController)
        flow.delegate = self
        flow.start()
    }
    
}

extension AppFlowCoordinator: LoginFlowCoordinatorDelegate {
    func showTabBarView() {
        print("SHOW TABBAR")
        let tabBarDIContainer = appDIContainer.makeTabBarDIContainer()
        let flow = tabBarDIContainer.makeTabBarFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
    
   
}
