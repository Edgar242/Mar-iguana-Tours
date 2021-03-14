//
//  ViewControllerLogin.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet var allTextFields: [UITextField]!
    @IBOutlet weak var labelError: UILabel!
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        _ = validateFields()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupElements()
    }
    
    func setupElements() {
        
        labelError.alpha = 0
        
        // Load text styles from Utilities
    }
    
    func validateFields() -> Bool {
        labelError.alpha = 0
        for textField in allTextFields {
            let error = Utilities.validateTextField(textField)
            if error != nil {
                // Display error message
                labelError.alpha = 1.0
                labelError.text = error
                return false
            }
        }
        return true
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
