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
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func start() {
        let loginDIContainer = appDIContainer.makeLoginDIContainer()
        let flow = loginDIContainer.makeLoginFlowCoordinator(navigationController: navigationController)
        flow.start()
    }
    
    
}
