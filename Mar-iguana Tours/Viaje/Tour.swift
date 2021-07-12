//
//  Tour.swift
//  Mar-iguana Tours
//
//  Created by Diana Morales on 01/07/21.
//

import Foundation
struct Tour{
    
    let id: Int
    let title: String
    let price: Int
    let dates: [String]
    let rating: Float
    let images: [String]
    let info: String
    let itinerary: [String]
    let promo:String
    let roomOptions: [String]
    let urlInfoWeb:String
    
    
    init(id:Int, title: String, price: Int, dates: [String], rating: Float, images: [String], info: String,
             itinerary: [String], promo:String, roomOptions: [String], urlInfoWeb:String) {
            self.id = id
            self.title = title
            self.price = price
            self.dates = dates
            self.rating = rating
            self.images = images
            self.info = info
            self.itinerary = itinerary
            self.promo = promo
            self.roomOptions = roomOptions
            self.urlInfoWeb = urlInfoWeb
        }
    
    init?(jsonTour: [String: Any]) {
        guard let id = jsonTour["id"] as? Int,
            let title = jsonTour["title"] as? String,
            let price = jsonTour["price"] as? Int,
            let dates = jsonTour["dates"] as? [String],
            let rating = jsonTour["rating"] as? Float,
            let images = jsonTour["images"] as? [String],
            let info = jsonTour["info"] as? String,
            let itinerary = jsonTour["itinerary"] as? [String],
            let promo = jsonTour["promo"] as? String,
            let roomOptions = jsonTour["roomOptions"] as? [String],
            let urlInfoWeb = jsonTour["urlInfoWeb"] as? String
        else {
                    return nil
                }
        
        self.id = id
        self.title = title
        self.price = price
        self.dates = dates
        self.rating = rating
        self.images = images
        self.info = info
        self.itinerary = itinerary
        self.promo = promo
        self.roomOptions = roomOptions
        self.urlInfoWeb = urlInfoWeb
    }
}
