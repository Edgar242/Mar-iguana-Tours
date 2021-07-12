//
//  TourItineraryViewController.swift
//  Mar-iguana Tours
//
//  Created by Diana Morales on 01/07/21.
//

import UIKit

class TourInfoViewController: UIViewController {

    var tourSelected:Tour?
    
    @IBOutlet weak var lblPeriod: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblPromo: UILabel!
    @IBOutlet weak var txtViewInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = tourSelected?.title
        lblPeriod.text = (tourSelected?.dates[0])! + " - " + (tourSelected?.dates[1])!
        lblPrice.text = "$ " + String(tourSelected!.price)
        
        let infoPromo = tourSelected?.promo.components(separatedBy: "|")
        
        lblPromo.text = infoPromo?[0]
        txtViewInfo.text = tourSelected?.info
        
    }
}
