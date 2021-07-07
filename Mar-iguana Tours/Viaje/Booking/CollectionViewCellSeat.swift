//
//  CollectionViewCellSeat.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 06/07/21.
//

import UIKit

class CollectionViewCellSeat: UICollectionViewCell {
    
    @IBOutlet weak var seatNumber: UILabel!
    
    func configure(with number: Int) {
        if number < 1 {
            seatNumber.text = ""
            return
        }
        seatNumber.text = String(number)
    }
}
