//
//  parking_spot.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class parking_spot: NSObject {
    var type           : Int // Parking Lot = 1, Personal = 2
    var name           : String?
    var min_price_hour : Double
    var address        : String
    var rating         : Double
    var availability   : [[(start: Int, end: Int)]] // Nx7 matrix with availability for each day
    var picture        : String
    
    init(type: Int, name: String?, min_price_hour: Double, address: String, rating: Double, availability: [[(start: Int, end: Int)]], picture: String) {
        self.type           = type
        self.name           = name
        self.min_price_hour = min_price_hour
        self.address        = address
        self.rating         = rating
        self.availability   = availability
        self.picture        = picture
    }
    
    static let MOCK_DATA: [parking_spot] = [
        parking_spot(type: 1,
                     name: "Quik Park Theater Lot LLC",
                     min_price_hour: 15.0,
                     address: "223 W 46th St, New York, NY",
                     rating: 3.3,
                     availability: [[(1, 1)]],
                     picture: "parking1"),
        parking_spot(type: 1,
                     name: "80 Car Park",
                     min_price_hour: 10.0,
                     address: "80 Park Ave, New York, NY",
                     rating: 4.1,
                     availability: [[(1, 1)]],
                     picture: "parking2"),
        parking_spot(type: 1,
                     name: "Impark",
                     min_price_hour: 13.0,
                     address: "305 W 42nd St, New York, NY",
                     rating: 4.3,
                     availability: [[(1, 1)]],
                     picture: "parking3"),
        parking_spot(type: 1,
                     name: "Icon Parking Systems",
                     min_price_hour: 13.5,
                     address: "15 W 70th St, New York, NY",
                     rating: 4.5,
                     availability: [[(1, 1)]],
                     picture: "parking4"),
        parking_spot(type: 1,
                     name: "LAZ Parking Lot",
                     min_price_hour: 12.0,
                     address: "300 W 31st St, New York, NY",
                     rating: 3.3,
                     availability: [[(1, 1)]],
                     picture: "parking5"),
        parking_spot(type: 2,
                     name: nil,
                     min_price_hour: 7.0,
                     address: "315 W 55th St, New York, NY",
                     rating: 4.0,
                     availability: [[(1, 1)]],
                     picture: "house1"),
        parking_spot(type: 2,
                     name: nil,
                     min_price_hour: 7.5,
                     address: "321 W 54th St, New York, NY",
                     rating: 3.2,
                     availability: [[(1, 1)]],
                     picture: "house2"),
        parking_spot(type: 2,
                     name: nil,
                     min_price_hour: 6.0,
                     address: "24 W 55th St, New York, NY",
                     rating: 4.5,
                     availability: [[(1, 1)]],
                     picture: "house3")
        ]
}
