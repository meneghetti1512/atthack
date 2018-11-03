//
//  parking_spot.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class parking_spot: NSObject {
    let type           : Int // Parking Lot = 1, Personal = 2
    var min_price_hour : Double
    var address        : String
    var availability   : [[Int]] // Nx7 matrix with availability for each day
    var ratings        : [Int]?
    
    init(type: Int, availability: [[Int]], min_price_hour: Double, address: String) {
        self.type           = type
        self.availability   = availability
        self.min_price_hour = min_price_hour
        self.address        = address
    }
}
