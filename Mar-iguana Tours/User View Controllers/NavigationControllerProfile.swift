//
//  NavigationControllerProfile.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 18/03/21.
//

import UIKit

class NavigationControllerProfile: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // TODO: Check if user is logged in via JSON file
        let userIsLoggedIn = true
        if userIsLoggedIn {
            loadView(Constants.Storyboard.viewControllerProfile)
        } else {
            loadView(Constants.Storyboard.navControllerProfile)
        }
    }
    
    func loadView(_ identifier: String) {
        let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoardMain.instantiateViewController(identifier: identifier)
        navigationController?.setViewControllers([viewController], animated: true)
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
