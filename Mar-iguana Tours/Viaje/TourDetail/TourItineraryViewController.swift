//
//  TourItineraryViewController.swift
//  Mar-iguana Tours
//
//  Created by Diana Morales on 01/07/21.
//

import UIKit

class TourItineraryViewController: UIViewController {

    var itinerary:[String] = [String]()
    
    @IBOutlet weak var txtViewItinerary: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var places = ""
        for place in itinerary{
            places = places + " " + place + "\n\n"
        }
        
        txtViewItinerary.text = places
    }
}
