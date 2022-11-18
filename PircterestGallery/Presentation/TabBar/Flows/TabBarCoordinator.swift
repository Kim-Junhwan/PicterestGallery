//
//  TabBarCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/07.
//

import Foundation
import UIKit

protocol TabBarCoordinatorDelegate {
    func showLoginView()
}

protocol TabBarCoordinatorDependencies {
    func makeTabBarController() -> TabBarController
    func makeUserInfoDIConatiner() -> UserInfoDIContainer
    func makeImageListDIContainer() -> ImageListDIContainer
}

final class TabBarCoordinator: Coordinator {
    var window: UIWindow
    var loginRepository: LoginRepository
    let dependencies: TabBarCoordinatorDependencies
    var delegate: TabBarCoordinatorDelegate?
    
    init(window: UIWindow, loginRepository: LoginRepository, dependencies: TabBarCoordinatorDependencies,delegate: TabBarCoordinatorDelegate) {
        self.window = window
        self.loginRepository = loginRepository
        self.dependencies = dependencies
        self.delegate = delegate
    }
    
    func start() {
        window.rootViewController = setTabBarController()
    }
    
    private func setTabBarController() -> UITabBarController {
        let tabBarController = dependencies.makeTabBarController()
        var controllers: [UIViewController] = []
        
        let imageListController = makeImageListView()
        let userInfoController = makeUserInfoView()
        
        controllers.append(imageListController)
        controllers.append(userInfoController)
        
        tabBarController.setViewControllers(controllers, animated: true)
        
        return tabBarController
    }
    
    private func makeImageListView() -> UIViewController {
        let container = dependencies.makeImageListDIContainer()
        let coordinator = container.makeImageListFlowCoordinator()
        coordinator.start()
        let controller = coordinator.navigationController
        controller.tabBarItem = UITabBarItem(title: "Image", image: UIImage(named: "list.bullet.rectangle.portrait"), tag: 0)
        return controller
    }
    
    private func makeUserInfoView() -> UIViewController {
        let container = dependencies.makeUserInfoDIConatiner()
        let coordinator = container.makeUserInfoCoordinator(loginRepository: loginRepository, delegate: self)
        coordinator.start()
        let controller = coordinator.navigationController
        controller.tabBarItem = UITabBarItem(title: "UserInfo", image: UIImage(named: "person.circle.fill"), tag: 1)
        return controller
    }
    
}

extension TabBarCoordinator: UserInfoFlowCoordinatorDelegate {
    func goLoginView() {
        delegate?.showLoginView()
    }
}
