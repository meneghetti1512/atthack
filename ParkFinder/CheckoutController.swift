//
//  CheckoutController.swift
//  ParkFinder
//
//  Created by Gabriel on 11/3/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class CheckoutController: UIViewController {
    @IBOutlet weak var checkoutMap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userCoordinate = CLLocationCoordinate2D(latitude: 41.7002, longitude: -86.2379)
        let eyeCoordinate = CLLocationCoordinate2D(latitude: 41.8002, longitude: -86.1379)
        let mapCamera = MKMapCamera(lookingAtCenter: userCoordinate, fromEyeCoordinate: eyeCoordinate, eyeAltitude: 400.0)
        
        checkoutMap.setCamera(mapCamera, animated: true)
        // Do any additional setup after loading the view.
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
