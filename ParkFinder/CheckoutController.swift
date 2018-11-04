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
    var reservation: String?
    var time: String?
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var reservation_time: UILabel!
    
    
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
    
    @IBAction func openmaps(_ sender: UIButton) {
        let address = parkingSpot?.address
        coordinates(forAddress: address ?? "" ) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            let lat = location.latitude
            let long = location.longitude
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(lat, long)
            let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = address
        mapItem.openInMaps(launchOptions: options)
        }
    }
    //this is working
    override func viewDidLoad() {
        super.viewDidLoad()
        address.text = parkingSpot?.address
        self.reservation_time.text = self.reservation
        price.text = String(format: "U$ %.2f", parkingSpot?.min_price_hour ?? 0.0)
        distance.text = time
        openMapForPlace()
    }
}
