//
//  ResultsController.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit

class ResultsController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var parking_lot: UIButton!
    @IBOutlet weak var private_parking: UIButton!
    @IBOutlet weak var list_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    
    var selected_spot:parking_spot?
    var selected_time:(start: Int, end: Int)?
    
    var array  = [parking_spot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for park in parking_spot.MOCK_DATA {
            array.append(park)
        }
        
        display_spots()
    }
    
    @IBAction func parking_lot_button(_ sender: UIButton) {
        for v in self.list_view.subviews {
            v.removeFromSuperview()
        }
        self.array.removeAll()
        
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
        display_spots()
        self.viewDidLoad()
    }
    
    func display_spots() {
        let h = 140
        let w = self.list_view.frame.width
        self.scroll_view.contentSize.height = CGFloat((h + 10) * array.count)
        self.scroll_view.updateConstraints()
        self.list_view.updateConstraints()
        
        var i = 0, k = 0
        for spot in array {
            if (parking_lot.isSelected && spot.type == 1) || (private_parking.isSelected && spot.type == 2)  {
                let newview = result_view(frame: CGRect(x: 0, y: (h + 10) * (i), width: Int(w), height: h))
                
                newview.type_icon.image = UIImage(named: (spot.type == 1) ? "parking_lot" : "house")
                newview.time_distance.text = "5 min"
                newview.total_price.text = "U$" + String(format: "%.2f", spot.min_price_hour)
                
                // Add Gesture Recognizer
                let tap = UITapGestureRecognizer(target: self, action: #selector(result_selected(sender:)))
                newview.addGestureRecognizer(tap)
                newview.isUserInteractionEnabled = true
                
                newview.spot = spot
                
                self.scroll_view.addSubview(newview)
                i = i + 1
            }
            k = k + 1
        }
    }
    
    @objc func result_selected(sender: UITapGestureRecognizer) {
        if let view = sender.view as? result_view {
            selected_spot = view.spot
            self.performSegue(withIdentifier: "result_segue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CheckoutController
        {
            let vc = segue.destination as! CheckoutController
            vc.parkingSpot = selected_spot
        }
    }
}
