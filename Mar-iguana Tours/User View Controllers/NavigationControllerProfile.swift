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
            loadViewController(identifier: Constants.Storyboard.viewControllerProfile)
            return
        } else {
            loadViewController(identifier: Constants.Storyboard.navControllerProfile)
            return
        }
    }
    
    func loadViewController(identifier: String) {
        let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoardMain.instantiateViewController(identifier: identifier)
        view.window?.rootViewController = viewController
        
        show(viewController, sender: nil)
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
