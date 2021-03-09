//
//  Utilities.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import Foundation

class Utilities {
    static var errorTextFieldEmpty = "Por favor llene todos los campos"
    
    static func validateTextField(_ textField: UITextField) -> String? {
        guard textField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" else {
            return nil
        }
        
        return errorTextFieldEmpty
    }
}
