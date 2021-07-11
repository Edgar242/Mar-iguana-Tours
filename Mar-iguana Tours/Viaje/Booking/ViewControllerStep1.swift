//
//  ViewControllerStep1.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 15/06/21.
//

import UIKit
import ALBusSeatView

class ViewControllerStep1: UIViewController {

    @IBOutlet weak var seatView: ALBusSeatView!
    @IBOutlet weak var seatCount: UILabel!
    var dataManager = SeatDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBusSeat()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateSeatNumberBooked(Notification:)),
            name: Notification.Name(rawValue: "asientoModificado"),
            object: nil
        )
    }
    
    func setupBusSeat() {
        seatView.config = SeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager

        let mock = MockSeatCreater()
        
        // Define the quantity of seats for each passenger bus
        let firstBus = mock.create(count: 45)
        // let secondBus = mock.create(count: 40)
        
        // Set the passegenr bus to the list
        dataManager.seatList = [firstBus]
        seatCount.text = "Asientos seleccionados: \(seatsBooked.count)"
        seatView?.reload()
    }
    
    @objc func updateSeatNumberBooked(Notification: NSNotification) {
        seatCount.text = "Asientos seleccionados: \(seatsBooked.count)"
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
