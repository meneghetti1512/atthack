//
//  ResultsController.swift
//  ParkFinder
//
//  Created by André Meneghetti on 03/11/18.
//  Copyright © 2018 Pedro Lopes. All rights reserved.
//

import UIKit
import WARangeSlider

class ResultsController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var parking_lot: UIButton!
    @IBOutlet weak var private_parking: UIButton!
//    @IBOutlet weak var list_view: UIView!
    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var slider: RangeSlider!
    @IBOutlet weak var time_range_text: UILabel!
    
    var selected_spot:parking_spot?
    var selected_time:String?
    
    var array  = [parking_spot]()
    var min_time = Int()
    var max_time = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for park in parking_spot.MOCK_DATA {
            array.append(park)
        }
        
        
        display_spots()
    }
    
    @IBAction func parking_lot_button(_ sender: UIButton) {
        for v in self.scroll_view.subviews {
            v.removeFromSuperview()
        }
        self.array.removeAll()
        
        if sender.isSelected {
            sender.isSelected = false
        }
        else {
            sender.isSelected = true
        }
        self.viewDidLoad()
    }
    
    func display_spots() {
        let h = 140
        let w = self.scroll_view.frame.width
//        self.list_view.updateConstraints()
        
        var i = 0, k = 0
        for spot in array {
            if (parking_lot.isSelected && spot.type == 1) || (private_parking.isSelected && spot.type == 2)  {
                let newview = result_view(frame: CGRect(x: 0, y: (h + 10) * (i), width: Int(w), height: h))
                
                newview.name.text = spot.name ?? "-"
                newview.picture.image = UIImage(named: spot.picture)
                newview.type_icon.image = UIImage(named: (spot.type == 1) ? "parking_lot" : "house")
                newview.address.text = spot.address
                newview.hour_price.text = "U$ " + String(format: "%.2f", spot.min_price_hour)
                newview.time_distance.text = String(Int.random(in: 3 ... 14))+" min"
                newview.rating.text = String(format: "%.1f", spot.rating)
                
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
        self.scroll_view.contentSize.height = CGFloat((h + 10) * i)
        self.scroll_view.updateConstraints()
    }
    
    @objc func result_selected(sender: UITapGestureRecognizer) {
        if let view = sender.view as? result_view {
            selected_spot = view.spot
            selected_time = view.time_distance.text
            self.performSegue(withIdentifier: "result_segue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CheckoutController
        {
            let vc = segue.destination as! CheckoutController
            vc.parkingSpot = selected_spot
            vc.reservation = self.time_range_text.text
            vc.time = selected_time
        }
    }

    @IBAction func range_slider_changed(_ sender: Any) {
//        self.slider.lowerValue = Double(Int(self.slider.lowerValue))
//        self.slider.upperValue = Double(Int(self.slider.upperValue))
        self.min_time = 100*Int(floor(self.slider.lowerValue/2)) + 30*(Int(self.slider.lowerValue) % 2)
        self.max_time = 100*Int(floor(self.slider.upperValue/2)) + 30*(Int(self.slider.upperValue) % 2)
        self.time_range_text.text = format_time(num: self.min_time) + " - " + format_time(num: self.max_time)
    }
    
    func format_time (num: Int) -> String {
        let str1 = String(Int(floor(Double(num)/100)))
        var str2 = String(num % 100)
        if str2 == "0" {
            str2 = "00"
        }
        return str1 + ":" + str2
    }
}
