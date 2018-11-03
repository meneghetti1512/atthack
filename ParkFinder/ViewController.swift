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



class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBOutlet weak var mainMap: MKMapView!
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 41.7002, longitude: -86.2379, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 41.7002, longitude: -86.2379)
        marker.title = "Fitzpatrick Hall of Carteation"
        marker.snippet = "Indiana"
        marker.map = mapView
        

    }
    
}

