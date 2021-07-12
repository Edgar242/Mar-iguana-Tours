//
//  ViewControllerStep2.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 15/06/21.
//

import UIKit

class ViewControllerStep2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var labelDepartureDate: UILabel!
    @IBOutlet weak var labelDestiny: UILabel!
    @IBOutlet weak var labelPromo: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var switchPromo: UISwitch!
    @IBOutlet weak var tableViewExtras: UITableView!
    
    var total = 0
    var discount = 0
    var currentExtra = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        
        // Add observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateTotal(notification:)),
            name: notificationBookedSeatDidChange,
            object: nil
        )
    }
    
    func setupLabels() {
        // Get discount
        discount = Int(selectedTour.promo.components(separatedBy: "|")[1]) ?? 0
        currentExtra = Int(selectedTour.roomOptions[0].components(separatedBy: "|")[1]) ?? 0
        
        labelDepartureDate.text = selectedTour.dates[0] + " - " + selectedTour.dates[1]
        labelDestiny.text = selectedTour.title
        labelPromo.text = selectedTour.promo.components(separatedBy: "|")[0]
       
        total = selectedTour.price * seatsBooked.count
        labelTotal.text = "Total: \(seatsBooked.count) x $\(selectedTour.price) = $\(total)MXN"
    }
    
    @objc func updateTotal(notification: NSNotification) {
        update()
    }
    
    @IBAction func switchDidChanged(_ sender: UISwitch) {
        update()
    }
    
    func update() {
        total = seatsBooked.count * (selectedTour.price + (switchPromo.isOn ? discount : 0) + currentExtra)
        let discountString = switchPromo.isOn ? String(discount): ""
        let extraString = currentExtra != 0 ? "+\(currentExtra)" : ""
        labelTotal.text = "Total: \(seatsBooked.count) x ($\(selectedTour.price)\(discountString)\(extraString)) = $\(total)MXN"
    }
    
    // Mark:
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedTour.roomOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = selectedTour.roomOptions[indexPath.row].components(separatedBy: "|")[0] + "\r\n$\(currentExtra)MXN"
        cell.accessoryType = indexPath.row == 0 ? UITableViewCell.AccessoryType.checkmark : UITableViewCell.AccessoryType.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        // Set checkmark for current selected row and uncheck other
        for row in 0...selectedTour.roomOptions.count {
            let indexP = IndexPath(row: row, section: indexPath.section)
            if indexPath.row == row {
                tableView.cellForRow(at: indexP)?.accessoryType = UITableViewCell.AccessoryType.checkmark
                currentExtra = Int(selectedTour.roomOptions[row].components(separatedBy: "|")[1]) ?? 0
                continue
            }
            tableView.cellForRow(at: indexP)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        
        update()
    }
}
