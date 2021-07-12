//
//  NavigationControllerProfile.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 18/03/21.
//

import UIKit
import FirebaseAuth

class NavigationControllerProfile: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if Auth.auth().currentUser != nil {
            Utilities.switchRootController(navController: self, Constants.Storyboard.vcProfile)
            return
        }
        Utilities.switchRootController(navController: self, Constants.Storyboard.vcLoginOrRegister)
        return
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
