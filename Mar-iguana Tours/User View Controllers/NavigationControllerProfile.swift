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
            // If user is logged in then load its profile
            Utilities.switchRootController(navController: self, Constants.Storyboard.vcProfile)
        } else {
            Utilities.switchRootController(navController: self, Constants.Storyboard.vcLoginOrRegister)
        }
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
