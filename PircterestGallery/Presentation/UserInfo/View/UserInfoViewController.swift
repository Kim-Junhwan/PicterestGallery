//
//  UserInfoViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/09.
//

import UIKit

class UserInfoViewController: UIViewController, StoryboardInstatiable {
    
    var userInfoViewModel: UserInfoViewModel?
    @IBOutlet weak var userProfileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    static func create(viewModel: UserInfoViewModel)-> UserInfoViewController {
        let vc = UserInfoViewController.instantiateViewController()
        vc.userInfoViewModel = viewModel
        return vc
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didTapLogout(_ sender: UIButton) {
        userInfoViewModel?.didLogOut()
    }
}
