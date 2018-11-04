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
import CoreLocation

class CheckoutController: UIViewController {
    var parkingSpot: parking_spot?
    var reservation: reservation?
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var map: MKMapView!
    
    
    func coordinates(forAddress address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) {
            (placemarks, error) in
            guard error == nil else {
                print("Geocoding error: \(error!)")
                completion(nil)
                return
            }
            completion(placemarks?.first?.location?.coordinate)
        }
    }
    
    //this is working
    func openMapForPlace() {
        
        let address = parkingSpot?.address
        coordinates(forAddress: address ?? "" ) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            let lat = location.latitude
            let long = location.longitude
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let annotation = MKPointAnnotation()
            let centerCoordinate = CLLocationCoordinate2D(latitude: lat, longitude:long)
            annotation.coordinate = centerCoordinate
            annotation.title = "Destination"
            
           self.map.addAnnotation(annotation)
            self.map.setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: true)
        }
        
        
        
    }
    
    //this is working
    override func viewDidLoad() {
        super.viewDidLoad()
        address.text = parkingSpot?.address
        price.text = String(format: "U$ %.2f", parkingSpot?.min_price_hour ?? 0.0)
        distance.text = "5 miles"
        openMapForPlace()
        
    }
}
