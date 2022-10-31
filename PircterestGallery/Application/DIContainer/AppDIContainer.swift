//
//  DIContainer.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation

final class AppDIContainer {
    func makeLoginDIContainer() -> LoginDIContainer {
        return LoginDIContainer()
    }
}
