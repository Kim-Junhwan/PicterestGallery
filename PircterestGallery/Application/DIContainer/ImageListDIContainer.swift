//
//  ImageListDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/18.
//

import Foundation
import UIKit
import Moya

final class ImageListDIContainer {
    func makeImageListFlowCoordinator() -> ImageListFlowCoordinator {
        return ImageListFlowCoordinator(navigationController: UINavigationController(), dependencies: self)
    }
    
    func makeImageListViewModel() -> ImageListViewModel {
        return DefaultImageListViewModel(searchImageUseCase: DefaultSearchImageUseCase(provider: makeNetworkServiceMoyaProvider()))
    }
    
    func makeNetworkServiceMoyaProvider() -> MoyaProvider<NetworkService> {
        return MoyaProvider<NetworkService>()
    }
}

extension ImageListDIContainer: ImageListFlowCoordinatorDependencies {
    func makeImageListViewController() -> ImageListViewController {
        return ImageListViewController.create(viewModel: makeImageListViewModel())
    }
    
}
