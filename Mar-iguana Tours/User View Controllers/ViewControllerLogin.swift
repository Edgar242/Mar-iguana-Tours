//
//  ViewControllerLogin.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import AVKit
import FirebaseAnalytics
import FirebaseAuth

class ViewControllerLogin: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?

    @IBOutlet weak var textFieldEmail: FloatinLabelInput!
    @IBOutlet weak var textFieldPassword: FloatinLabelInput!
    @IBOutlet var allTextFields: [UITextField]!
    
    @IBOutlet weak var buttonLogin: UIButton!
    
    @IBAction func onLogin(_ sender: UIButton) {
        
        if let email = textFieldEmail.text, let password = textFieldPassword.text{
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
                if (result != nil), err == nil {
                    
                    // Go to user profile
                    Utilities.switchRootController(navController: self.navigationController, Constants.Storyboard.vcProfile)
                }else{
                    let alertController = UIAlertController(title: "Error:", message: "No se ha podido ingresar", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController,  animated: true,  completion: nil)
                    
                }
            }
        }
        
    }
    
    // Detects when the user tap (pressed) on the view
    @IBAction func onTapView(){
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("Conexión", parameters: ["message":"Integrado"])

        setupElements()
//        setupVideo()
        
        // Set Theme colors
        Utilities.setMyThemeColors(navigationController: navigationController)
    }
    
    func setupElements() {
        // Clear text fields
        textFieldEmail.tipoDato = FloatinLabelInput.tipoEmail
        textFieldPassword.tipoDato = FloatinLabelInput.tipoPasswd
        
        // Load text styles
        FormatUtils.formatButtonDisabled(button: buttonLogin)
        
        textFieldEmail.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
        textFieldPassword.addTarget(self, action: #selector(habilitaBoton), for: .editingDidEnd)
    }
    
    func setupVideo() {
        // Get the path to the resource in the bundle
        let videoPath = Bundle.main.path(forResource: "Surf", ofType: "mp4")
        guard videoPath != nil else {
            return
        }
        
        // Create a URL from path
        let url = URL(fileURLWithPath: videoPath!)
        
        // Create the video player item
        let item = AVPlayerItem(url: url)
        
         
        // Create the player
        videoPlayer = AVPlayer(playerItem: item)
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width*4.1, height: self.view.frame.size.height)
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        videoPlayer?.playImmediately(atRate: 0.5)
    }
    
    @objc func habilitaBoton() {
        if !textFieldEmail.hasError && !textFieldPassword.hasError {
            FormatUtils.formatButtonEnabled(button: buttonLogin)
        } else {
            FormatUtils.formatButtonDisabled(button: buttonLogin)
        }
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
