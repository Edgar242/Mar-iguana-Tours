//
//  Utilities.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import Foundation

class Utilities {
    static let errorTextFieldEmpty = "Por favor llene todos los campos"
    
    static func validateTextField(_ textField: UITextField) -> String? {
        // Check if is not empty
        guard textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" else {
            return nil
        }
        
        return errorTextFieldEmpty
    }
    
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
}
