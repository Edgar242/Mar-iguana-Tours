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
        let userIsLoggedIn = false
        if userIsLoggedIn {
            // Skip login or resgistration and go to user Profile
            switchView(Constants.Storyboard.viewControllerProfile)
        } else {
            switchView(Constants.Storyboard.viewControllerLoginOrRegister)
        }
    }
    
    func switchView(_ identifier: String) {
        let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoardMain.instantiateViewController(withIdentifier: identifier)
        navigationController?.setViewControllers([viewController], animated: true)
        navigationController?.isNavigationBarHidden = false
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
