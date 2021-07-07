//
//  ViewControllerStep1.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 15/06/21.
//

import UIKit
import ALBusSeatView

class ViewControllerStep1: UIViewController {

    @IBOutlet var seatView: ALBusSeatView!
//    var seatView = ALBusSeatView()
    var dataManager = SeatDataManager()
//    seatView.delegate = self
//    seatView.dataSource = self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        seatView.config = ExampleSeatConfig()
        seatView.delegate = dataManager
        seatView.dataSource = dataManager
        
        let mock = MockSeatCreater()
        let first = mock.create(count: 45)
        let second = mock.create(count: 45)
        dataManager.seatList = [first,second]
        seatView?.reload()
    }
    
//    func seatView(_ seatView: ALBusSeatView, numberOfSeatInSection section: Int) -> Int {
//         return 43 // Total seat count
//    }
//
//    func seatView(_ seatView: ALBusSeatView, seatNumberForIndex indexPath: IndexPath) -> String {
//        return "10" // Seat Number
//    }
//
//    func seatView(_ seatView: ALBusSeatView,
//                  seatTypeForIndex indexPath: IndexPath) -> ALBusSeatType {
//
//        return .empty
//    }
//
//
//    // Seat Types
//
//    public enum ALBusSeatType: Int {
//        /// Free to pick
//        case empty
//        /// Already sold by woman or man
//        case sold
//        /// Being selected
//        case selected
//        /// Already sold by woman
//        case soldWoman
//        /// Already sold by man
//        case soldMan
//        /// Not a seat. Can not be able to select
//        case none
//    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
