//
//  TableViewCell.swift
//  Mar-iguana Tours
//
//  Created by Aplicaciones on 09/03/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var travelTitle : UILabel!
    @IBOutlet var travelPrice : UILabel!
    @IBOutlet var travelSchedule : UILabel!
    @IBOutlet var travelImage : UIImageView!
    @IBOutlet var starImage1 : UIImageView!
    @IBOutlet var starImage2 : UIImageView!
    @IBOutlet var starImage3 : UIImageView!
    @IBOutlet var starImage4 : UIImageView!
    @IBOutlet var starImage5 : UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
