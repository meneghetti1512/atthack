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
    var latitude: Double!
    var longitude: Double!
    var address = "Notre Dame"
    

    //this is working
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
    
    // working but not in use
    func display(address: String){
        let camera = GMSCameraPosition.camera(withLatitude: 0.0, longitude: 0.0, zoom: 1.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
        marker.title = "Fitzpatrick Hall of Carteation"
        marker.snippet = "Indiana"
        marker.map = mapView}
    
    //this is working
    public func openMapForPlace(lat:Double = 0, long:Double = 0, placeName:String = "") {
        let latitude: CLLocationDegrees = lat
        let longitude: CLLocationDegrees = long
        
        let regionDistance:CLLocationDistance = 100
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: options)
    }
    //this is working
    override func viewDidLoad() {
        coordinates(forAddress: address) {
            (location) in
            guard let location = location else {
                // Handle error here.
                return
            }
            self.openMapForPlace(lat: location.latitude, long: location.longitude)
        }
    }
}

