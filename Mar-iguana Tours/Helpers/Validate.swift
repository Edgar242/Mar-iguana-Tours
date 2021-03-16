//
//  Validate.swift
//  Mar-iguana Tours
//
//  Created by Diana on 15/03/21.
//


import UIKit
import Foundation

class Validate{
    
    //Valida una cadena de texto y devuelve el mensaje de error
    static func validateTextField(tipoDato: String, dato:String) -> String{
        let format = "SELF MATCHES %@"
        var regex = "";
        var mensaje = "";
        
        if(tipoDato == "phone"){
            regex = "[0-9]{10}"
            mensaje = "Introduce tu número a 10 dígitos"
        }
        else if(tipoDato == "email"){
            regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            mensaje = "Introduce una dirección válida"
        }
        else if(tipoDato == "passwd"){
            if(dato.count < 8){
                mensaje = "Longitud minima de 8 caracteres"
            }
        }
        else{
            if(dato.isEmpty){
                mensaje = "Dato requerido"
            }
        }
        
        //Si especifica regex y pasa la validacion
        if(!regex.isEmpty && NSPredicate(format: format, regex).evaluate(with: dato)){
            mensaje = ""
        }
        
        return mensaje
    }
}
