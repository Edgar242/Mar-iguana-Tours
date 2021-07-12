//
//  TabBarInitViewController.swift
//  Mar-iguana Tours
//
//  Created by Diana Morales on 02/07/21.
//

import UIKit

class TabBarInitViewController:UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Tab bar item
    override func viewDidLayoutSubviews() {
        tabBar.tintColor = ColorUtils.hexStringToUIColor(hex: "#39985E")
        super.viewDidLayoutSubviews()
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
