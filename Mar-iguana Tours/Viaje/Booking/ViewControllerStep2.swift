//
//  ViewControllerStep2.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 15/06/21.
//

import UIKit

class ViewControllerStep2: UIViewController {

    @IBOutlet weak var labelDepartureDate: UILabel!
    @IBOutlet weak var labelDestiny: UILabel!
    @IBOutlet weak var labelPromo: UILabel!
    @IBOutlet weak var labelExtras: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var switchPromo: UISwitch!
    
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup labels
        labelDepartureDate.text = selectedTour.dates[0] + " - " + selectedTour.dates[1]
        labelDestiny.text = selectedTour.title
        labelPromo.text = selectedTour.promo.components(separatedBy: "|")[0]
        labelExtras.text = selectedTour.roomOptions[0].components(separatedBy: "|")[0]
        
        total = selectedTour.price * seatsBooked.count
        labelTotal.text = "Total: \(seatsBooked.count) x $\(selectedTour.price) = $\(total)MXN"
        
        // Add observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTotal(notification:)),
            name: Notification.Name(rawValue: "asientoModificado"),
            object: nil
        )
    }
    
    @objc func updateTotal(notification: NSNotification) {
        update()
    }
    
    @IBAction func switchDidChanged(_ sender: UISwitch) {
        update()
    }
    
    func update() {
        let discount = Int(selectedTour.promo.components(separatedBy: "|")[1]) ?? 0
        total = seatsBooked.count * (selectedTour.price + (switchPromo.isOn ? discount : 0))
        
        labelTotal.text = "Total: \(seatsBooked.count) x $\(selectedTour.price)\(switchPromo.isOn ? String(discount): "") = $\(total)MXN"
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
