//
//  LoginButtonStackView.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

class LoginButtonController: UIStackView {
    
    override func draw(_ rect: CGRect) {
        let loginButton = self.subviews.filter($0 is UIButton)
    }
}
