//
//  ViewControllerProfile.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit

class ViewControllerProfile: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sexoLabel: UILabel!
    @IBOutlet weak var fechaNacLabel: UILabel!
    @IBOutlet weak var passwdLabel: UILabel!
    
    @IBOutlet weak var salirButton: UIButton!
        
    @IBOutlet weak var tituloNavBar: UINavigationBar!
    
    var nombrePropertie:String = ""
    var telefonoPropertie:String = ""
    var emailPropertie:String = ""
    var sexoPropertie:String = ""
    var fechaNacPropertie:String = ""
    var passwdPropertie:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FormatUtils.formatButtonEnabled(button: salirButton)
        FormatUtils.formatNavBar(navBar:tituloNavBar)
        
        //Icono editar
        let editarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.edit, target: self, action: #selector(editar))
        tituloNavBar.topItem?.rightBarButtonItem = editarButton
        
        //Forma redondeada de imagen
        userPhoto.layer.cornerRadius = userPhoto.bounds.size.width/2.0
        userPhoto.layer.borderWidth = 1.0
       
        
        //Aqui tendría que recuperar los datos del usuario y asignarlos
        //a cada propiedad cuando se llegue a esta vista de un origen
        //diferente a la vista de registro
        
        //Asigna los valores de las propiedades a cada etiqueta
        nombreLabel.text = nombrePropertie
        telefonoLabel.text = telefonoPropertie
        emailLabel.text = emailPropertie
        sexoLabel.text = sexoPropertie
        fechaNacLabel.text = fechaNacPropertie
        passwdLabel.text = "********"
        
        //Si no se encuentra imagen asigna la de default
        userPhoto.image = UIImage(named: "imgUserDefault")
    }
    
    @objc func editar (){
        
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
