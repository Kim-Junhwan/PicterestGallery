//
//  StoryboardInsantiable.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/31.
//

import Foundation
import UIKit

public protocol StoryboardInstatiable: NSObjectProtocol {
    associatedtype T
    static var defaultFileName: String {get}
    static func instantiateViewController(_ bundle: Bundle?) -> T
}

public extension StoryboardInstatiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = defaultFileName
        let storyboard = UIStoryboard(name: fileName, bundle: bundle)
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Cannot istantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
        }
        return vc
    }
}

