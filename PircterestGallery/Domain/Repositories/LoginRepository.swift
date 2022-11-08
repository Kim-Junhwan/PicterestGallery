//
//  LoginRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/30.
//

import Foundation
import UIKit

protocol LoginRepository {
    typealias loginResult = (Result<User, Error>)->()
    func login(vc: UIViewController?, completion: @escaping loginResult)
    func logout()
    func autoLogin(completion: @escaping loginResult)
    func getUserInfo(completion: @escaping(User)->())
}
