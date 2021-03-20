//
//  Formato.swift
//  Mar-iguana Tours
//
//  Created by Diana on 15/03/21.
//

import UIKit
import Foundation

class FormatUtils{
    
    //Formato para boton habilitado
    static func formatButtonEnabled(button: UIButton){
        button.isEnabled = true
        button.frame.size.height = 45
        button.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#00A550")
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
        button.tintColor = UIColor.white
    }
    
    //Formato para boton deshabilitado
    static func formatButtonDisabled(button: UIButton){
        button.isEnabled = false
        button.frame.size.height = 45
        button.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#949494")
        button.tintColor = UIColor.white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 5
    }
    
    //Formato de barra de navegacion
    static func formatNavBar(navBar: UINavigationBar){
        navBar.barStyle = UIBarStyle.black
        navBar.backgroundColor = ColorUtils.hexStringToUIColor(hex: "#949494")
        navBar.tintColor = UIColor.white
        
    }
}
