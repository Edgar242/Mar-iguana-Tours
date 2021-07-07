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
    var dataManager = SeatDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        seatView.config = SeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager

        let mock = MockSeatCreater()
        
        // First Passanger Bus
        let first = mock.create(count: 45)
        
        // Second Passanger Bus
        // let second = mock.create(count: 40)
        
        dataManager.seatList = [first]
        seatView?.reload()
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
