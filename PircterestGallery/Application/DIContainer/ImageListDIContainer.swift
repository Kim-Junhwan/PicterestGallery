//
//  ImageListDIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/18.
//

import Foundation
import UIKit

final class ImageListDIContainer {
    func makeImageListFlowCoordinator() -> ImageListFlowCoordinator {
        return ImageListFlowCoordinator(navigationController: UINavigationController(), dependencies: self)
    }
    
    func makeImageListViewModel() -> ImageListViewModel {
        return DefaultImageListViewModel()
    }
}

extension ImageListDIContainer: ImageListFlowCoordinatorDependencies {
    func makeImageListViewController() -> ImageListViewController {
        return ImageListViewController.create(viewModel: makeImageListViewModel())
    }
    
}
