//
//  Utilities.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import Foundation

class Utilities {    
    static func printDocumentsDir() {
        return print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Documents directory not Found!")
    }
    
    static func switchRootController(navController: UINavigationController?, _ identifier: String) {
        let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoardMain.instantiateViewController(identifier: identifier)
        navController?.setViewControllers([viewController], animated: true)
        
        // This is needed when this function is called from NavigationControllerProfile
        navController?.isNavigationBarHidden = false
    }
    
    static func showAlert(context: UIViewController, message: String) {
        let ac = UIAlertController(title: "RESULTADO", message: message, preferredStyle: .alert)
        let aa = UIAlertAction(title: "ok", style: .default, handler: nil)
        ac.addAction(aa)
        context.present(ac, animated:true)
    }
    
}
