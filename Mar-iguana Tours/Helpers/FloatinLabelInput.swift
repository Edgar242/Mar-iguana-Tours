//
//  FloatinLabelInput.swift
//  Mar-iguana Tours
//
//  Created by Diana on 11/03/21.
//

import UIKit

class FloatinLabelInput: UITextField {

    //Etiqueta nombre de campo
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    
    //Etiqueta de error
    var errorLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    
    //Altura de etiqueta
    var floatingLabelHeight: CGFloat = 14 // Default height
    
    //Indica el tipo de dato a valida
    @IBInspectable
    var tipoDato:String?
    
    //place holder que se indicará en la parte superior del campo, si no se indica toma el que trae configurado
    @IBInspectable
    var _placeholder: String?
    
    //Indica si el campo tiene un error de validacion
    @IBInspectable
    var hasError: Bool = true
    
    //Color de etiqueta de nombre de campo
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.darkGray {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    //Color del borde del campo cuando esta activo
    @IBInspectable
    var activeBorderColor: UIColor = UIColor.lightGray
    
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 13) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    //Inicializa el textField y suscribe tres eventos: inicio de edicion, fin de edicion y cambios al editar
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBorderStyle()
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder
        placeholder = self._placeholder
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
        self.addTarget(self, action: #selector(self.addErrorLbl), for: .editingChanged)
    }
    
    
    //Agregar la etiqueta de error despues de hacer la validación de acuerdo al tipo de dato
    @objc func addErrorLbl() {
        let mensaje = Validate.validateTextField(tipoDato: self.tipoDato ?? "", dato: self.text ?? "")
        if mensaje != "" {
            self.errorLabel.alpha = 1
            self.errorLabel.font = UIFont.systemFont(ofSize: 13)
            self.errorLabel.textColor = UIColor.red
            self.errorLabel.text = mensaje
            self.errorLabel.layer.backgroundColor = UIColor.white.cgColor
            self.errorLabel.translatesAutoresizingMaskIntoConstraints = false
            self.errorLabel.clipsToBounds = true
            self.errorLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.errorLabel)
            self.errorLabel.topAnchor.constraint(equalTo:
                                                    self.bottomAnchor, constant: -1).isActive = true
            hasError = true
        }
        else{
            self.errorLabel.alpha = 0
            hasError = false
        }
        self.setNeedsDisplay()
    }
    
    // Agrega etiqueta con nombre del campo
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self._placeholder
            self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.activeBorderColor.cgColor
            self.addSubview(self.floatingLabel)
          
            self.floatingLabel.bottomAnchor.constraint(equalTo:
            self.topAnchor, constant: -1).isActive = true // Place our label 10pts above the text field
            // Remove the placeholder
            self.placeholder = ""
        }
        self.setNeedsDisplay()
    }
    
    //Elimina la etiqueta del nmbre de campo y agrega la etiqueta de error en caso de ser necesario
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.13) {
               self.subviews.forEach{ $0.removeFromSuperview() }
               self.setNeedsDisplay()
            }
            self.placeholder = self._placeholder
        }
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        //Si hay mensaje de error muestra etiqueta
        addErrorLbl()
    }

    //Estilo del borde
    func setBorderStyle(){
        self.font = UIFont.systemFont(ofSize: 15)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 5
        self.borderStyle = UITextField.BorderStyle.roundedRect
    }
}
