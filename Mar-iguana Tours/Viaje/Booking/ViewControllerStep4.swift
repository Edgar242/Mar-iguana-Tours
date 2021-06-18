//
//  ViewControllerStep4.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 15/06/21.
//

import UIKit

class ViewControllerStep4: UIViewController {
    
    let imagePicker: UIImagePickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Take photo with camera
    @IBAction func takePhotoAction(_ sender: AnyObject) {
        //If camera is available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.cameraCaptureMode = .photo
                present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    //Select existing photo from gallery
    @IBAction func selectPhotoAction(_ sender: Any) {
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
