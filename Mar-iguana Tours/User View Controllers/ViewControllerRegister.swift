//
//  ViewControllerRegister.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit

class ViewControllerRegister: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    var tecladoArriba = false
    
    @IBOutlet weak var nombreTextField: FloatinLabelInput!
    @IBOutlet weak var apellidosTextField: FloatinLabelInput!
    @IBOutlet weak var emailTextField: FloatinLabelInput!
    @IBOutlet weak var telefonoTextFiled: FloatinLabelInput!
    @IBOutlet weak var passwdTextField: FloatinLabelInput!
        
    @IBOutlet weak var registroButton: UIButton!
    
    @IBOutlet weak var navBarRegistro: UINavigationBar!
    
    //Cierra el teclado al hacer gesto tap en la vista
    @IBAction func tabEnVista(){
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FormatUtils.formatNavBar(navBar: navBarRegistro)
        
        //Especifica que tipo de dato se va a validar
        nombreTextField.tipoDato = ""
        apellidosTextField.tipoDato = ""
        emailTextField.tipoDato = "email"
        telefonoTextFiled.tipoDato = "phone"
        passwdTextField.tipoDato = "passwd"
        
        //Inicia con botón deshabilitado        
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
        print("Entra a validar campos")
        print(nombreTextField.hasError)
        print(apellidosTextField.hasError)
        print(emailTextField.hasError)
        print(telefonoTextFiled.hasError)
        print(passwdTextField.hasError)
        
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
        print ("el teclado subió")
        // Obtenemos el tamaño final del teclado
        if let tamanioTeclado = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // aumentamos el tamaño del content del scrollview, para que haga scroll y libre el teclado
            scrollView.contentSize.height += tamanioTeclado.height
        }
    }
        
    //Funcion que ajusta el scroll cuando el teclado desaparece
    @objc func tecladoDesaparece (notificacion: Notification) {
        print ("el teclado se fue")
        tecladoArriba = false
        
        // Obtenemos el tamaño final del teclado
        if let tamanioTeclado = (notificacion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            // reducimos el tamaño del content, para que ya no haga scroll cuando se oculte el teclado
            scrollView.contentSize.height -= tamanioTeclado.height
        }
    }
    
    //Manda los datos a siguiente vista
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ViewControllerProfile {
            let vc = segue.destination as? ViewControllerProfile
            let nombre = nombreTextField.text ?? Constants.cadenaVacia
            let apellidos = apellidosTextField.text ?? Constants.cadenaVacia
            vc?.nombrePropertie = nombre + " " + apellidos
            vc?.emailPropertie = emailTextField.text ?? Constants.cadenaVacia
            vc?.telefonoPropertie = telefonoTextFiled.text ?? Constants.cadenaVacia
            vc?.sexoPropertie = "--"
            vc?.fechaNacPropertie = "--"
        }
    }
    
    //elimina la suscripcion como observador
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
}