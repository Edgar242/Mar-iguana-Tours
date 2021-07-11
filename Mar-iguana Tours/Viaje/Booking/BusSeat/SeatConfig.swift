//
//  SeatConfig.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 06/07/21.
//

import ALBusSeatView

class SeatConfig: ALBusSeatViewConfig {
    
    override init() {
        super.init()
//        seatSelectedBGColor = UIColor(red: 21.0 / 255.0, green: 202.0 / 255.0, blue: 128.0 / 255.0, alpha: 1.0)
        seatSelectedBGColor = UIColor(named: "mySecondaryColor")!
//        seatSoldWomanBGColor = UIColor(red: 1.0, green: 95.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        seatSoldWomanBGColor = UIColor(named: "myErrorColor")!
        seatSoldManBGColor = UIColor(red: 61.0 / 255.0, green: 145.0 / 255.0, blue: 1.0, alpha: 1.0)
        seatSoldManBGColor = UIColor(named: "myErrorColor")!
        
        seatShadowColor = UIColor(red: 146.0 / 255.0, green: 184.0 / 255.0, blue: 202.0 / 255.0, alpha: 0.5)
        busFrontImage = UIImage(named: "bus-front-view")
        busFrontImageWidth = 130
        floorSeperatorImage = UIImage(named: "bus-docker-front-view")
        seatRemoveImage = UIImage(named: "iconRemoveButton")
        floorSeperatorWidth = 60
        centerHallInfoText = "¡Desliza hacia los lados!"
        centerHallInfoTextColor = UIColor.label
        centerHallHeight = 40
        tooltipText = "Reservar"
    }
    
}
