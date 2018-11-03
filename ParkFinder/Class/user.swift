//
//  user.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class user: NSObject {
    
    var name          : String
    var phone         : String
    var license_plate : String
    var ratings       : [Int]?
    
    init(name: String, phone: String, license_plate: String) {
        self.name          = name
        self.phone         = phone
        self.license_plate = license_plate
    }
    
}
