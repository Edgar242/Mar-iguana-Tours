//
//  ViewControllerRegister.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ViewControllerRegister: UIViewController {
    
    var gender = "M"

    @IBOutlet weak var scrollView: UIScrollView!
    var tecladoArriba = false
    
    @IBOutlet var genderSwitch: UISwitch!
    
    @IBOutlet weak var nombreTextField: FloatinLabelInput!
    @IBOutlet weak var apellidosTextField: FloatinLabelInput!
    @IBOutlet weak var emailTextField: FloatinLabelInput!
    @IBOutlet weak var telefonoTextFiled: FloatinLabelInput!
    @IBOutlet weak var passwdTextField: FloatinLabelInput!
        
    @IBOutlet weak var registroButton: UIButton!
    
    //Cierra el teclado al hacer gesto tap en la vista
    @IBAction func tabEnVista(){
        view.endEditing(true)
    }
    
    @IBAction func switchChanger(_ sender: UISwitch){
        if sender.isOn{
            self.gender = "F"
        }else{
            self.gender = "M"
        }
    }
    
    @IBAction func onRegister(_ sender: UIButton) {
        
        Auth.auth().createUser(withEmail: (emailTextField.text)!, password: (passwdTextField.text)!) { (result, error) in
            
            if error != nil {
                let alertController = UIAlertController(title: "Error:", message: "No se ha podido registrar", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                
                self.present(alertController,  animated: true,  completion: nil)
            }else{
                guard let uID = result?.user.uid else { return }
                let dbReference = Database.database().reference().child("User")
                let userDB = dbReference.child(uID)
                userDB.child("name").setValue(self.nombreTextField.text)
                userDB.child("lastname").setValue(self.apellidosTextField.text)
                userDB.child("phone_number").setValue(self.telefonoTextFiled.text)
                userDB.child("gender").setValue(self.gender)
                
                Utilities.switchRootController(navController: self.navigationController, Constants.Storyboard.vcProfile)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Especifica que tipo de dato se va a validar
        nombreTextField.tipoDato = FloatinLabelInput.tipoNone
        apellidosTextField.tipoDato = FloatinLabelInput.tipoNone
        emailTextField.tipoDato = FloatinLabelInput.tipoEmail
        telefonoTextFiled.tipoDato = FloatinLabelInput.tipoPhone
        passwdTextField.tipoDato = FloatinLabelInput.tipoPasswd
        
        //Inicia con bot??n deshabilitado        
        FormatUtils.formatButtonDisabled(button: registroButton)
        
        //Responde al evento cuando se termina de editar un campo
        nombreTextField.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        apellidosTextField.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        emailTextField.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        telefonoTextFiled.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        passwdTextField.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
    }
    
    //Habilita o deshabilita el boton
    @objc func habilitaBoton () {
        if(!nombreTextField.hasError && !apellidosTextField.hasError && !emailTextField.hasError && !telefonoTextFiled.hasError && !passwdTextField.hasError){
            FormatUtils.formatButtonEnabled(button: registroButton)
        }
        else{
            FormatUtils.formatButtonDisabled(button: registroButton)
        }
    }
    
    //suscribe el evento del teclado
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector:#selector(tecladoAparece), name:UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(tecladoDesaparece), name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    //Funcion que ajusta el scroll cuando el teclado aparece
    @objc func tecladoAparece (notificacion: Notification) {
        if tecladoArriba {
            return
        }
        
        tecladoArriba = true
        // Obtenemos el tama??o final del teclado
        if let tamanioTeclado = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // aumentamos el tama??o del content del scrollview, para que haga scroll y libre el teclado
            scrollView.contentSize.height += tamanioTeclado.height
        }
    }
        
    //Funcion que ajusta el scroll cuando el teclado desaparece
    @objc func tecladoDesaparece (notificacion: Notification) {
        if !tecladoArriba {
            return
        }
        tecladoArriba = false
        
        // Obtenemos el tama??o final del teclado
        if let tamanioTeclado = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // reducimos el tama??o del content, para que ya no haga scroll cuando se oculte el teclado
            scrollView.contentSize.height -= tamanioTeclado.height
        }
    }
    
    //elimina la suscripcion como observador
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
}
