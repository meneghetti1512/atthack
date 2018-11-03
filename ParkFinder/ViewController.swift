//
//  ViewController.swift
//  ParkFinder
//
//  Created by Pedro Lopes on 11/2/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation
import GooglePlaces


class ViewController: UIViewController{
    
    
    @IBOutlet weak var table: UIView!
    @IBOutlet weak var destination: UITextField!
    @IBOutlet weak var map: MKMapView!
    var latitude: Double!
    var longitude: Double!
    @IBOutlet weak var roundedbutton: UIButton!
    
    //this is working
    
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
    
    
    func display(lat: Double, long: Double){

        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        map.setRegion(MKCoordinateRegion(center: coordinate, span: span), animated: false)
        
    }

    @IBAction func search(_ sender: UIButton) {
        let address = destination.text
        coordinates(forAddress: address ?? "") {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            self.display(lat: location.latitude, long: location.longitude)
        }
    }
    
    //this is working
    override func viewDidLoad() {
        destination.layer.borderColor = UIColor.black.cgColor
        destination.layer.borderWidth = 1
        destination.layer.cornerRadius = 5
        
        self.destination.text = "Destination"
    }
}






