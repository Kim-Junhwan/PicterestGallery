//
//  ImageListViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/15.
//

import Foundation
import UIKit

final class ImageListViewController: UIViewController, StoryboardInstatiable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func create() -> ImageListViewController{
        let view = ImageListViewController.create()
        return view
    }
}
