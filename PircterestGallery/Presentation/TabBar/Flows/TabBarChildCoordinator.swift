//
//  TabBarChildCoordinator.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/18.
//

import Foundation
import UIKit

protocol TabBarChildCoordinator: Coordinator {
    var navigationController: UINavigationController { get set }
}
