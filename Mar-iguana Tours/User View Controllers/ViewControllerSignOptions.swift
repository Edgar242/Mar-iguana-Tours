//
//  ViewControllerSignOptions.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 09/03/21.
//

import UIKit
import AVKit

class ViewControllerSignOptions: UIViewController {
    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //super.viewWillAppear(animated)

        // TODO: Check if user is logged in via plist
        let userIsLoggedIn = false
        if userIsLoggedIn {
            self.transitionToUserProfile()
            return
        }
        setupVideo()
    }
    
    func transitionToUserProfile() {
      
        let storyBoardMain = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoardMain.instantiateViewController(identifier: Constants.Storyboard.viewControllerProfile) //as! ViewControllerUserProfile
        view.window?.rootViewController = viewController
        
        // This code does not work
        //present(viewController, animated: true, completion: nil)
        
        show(viewController, sender: nil)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
