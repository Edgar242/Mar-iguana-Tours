//
//  ViewControllerLogin.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit

class ViewControllerLogin: UIViewController {

    @IBOutlet weak var textFieldEmail: FloatinLabelInput!
    @IBOutlet weak var textFieldPassword: FloatinLabelInput!
    @IBOutlet var allTextFields: [UITextField]!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBAction func onLogin(_ sender: UIButton) {
        // Go to user profile
        Utilities.switchRootController(navController: navigationController, Constants.Storyboard.vcProfile)
    }
    
    // Detects when the user tap (pressed) on the view
    @IBAction func onTapView(){
        view.endEditing(true)
        
        // Enable Login button if the text fields are valid
        // TODO: Check if email and password is valid
        if validateFields() {
            FormatUtils.formatButtonEnabled(button: buttonLogin)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Clear text fields
        textFieldEmail.tipoDato = FloatinLabelInput.tipoEmail
        textFieldPassword.tipoDato = FloatinLabelInput.tipoPasswd
        
        // Load text styles
        FormatUtils.formatButtonDisabled(button: buttonLogin)
        
        textFieldEmail.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        textFieldPassword.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
    }
    
    func setupElements() {

    }
    
    @objc func habilitaBoton() {
        if !textFieldEmail.hasError && !textFieldPassword.hasError {
            FormatUtils.formatButtonDisabled(button: buttonLogin)
        } else {
            FormatUtils.formatButtonEnabled(button: buttonLogin)
        }
        
    }
    
    
    func validateFields() -> Bool {
        for textField in allTextFields {
            let error = Utilities.validateTextField(textField)
            if error != nil {
                // Display error message
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
