//
//  reservation.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class reservation: NSObject {
    let contractee  : user // Person who hired the service
    let contractor  : user // Person who provided the parking spot
    let parking     : parking_spot
    var start_time  : Date
    var end_time    : Date
    var price_hour  : Double
    var price_total : Double?
    
    
    init(contractee: user, contractor: user, parking: parking_spot, start_time: Date, end_time: Date, price_hour: Double) {
        self.contractee  = contractee
        self.contractor  = contractor
        self.parking     = parking
        self.start_time  = start_time
        self.end_time    = end_time
        self.price_hour  = price_hour
    }
}
