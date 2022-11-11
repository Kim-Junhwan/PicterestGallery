//
//  TabBarController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/09.
//

import UIKit

class TabBarController: UITabBarController, StoryboardInstatiable {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    static func create() -> UITabBarController {
        let view = TabBarController.instantiateViewController()
    
        return view
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
