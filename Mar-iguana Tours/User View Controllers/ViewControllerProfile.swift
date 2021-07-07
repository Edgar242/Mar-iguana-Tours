//
//  ViewControllerProfile.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ViewControllerProfile: UIViewController {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var telefonoLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sexoLabel: UILabel!
    @IBOutlet weak var viajesLabel: UILabel!
    
    @IBOutlet weak var salirButton: UIButton!
        
    @IBOutlet weak var tituloNavBar: UINavigationBar!
    
    var nombrePropertie:String = ""
    var telefonoPropertie:String = ""
    var emailPropertie:String = ""
    var sexoPropertie:String = ""
    var passwdPropertie:String = ""
    
    @IBAction func onLogOut(_ sender: UIButton) {
        
        do{
            try
                Auth.auth().signOut()
        }catch let error {
            print(error)
        }
        
        Utilities.switchRootController(navController: navigationController, Constants.Storyboard.vcLoginOrRegister)
    }
    
    let uID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FormatUtils.formatButtonEnabled(button: salirButton)
        
        //Forma redondeada de imagen
        userPhoto.layer.cornerRadius = userPhoto.bounds.size.width/2.0
        userPhoto.layer.borderWidth = 1.0

        
        //Aqui tendría que recuperar los datos del usuario y asignarlos
        //a cada propiedad cuando se llegue a esta vista de un origen
        //diferente a la vista de registro
        
        
        let dbReference = Database.database().reference().child("User")
        let userDB = dbReference.child(self.uID ?? "aaaaaa")
        
        userDB.child("name").observeSingleEvent(of: .value){
            (snapshot) in
            guard let name = snapshot.value as? String else {return}
            self.nombreLabel.text = name
        }
        
        userDB.child("phone_number").observeSingleEvent(of: .value){
            (snapshot) in
            guard let number = snapshot.value as? String else {return}
            self.telefonoLabel.text = number
        }
        
        userDB.child("gender").observeSingleEvent(of: .value){
            (snapshot) in
            guard let gender = snapshot.value as? String else {return}
            self.sexoLabel.text = gender
        }
        
        userDB.child("viajes").observeSingleEvent(of: .value){
            (snapshot) in
            
            guard let viajes = snapshot.value as? NSArray else {return}
            var travelHistory = ""
            for viaje in viajes{
                if let travel = viaje as? NSDictionary{
                    travelHistory += travel["title"] as? String ?? ""
                    travelHistory += "\n"
                }
            }
            self.viajesLabel.text = travelHistory
        }
        
        emailLabel.text = Auth.auth().currentUser?.email
        
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
